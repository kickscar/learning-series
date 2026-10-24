#!/usr/bin/env bash
# Kubernetes Core 노드 사전 준비 (Rocky Linux 9): 02.01 본문 절차를 한 번에 적용한다
#
# 사용: sudo bash prepare-node.sh {이 노드의 클러스터 IP}
#   예: sudo bash prepare-node.sh 192.168.56.11
# 마지막에 재부팅한다
set -euo pipefail

NODE_IP="${1:?노드의 클러스터 IP를 인수로 지정한다 (예: 192.168.56.11)}"
K8S_MINOR="v1.36"

echo "[1/10] 패키지 갱신"
dnf -y update

echo "[2/10] 노드 이름 등록"
grep -q "192.168.56.10 cp" /etc/hosts || cat <<EOF >> /etc/hosts
192.168.56.10 cp
192.168.56.11 worker1
192.168.56.12 worker2
EOF

echo "[3/10] 시간 동기화 확인"
systemctl enable --now chronyd

echo "[4/10] swap 비활성화"
swapoff -a
sed -i '/\sswap\s/ s/^\([^#]\)/#\1/' /etc/fstab
# GPT의 swap 파티션은 fstab에 없으면 systemd가 유닛을 자동으로 만들어 켠다
# 설정을 다시 읽어 자동 생성된 swap 유닛을 드러낸 뒤 막는다
systemctl daemon-reload
for unit in $(systemctl list-units --type swap --all --plain --no-legend | awk '{print $1}'); do
  case "$(systemctl show -p FragmentPath --value "$unit")" in
    /run/systemd/generator*) systemctl mask "$unit" ;;
  esac
done

echo "[5/10] 커널 파라미터"
cat <<EOF > /etc/sysctl.d/k8s.conf
net.ipv4.ip_forward = 1
EOF
sysctl --system > /dev/null

echo "[6/10] containerd"
dnf config-manager --add-repo https://download.docker.com/linux/rhel/docker-ce.repo
dnf -y install containerd.io
containerd config default > /etc/containerd/config.toml
sed -i 's/SystemdCgroup = false/SystemdCgroup = true/' /etc/containerd/config.toml
systemctl enable --now containerd

echo "[7/10] SELinux permissive"
setenforce 0 || true
sed -i 's/^SELINUX=enforcing/SELINUX=permissive/' /etc/selinux/config

echo "[8/10] firewalld 비활성화"
if systemctl list-unit-files firewalld.service > /dev/null 2>&1 && systemctl cat firewalld > /dev/null 2>&1; then
  systemctl disable --now firewalld
fi

echo "[9/10] Kubernetes 패키지"
cat <<EOF > /etc/yum.repos.d/kubernetes.repo
[kubernetes]
name=Kubernetes
baseurl=https://pkgs.k8s.io/core:/stable:/${K8S_MINOR}/rpm/
enabled=1
gpgcheck=1
gpgkey=https://pkgs.k8s.io/core:/stable:/${K8S_MINOR}/rpm/repodata/repomd.xml.key
exclude=kubelet kubeadm kubectl cri-tools kubernetes-cni
EOF
dnf -y install kubelet kubeadm kubectl cri-tools --disableexcludes=kubernetes
cat <<EOF > /etc/crictl.yaml
runtime-endpoint: unix:///run/containerd/containerd.sock
EOF

echo "[10/10] kubelet 노드 IP와 기동"
echo "KUBELET_EXTRA_ARGS=--node-ip=${NODE_IP}" > /etc/sysconfig/kubelet
systemctl enable --now kubelet

echo "완료. 재부팅한다"
systemctl reboot

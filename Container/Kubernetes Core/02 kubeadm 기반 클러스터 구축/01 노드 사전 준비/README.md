# 02 kubeadm 기반 클러스터 구축 / 01 노드 사전 준비

세 노드를 `kubeadm` 이 요구하는 상태로 준비한다. 항목마다 갖추지 않았을 때의 결과를 정리하고, `cp` 노드에 하나씩 적용한 뒤 worker 노드는 같은 단계를 묶은 스크립트로 적용한다. 마지막에 `kubeadm` 실행 전의 전체 재시작 지점인 스냅샷 `clean` 을 만든다.

## What you will learn

- 패키지 갱신, 노드 이름 등록, 시간 동기화
- swap의 완전한 비활성화(`swapoff`, fstab, GPT swap 파티션의 자동 생성 유닛 mask)
- SELinux permissive, firewalld 비활성화와 구성 요소별 포트, 패킷 전달(`net.ipv4.ip_forward`)
- containerd 설치와 CRI 플러그인 활성화, `SystemdCgroup = true` 와 kubelet의 cgroup 드라이버 자동 감지
- `pkgs.k8s.io` 마이너 버전 저장소와 `exclude=` 버전 고정, kubelet · kubeadm · kubectl · crictl 설치
- 듀얼 NIC 노드의 kubelet 노드 IP(`--node-ip`)와 `kubeadm` 이전 kubelet의 재시작 대기 상태

## Source

- `prepare-node.sh` → 본문 1 ~ 9단계를 한 번에 적용하는 노드 준비 스크립트. 인수로 노드의 클러스터 IP를 받고 마지막에 재부팅한다 (`sudo bash prepare-node.sh 192.168.56.11`). 강의용 저장소의 `/02/01/prepare-node.sh` 와 같다

## Reference

- Notion: [Notion 문서]()

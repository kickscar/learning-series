# 02 kubeadm 기반 클러스터 구축 / 04 Control Plane 기동과 첫 접속

앞 섹션의 설정 파일로 `kubeadm init` 전체를 실행해 control plane 노드를 구축한다. 출력을 단계 구성과 대응시켜 읽고, kubectl 없이 노드에서 Control Plane이 static Pod로 기동한 것을 확인한 뒤 kubectl로 접속한다. 구축 직후 클러스터의 상태를 기록하고 스냅샷 `ch02-done` 을 생성한다.

## What you will learn

- static Pod와 mirror Pod, `staticPodPath` 와 manifest 디렉터리 감시, kubelet의 `activating` → `active (running)` 전환
- `kubeadm init` 출력의 단계별 해석(사전 검사, 신뢰 구조, Control Plane 기동, 클러스터 등록, 애드온과 조인 안내)과 조인 명령 보관
- `crictl` · `/etc/kubernetes` 구성 · apiserver manifest의 실행 옵션으로 확인하는 Control Plane
- `admin.conf` 로 kubectl 접속, 구축 직후 상태(`NotReady`, not-ready taint, CoreDNS `Pending`, `kube-proxy` Running)와 그 이유
- static Pod(`Node/cp`)와 DaemonSet Pod(`DaemonSet/kube-proxy`)의 소유자 구분, 서빙 인증서 CSR `Pending`

## Source

이 섹션은 앞 섹션의 `../03 PKI와 kubeconfig/kubeadm-config.yaml` 을 그대로 쓴다. `cp` 노드의 `~/k8s-core/02/03` 에서 실행한다.

## Reference

- Notion: [Notion 문서]()

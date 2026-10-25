# 02 kubeadm 기반 클러스터 구축 / 03 PKI와 kubeconfig

`kubeadm init` 의 `certs` · `kubeconfig` 단계만 먼저 실행해, 클러스터를 기동하기 전에 인증서와 kubeconfig를 파일로 확인한다. 구성 요소가 서로를 인증하는 구조와 관리자 kubeconfig가 둘로 나뉜 이유를 정리하고, 확인이 끝나면 생성물을 삭제해 시작 상태로 되돌린다.

## What you will learn

- 상호 TLS(mTLS)와 클라이언트 인증서의 CN · O가 사용자 이름 · 그룹이 되는 구조
- 클러스터 CA · etcd CA · front-proxy CA의 분리와 `etcd` 접근을 apiserver로 제한하는 근거, `openssl verify` 로 확인하는 CA · SAN 검증
- apiserver 인증서의 SAN(노드 이름, 클러스터 DNS 이름, `10.96.0.1`, advertise 주소 `192.168.56.10`)
- kubeconfig 구조(`clusters` · `users` · `contexts`)와 `admin.conf`(`kubeadm:cluster-admins`) · `super-admin.conf`(`system:masters`)의 분리
- `kubeadm certs check-expiration` 으로 보는 유효기간(CA 10년, 그 밖의 인증서 1년)

## Source

- `kubeadm-config.yaml` → 이 섹션과 다음 섹션의 `kubeadm` 명령이 쓰는 설정 파일. advertise 주소 `192.168.56.10`, `kubernetesVersion: v1.36.5`, Pod · Service 대역, `serverTLSBootstrap: true`. 강의용 저장소의 `/02/03/kubeadm-config.yaml` 과 같다

`cp` 노드의 `~/k8s-core/02/03` 에서 실행한다.

## Reference

- Notion: [Notion 문서]()

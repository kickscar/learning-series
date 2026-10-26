# 04 Pod 네트워크와 CNI / 03 Calico 설치

Calico를 설치해 클러스터를 정상 상태로 전환한다. 노드에 인터페이스가 둘 있는 실습 환경에서 Calico의 기본 설정이 일으키는 문제와 대응을 정리하고, 설치 뒤 노드와 CoreDNS의 상태 전환, 노드의 경로, 서로 다른 노드의 Pod 사이 통신을 확인한 뒤 스냅샷 `ch04-done` 을 생성한다.

## What you will learn

- Calico 설치 방식(manifest와 operator)과 `calico-node` DaemonSet · `calico-kube-controllers` 의 역할
- 듀얼 NIC 환경에서 노드 주소 자동 감지 기본값 `first-found` 의 문제와 `kubernetes-internal-ip` · `interface` 대응
- IP pool(`CALICO_IPV4POOL_CIDR=10.244.0.0/16`)과 IP-in-IP 캡슐화, 노드의 `tunl0` 경로와 `/26` 블록
- 노드 `Ready` 전환, not-ready taint 제거, CoreDNS · 애드온의 배치(가장 먼저 Ready가 된 노드)
- 서로 다른 노드의 Pod 간 통신과 클러스터 DNS 확인, 스냅샷 `ch04-done`

## Source

- `calico.yaml` → Calico v3.33.0 원본 매니페스트(`https://raw.githubusercontent.com/projectcalico/calico/v3.33.0/manifests/calico.yaml`)에서 두 곳을 바꾼 파일. `calico-node` 컨테이너 환경 변수에 `IP_AUTODETECTION_METHOD=kubernetes-internal-ip` 를 추가하고, `CALICO_IPV4POOL_CIDR` 주석을 해제해 `10.244.0.0/16` 으로 지정했다. 강의용 저장소의 `/04/03/calico.yaml` 과 같다

`cp` 노드의 `~/k8s-core/04/03` 에서 `kubectl apply -f calico.yaml` 로 적용한다.

## Reference

- Notion: [Notion 문서]()

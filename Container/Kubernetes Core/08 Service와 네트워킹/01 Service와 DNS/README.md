# 08 Service와 네트워킹 / 01 Service와 DNS

Pod IP가 변경되어도 유지되는 고정 접근 지점으로 Service를 구성한다. Service가 Label로 Pod를 선택하는 방식, Service와 Pod IP를 연결하는 EndpointSlice, Service 이름이 ClusterIP로 해석되는 방식을 확인한다.

## What you will learn

- Label Selector 기반 Service와 ClusterIP, ClusterIP가 각 노드의 kube-proxy 변환 규칙으로 구현되는 가상 IP라는 것(`ping` 미응답)
- EndpointSlice 컨트롤러가 기록하는 Pod IP와 Pod 교체에 따른 갱신, kube-proxy가 이 정보로 갱신하는 노드의 변환 규칙(iptables DNAT) 예시
- readinessProbe 실패 시 주소가 EndpointSlice에 `Ready: false` 로 기록되어 요청 대상에서 제외되는 것
- Service DNS 이름(`{Service 이름}.{Namespace}.svc.cluster.local`), Pod의 `/etc/resolv.conf`(`nameserver` → `kube-dns` Service → CoreDNS Pod, `search` 검색 목록), 같은 Namespace와 다른 Namespace의 이름 해석 차이

## Lab

| Lab | 내용 | 디렉터리 |
|-----|------|---------|
| lab01: ClusterIP와 DNS | ClusterIP와 EndpointSlice 확인, Pod 교체와 readinessProbe 실패에 따른 EndpointSlice 변화, CoreDNS Pod와 `kube-dns` EndpointSlice 확인, 진단용 Pod에서 `getent hosts` 로 Namespace별 이름 해석 확인 | `lab01/` |

| 파일 | 내용 |
|------|------|
| `namespace.yaml` | Namespace `lab01` |
| `deployment.yaml` | Deployment `lab01-web` (`nginx:1.30`, 복제본 3개, readinessProbe `/index.html`) |
| `service.yaml` | ClusterIP Service `lab01-web-svc` |
| `client.yaml` | 진단용 Pod `lab01-client` (`nicolaka/netshoot:v0.15`) |

`cp` 노드의 `~/k8s-core/08/01/lab01` 에서 실행한다. 자원 정리의 Namespace 삭제는 진단용 Pod의 종료 유예 시간 때문에 40초 정도 소요된다.

## Reference

- Notion: [Notion 문서]()

# 08 Service와 네트워킹 / 02 외부 노출과 LoadBalancer 구현체

ClusterIP로 구성한 Service를 클러스터 외부에 노출한다. 노드의 포트로 노출하는 NodePort와 외부 주소를 할당받는 LoadBalancer를 확인하고, kubeadm 클러스터에 없는 LoadBalancer 구현체(MetalLB L2 모드)를 설치해 주소 대역을 구성한다.

## What you will learn

- Service 타입의 누적 구조(`ClusterIP` ⊂ `NodePort` ⊂ `LoadBalancer`), NodePort로 Pod가 없는 노드에서도 요청이 전달되는 것
- 환경별 LoadBalancer 구현체(관리형 Kubernetes의 클라우드 컨트롤러, 직접 구축한 클라우드 VM의 CCM, 로컬 · 온프레미스의 MetalLB)와 구현체가 없을 때의 `<pending>`
- MetalLB L2 모드의 동작과 한계(광고 노드 한 대가 수신하는 단일 진입 주소, 노드 단위 분산이 아님)
- `externalTrafficPolicy` `Cluster` 의 출발지 주소 변환(SNAT)과 노드 간 홉, `Local` 의 클라이언트 주소 보존과 분배 불균등

## 클러스터 작업

MetalLB v0.16.1을 공식 저장소의 `metallb-native.yaml` 로 설치하고, `metallb-config.yaml` 로 주소 대역(`192.168.56.50` ~ `192.168.56.59`)과 L2 광고를 구성한다. 설치한 MetalLB는 이후 장에서 계속 사용한다.

| 파일 | 내용 |
|------|------|
| `metallb-config.yaml` | IPAddressPool `lab-pool` + L2Advertisement `lab-l2` |

## Lab

| Lab | 내용 | 디렉터리 |
|-----|------|---------|
| lab01: NodePort와 LoadBalancer | NodePort로 세 노드 접속과 접속 로그의 출발지 주소, LoadBalancer로 변경해 외부 주소 할당 · 접속, `externalTrafficPolicy: Local` 의 클라이언트 주소 보존 | `lab01/` |

| 파일 | 내용 |
|------|------|
| `lab01/namespace.yaml` | Namespace `lab01` |
| `lab01/deployment.yaml` | Deployment `lab01-web` (`nginx:1.30`, 복제본 2개) |
| `lab01/service.yaml` | Service `lab01-web-svc` |

`lab01/service.yaml` 은 실습을 마친 최종 내용(`type: LoadBalancer`, `externalTrafficPolicy: Local`)이다. 실습은 `type: NodePort` 로 시작해 2단계에서 `LoadBalancer` 로, 3단계에서 `externalTrafficPolicy: Local` 을 추가한다.

`cp` 노드의 `~/k8s-core/08/02` 에서 실행하고, 접속 확인은 학습자 호스트에서 실행한다. 클라우드 VM 환경은 MetalLB 설치와 주소 할당까지 진행하고, 접속 확인은 노드의 공인 IP와 NodePort로 진행한다.

## Reference

- Notion: [Notion 문서]()

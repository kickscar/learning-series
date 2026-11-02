# 08 Service와 네트워킹 / 03 Gateway API

HTTP 요청의 내용(경로 · 호스트 이름 · 헤더)을 기준으로 라우팅을 정의하는 Gateway API를 다룬다. Gateway API CRD와 구현체(Envoy Gateway)를 설치하고, 경로 · 호스트 · 헤더 기준 라우팅과 트래픽 분할을 확인한다.

## What you will learn

- 주소와 포트 단위로 요청을 전달하는 Service 타입의 한계와 Gateway API의 리소스 역할 분리(GatewayClass · Gateway · HTTPRoute)
- CRD와 구현체의 관계, Gateway를 생성하면 구현체가 Envoy 프록시와 LoadBalancer Service를 생성하는 구조
- HTTPRoute의 일치 조건(경로 · 호스트 이름 · 헤더)과 규칙의 우선순위(호스트 이름 > 경로, 긴 경로 > 헤더)
- `weight` 비율값을 이용한 트래픽 분할
- `kubernetes/ingress-nginx` 컨트롤러의 지원 종료와 Ingress API의 구분, 기존 Ingress 매니페스트의 Gateway API 필드 대응

## 클러스터 작업

Envoy Gateway v1.9.3을 공식 릴리스의 `install.yaml` 로 설치(`kubectl apply --server-side`)하고, `gatewayclass.yaml` 로 GatewayClass `eg` 를 생성한다. 설치 매니페스트가 Gateway API v1.6.1 CRD를 함께 설치한다. 설치한 Envoy Gateway와 GatewayClass는 이후 장에서 계속 사용한다.

| 파일 | 내용 |
|------|------|
| `gatewayclass.yaml` | GatewayClass `eg` (`controllerName: gateway.envoyproxy.io/gatewayclass-controller`) |

## Lab

| Lab | 내용 | 디렉터리 |
|-----|------|---------|
| lab01: Gateway와 HTTPRoute | Gateway 생성과 Envoy 프록시 · LoadBalancer Service 확인, 경로 · 호스트 · 헤더 기준 라우팅과 우선순위 | `lab01/` |
| lab02: 트래픽 분할 | `weight` `90/10` · `9/1` · `90/0` 의 100회 요청 분배 | `lab02/` |

| 파일 | 내용 |
|------|------|
| `lab01/namespace.yaml` | Namespace `lab01` |
| `lab01/gateway.yaml` | Gateway `lab01-gw` (GatewayClass `eg`, 리스너 `http` `80`) |
| `lab01/backend-a.yaml` · `lab01/backend-b.yaml` | Deployment · Service `lab01-a` · `lab01-b` (`traefik/whoami:v1.12.0`) |
| `lab01/httproute.yaml` | HTTPRoute `lab01-route` (경로 `/a` · `/b`, 헤더 `x-version: b`, 경로 `/`) |
| `lab01/httproute-host.yaml` | HTTPRoute `lab01-host-route` (호스트 이름 `b.lab01.k8score`) |
| `lab02/namespace.yaml` | Namespace `lab02` |
| `lab02/gateway.yaml` | Gateway `lab02-gw` |
| `lab02/backend-a.yaml` · `lab02/backend-b.yaml` | Deployment · Service `lab02-a` · `lab02-b` (`traefik/whoami:v1.12.0`) |
| `lab02/httproute.yaml` | HTTPRoute `lab02-route` (`weight` `90` · `0`) |

`lab01/httproute.yaml` 은 실습을 마친 최종 내용이다. 실습은 경로 규칙 두 개(`/a` · `/b`)로 시작해 5단계에서 헤더 규칙과 경로 `/` 규칙을 추가한다. `lab02/httproute.yaml` 도 최종 내용(`90` · `0`)이며, 실습은 `90` · `10` 으로 시작해 `9` · `1`, `90` · `0` 으로 변경한다.

`cp` 노드의 `~/k8s-core/08/03` 에서 실행하고, 요청도 `cp` 노드에서 전송한다. 클라우드 VM 환경에서 클러스터 외부의 호스트로 접속하려면 프록시 Pod가 실행 중인 노드의 공인 IP와 프록시 Service의 NodePort를 사용한다. 프록시 Service는 `externalTrafficPolicy: Local` 이다.

## Reference

- Notion: [Notion 문서]()

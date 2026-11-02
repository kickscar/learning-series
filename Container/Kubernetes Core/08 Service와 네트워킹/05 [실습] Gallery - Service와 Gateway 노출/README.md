# 08 Service와 네트워킹 / 05 [실습] Gallery: Service와 Gateway 노출

앞 장에서 리소스 요청과 분산 배치를 지정한 Gallery에 ClusterIP Service를 연결하고, Gateway와 HTTPRoute로 클러스터 외부에서 고정 주소로 접속하는 경로를 구성한다. Pod 하나에 고정되던 `port-forward` 접속을 Service와 Gateway로 대체하고, 요청이 두 Gallery Pod로 분배되는 것을 확인한다. 이 장의 마지막 섹션으로, 끝에서 스냅샷 `ch08-done` 을 생성한다.

## What you will learn

- Gallery Pod 2개에 연결한 ClusterIP Service(`80` → `8080`)와 EndpointSlice에 기록되는 Pod IP
- Gateway 생성 시 Envoy Gateway가 생성하는 프록시 Pod · LoadBalancer Service와 MetalLB가 할당하는 외부 주소
- HTTPRoute로 Gateway와 Gallery Service를 연결하는 구성, 프록시가 EndpointSlice의 Pod IP로 요청을 직접 전달하는 경로
- 호스트 브라우저의 Gateway 주소 접속과 두 Gallery Pod로의 요청 분배
- 요청이 분배되면서 드러나는 업로드 파일의 Pod별 저장 문제(다음 장의 영구 스토리지로 해결)

## Gallery Project

- Gallery: Service와 Gateway 노출 → 앞 장 구성(Gallery `dkrcore/gallery:2.0` Deployment `replicas: 2` · 분산 제약 · requests · limits, MariaDB `mariadb:11.8` Deployment, PodDisruptionBudget `gallery-app-pdb`, Service `gallery-db-svc`)에 Service `gallery-app-svc`(ClusterIP), Gateway `gallery-gw`(GatewayClass `eg`, 주소 `192.168.56.50`), HTTPRoute `gallery-route` 를 추가했다. 다음 장 Gallery 실습의 시작 구성이다

## Source

- `gallery/` → 이번 실습을 마친 매니페스트(`namespace.yaml`, `db-service.yaml`, `db-deployment.yaml`, `app-deployment.yaml`, `app-pdb.yaml`, `app-service.yaml`, `gateway.yaml`, `httproute.yaml`). 07.05 Gallery의 매니페스트를 복사해 `app-service.yaml`, `gateway.yaml`, `httproute.yaml` 을 추가했다. 강의용 저장소의 `08/05/gallery` 와 같다
- `httproute.yaml` 은 모든 경로(`PathPrefix: /`)의 요청을 `gallery-app-svc` 의 `80` 포트로 전달한다

`cp` 노드의 `~/k8s-core/08/05/gallery` 에서 실행하고, 접속 확인은 학습자 호스트의 브라우저에서 Gateway 주소로 한다. 클라우드 VM 환경은 프록시 Service가 `externalTrafficPolicy: Local` 이므로 프록시 Pod가 실행 중인 노드의 공인 IP와 프록시 Service의 NodePort로 접속한다. 리소스는 삭제하지 않고 다음 장에서 계속 사용하며, 스냅샷 `ch08-done` 생성은 본문의 절차에 따라 학습자 호스트에서 실행한다.

## Reference

- Notion: [Notion 문서]()

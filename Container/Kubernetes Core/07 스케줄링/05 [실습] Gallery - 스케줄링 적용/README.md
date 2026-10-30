# 07 스케줄링 / 05 [실습] Gallery: 스케줄링 적용

앞 장에서 Deployment로 배포한 Gallery와 MariaDB에 리소스 요청과 상한, 분산 배치, PodDisruptionBudget을 적용한다. 실제 사용량을 근거로 requests와 limits를 결정하고, Gallery의 복제본 수를 2개로 변경해 worker 노드에 하나씩 배치한다. worker 노드 하나를 drain하는 동안 Gallery가 계속 응답하는 것을 확인한다. 이 장의 마지막 섹션으로, 끝에서 스냅샷 `ch07-done` 을 생성한다.

## What you will learn

- `kubectl top` 으로 관찰한 사용량을 근거로 한 requests · limits 결정, QoS 클래스가 `BestEffort` 에서 `Burstable` 로 변경되는 것
- CPU limits를 지정하지 않는 이유(시작 지연과 livenessProbe 실패), 메모리 limits와 JVM 힙 상한의 관계
- MariaDB를 먼저 교체하고 Gallery를 나중에 교체하는 적용 순서(데이터베이스 재생성과 테이블 생성 시점)
- `topologySpreadConstraints` 로 복제본 2개를 worker 노드에 분산 배치, `minAvailable: 1` PDB
- drain 중 `ALLOWED DISRUPTIONS` 의 변화, drain된 노드가 분산 계산에서 제외되는 것, 응답이 유지되는 이유(분산 배치)와 PDB의 역할 구분
- `uncordon` 으로 복원한 뒤에도 Pod 배치가 변경되지 않는 것과 Pod 재생성을 이용한 재분산

## Gallery Project

- Gallery: 스케줄링 적용 → Gallery `dkrcore/gallery:2.0` Deployment(`replicas: 2`, 분산 제약, requests `100m` · `256Mi`, limits `512Mi`)와 MariaDB `mariadb:11.8` Deployment(`replicas: 1`, `Recreate`, requests `100m` · `192Mi`, limits `512Mi`), PodDisruptionBudget `gallery-app-pdb`(`minAvailable: 1`), Service `gallery-db-svc`. 다음 장 Gallery 실습의 시작 구성이다

## Source

- `gallery/` → 이번 실습을 마친 매니페스트(`namespace.yaml`, `db-service.yaml`, `db-deployment.yaml`, `app-deployment.yaml`, `app-pdb.yaml`). 06.06 Gallery의 매니페스트를 복사해 리소스 설정, 분산 제약, PDB를 추가했다. 강의용 저장소의 `07/05/gallery` 와 같다
- `app-deployment.yaml` 은 리소스 설정과 분산 제약(`replicas: 2`)을 모두 적용한 상태다. 실습은 06.06의 `replicas: 1` 매니페스트로 시작한다

`cp` 노드의 `~/k8s-core/07/05/gallery` 에서 실행한다. drain은 `--pod-selector=app=gallery-app` 으로 Gallery Pod만 축출하고, drain된 노드는 `kubectl uncordon` 으로 복원한다. 리소스는 삭제하지 않고 다음 장에서 계속 사용하며, 스냅샷 `ch07-done` 생성은 본문의 절차에 따라 학습자 호스트에서 실행한다.

## Reference

- Notion: [Notion 문서]()

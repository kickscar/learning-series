# 05 매니페스트와 Pod / 06 [실습] Gallery: Pod로 첫 실행

Docker Core에서 완성한 Gallery 이미지(`dkrcore/gallery:1.0`)와 MariaDB를 클러스터에서 Pod로 처음 실행한다. Init Container로 데이터베이스가 준비될 때까지 Gallery의 시작을 늦추고, Spring Boot의 상태 엔드포인트로 liveness와 readiness를 판정한다. Gallery Pod를 삭제해 직접 생성한 Pod는 다시 생성되지 않고 업로드한 파일도 사라지는 것을 확인한다. 이 장의 마지막 섹션으로, 끝에서 스냅샷 `ch05-done` 을 생성한다.

## What you will learn

- MariaDB Pod와 접속 주소 Service(`gallery-db-svc`), `healthcheck.sh` readinessProbe
- Init Container(`wait-db`, `nc -z`)로 데이터베이스 대기, Init Container가 끝난 뒤 앱 컨테이너 이미지를 다운로드하는 시작 순서
- Spring Boot Actuator의 liveness · readiness 엔드포인트, startupProbe를 두지 않는 판단
- `kubectl port-forward --address 0.0.0.0` 으로 호스트 브라우저 접속, 업로드 파일과 데이터베이스 기록의 저장 위치
- 직접 생성한 Pod는 삭제되면 다시 생성되지 않고, 컨테이너 안의 파일은 컨테이너와 함께 사라진다

## Gallery Project

- Gallery: Pod로 첫 실행 → `dkrcore/gallery:1.0` 과 `mariadb:11.8` 을 Pod로 실행한다. 다음 장의 Gallery 실습이 이 매니페스트를 Deployment로 전환한다

## Source

- `gallery/` → 이번 실습의 매니페스트(`namespace.yaml`, `db-pod.yaml`, `db-service.yaml`, `app-pod.yaml`). 강의용 저장소의 `05/06/gallery` 와 같다
- 비밀번호는 Docker Core Gallery 실습과 같은 값을 매니페스트 환경 변수로 둔다. 비밀값 분리는 뒤 장에서 다룬다

`cp` 노드의 `~/k8s-core/05/06/gallery` 에서 실행한다. 실습 자원은 정리하고, 스냅샷 `ch05-done` 생성은 본문의 절차를 따라 학습자 호스트에서 실행한다.

## Reference

- Notion: [Notion 문서]()

# 06 워크로드 컨트롤러 / 06 [실습] Gallery: Kubernetes 첫 배포

앞 장에서 Pod로 실행한 Gallery와 MariaDB를 Deployment로 배포한다. Pod 매니페스트가 Deployment의 `template` 이 되는 것을 확인하고, 자동 복구, 롤링 업데이트(`1.0` → `2.0`), 이미지 다운로드 실패와 되돌리기를 실제 애플리케이션에 적용한다. 데이터가 Pod와 함께 사라지는 문제를 확인한다. 이 장의 마지막 섹션으로, 끝에서 스냅샷 `ch06-done` 을 생성한다.

## What you will learn

- Pod 매니페스트의 Deployment 전환(`diff -w` 로 보는 `replicas` · `selector` · `strategy` · `template` 추가), MariaDB `Recreate` 와 Gallery `RollingUpdate`
- `replicas: 1` 에서 `maxSurge` 1 · `maxUnavailable` 0으로 새 Pod를 먼저 생성하는 교체 순서, 종료 코드 `143` 의 의미
- Pod 삭제 시 ReplicaSet 컨트롤러의 재생성, `port-forward` 의 Pod 단위 연결
- 존재하지 않는 이미지의 `ImagePullBackOff` 와 멈춘 롤아웃, 파일 되돌리기로 같은 `template` 의 ReplicaSet 재사용
- 컨테이너와 함께 사라지는 업로드 파일과 데이터베이스 데이터, 데이터베이스 오류 중에도 Ready인 Pod(Probe가 검사하는 범위)

## Gallery Project

- Gallery: Kubernetes 첫 배포 → Gallery `dkrcore/gallery:2.0` Deployment(`replicas: 1`, `RollingUpdate`)와 MariaDB `mariadb:11.8` Deployment(`replicas: 1`, `Recreate`), Service `gallery-db-svc`. 다음 장 Gallery 실습의 출발 상태다

## Source

- `gallery/` → 이번 실습을 마친 매니페스트(`namespace.yaml`, `db-service.yaml`, `db-deployment.yaml`, `app-deployment.yaml`). 05.06 Gallery의 Pod 매니페스트를 Deployment로 전환했다. 강의용 저장소의 `06/06/gallery` 와 같다
- `app-deployment.yaml` 은 롤링 업데이트를 마친 `dkrcore/gallery:2.0` 상태다. 실습은 `1.0` 으로 시작한다

`cp` 노드의 `~/k8s-core/06/06/gallery` 에서 실행한다. 리소스는 정리하지 않고 다음 장으로 넘기며, 스냅샷 `ch06-done` 생성은 본문의 절차를 따라 학습자 호스트에서 실행한다.

## Reference

- Notion: [Notion 문서]()

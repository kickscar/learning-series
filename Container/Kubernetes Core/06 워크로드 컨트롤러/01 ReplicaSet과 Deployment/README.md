# 06 워크로드 컨트롤러 / 01 ReplicaSet과 Deployment

Pod를 직접 다루는 대신 원하는 개수를 선언하고 컨트롤러가 유지하게 하는 ReplicaSet과 Deployment를 다룬다. Deployment · ReplicaSet · Pod의 3계층 구조와 소유 관계, 자동 복구의 범위, 연쇄 삭제를 확인한다.

## What you will learn

- 단독 Pod의 제약과 워크로드 리소스
- ReplicaSet의 `selector` · `replicas` · `template`
- Deployment → ReplicaSet → Pod 3계층, 이름 규칙과 `pod-template-hash`, `ownerReferences`
- 자동 복구의 범위: Pod 삭제, 노드 비우기(`kubectl drain`)와 되돌리기(`kubectl uncordon`)
- `replicas` 변경과 연쇄 삭제

## Lab

| Lab | 내용 | 디렉터리 |
|-----|------|---------|
| lab01: 3계층 구조와 자동 복구 | 3계층과 소유 관계, Pod 삭제 후 재생성, 노드 비우기와 되돌리기, 개수 변경, 연쇄 삭제 | `lab01/` |

`lab01/` 의 파일은 실습을 마친 상태다. `deployment.yaml` 은 4단계에서 `replicas` 를 `5` 로 바꾼 최종 내용이고, 실습은 `replicas: 3` 으로 시작한다.

`cp` 노드의 `~/k8s-core/06/01/lab01` 에서 실행한다. 3단계에서 worker 노드 하나를 비우므로, 자원 정리 후 모든 노드가 `Ready` 이고 `SchedulingDisabled` 가 없는지 확인한다.

## Reference

- Notion: [Notion 문서]()

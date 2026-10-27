# 05 매니페스트와 Pod / 01 kubectl과 매니페스트

이후 모든 실습이 쓰는 조작 방식을 정한다. kubectl로 클러스터의 리소스를 조회하는 방법, 매니페스트로 리소스를 선언하고 적용 전에 변경을 확인하는 방법, Label로 리소스를 선택하는 방법을 다룬다.

## What you will learn

- kubectl과 apiserver, 명령형 방식과 선언형 방식(`kubectl apply -f`)
- 매니페스트의 구조(`apiVersion` · `kind` · `metadata` · `spec`, 클러스터가 채우는 `status`)
- apply의 `created` · `configured` · `unchanged` 와 `last-applied-configuration`
- 적용 전 확인: `--dry-run=client` 와 `--dry-run=server` 의 차이, `kubectl diff`
- `kubectl edit` 로 바꾼 값이 파일 기준 apply에서 되돌아가는 이유
- Label · Selector(등식 · 집합 · 존재 여부) · Annotation

## Lab

| Lab | 내용 | 디렉터리 |
|-----|------|---------|
| lab01: kubectl 탐색 | 노드 · Namespace · Pod 조회, `api-resources`, `explain`, `describe` · `get -o yaml` | 없음 (조회만 한다) |
| lab02: 매니페스트 작성과 적용 | 매니페스트 작성 · 검증 · 적용 · 수정, Selector, `kubectl edit` 와 파일 기준 복원 | `lab02/` |

`lab02/` 의 파일은 실습을 마친 상태다. `pod.yaml` 은 3단계에서 Label `env: dev` 와 Annotation을 추가한 최종 내용이고, 실습 2단계는 이 두 항목이 없는 상태로 시작한다. `pod-uppercase.yaml` 은 서버 검증의 차이를 확인하는 파일로, 적용하면 거부된다.

`cp` 노드의 `~/k8s-core/05/01/lab02` 에서 실행한다.

## Reference

- Notion: [Notion 문서]()

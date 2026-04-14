# Ch03 Execution Model / 01 Terraform 워크플로우

`init → plan → apply → destroy` 각 명령의 내부 동작을 다룬다. 각 단계가 무엇을 하는지 이해하면 오류 진단과 State 관리의 기반이 된다.

## What you will learn

- `terraform init`이 Provider를 다운로드하고 `.terraform.lock.hcl`을 생성하는 흐름
- `terraform plan`의 세 단계: refresh(현재 상태 동기화) → diff(변경 계산) → execution plan 생성
- `terraform apply`의 의존 관계 그래프 기반 순차/병렬 실행과 State 기록
- `terraform destroy`의 State 기반 역순 삭제 메커니즘
- `terraform.tfstate`의 역할과 State 불일치가 유발하는 문제

## Reference

- Notion: [Notion 문서]()

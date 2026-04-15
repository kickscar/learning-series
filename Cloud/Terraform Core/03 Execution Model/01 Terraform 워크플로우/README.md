# Ch03 Execution Model / 01 Terraform 워크플로우

`terraform init`, `plan`, `apply`, `destroy` 각 명령의 내부 동작 메커니즘을 다룬다. Ch02에서 반복 실행한 워크플로우가 어떻게 동작하는지 이해하면 오류 진단과 최적화가 가능해진다.

## What you will learn

- `terraform init`의 Provider 다운로드 흐름과 `.terraform.lock.hcl` 버전 고정/해시 검증 메커니즘
- `terraform plan`의 세 단계: Refresh → Diff → Plan 생성, `-refresh=false` 옵션
- `terraform apply`의 의존 관계 그래프 기반 병렬 실행과 `-out=tfplan` CI/CD 패턴
- `terraform destroy`의 State 기반 역순 삭제 원리
- `terraform.tfstate`의 역할과 State 불일치가 유발하는 문제

## Reference

- Notion: [Notion 문서](https://www.notion.so/01-Terraform-Workflow-343dc703ccda8032a512f8c700ad3b82?source=copy_link)

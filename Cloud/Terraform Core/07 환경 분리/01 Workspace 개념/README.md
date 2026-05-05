# Ch07 환경 분리 / 01 Workspace 개념

Terraform Workspace의 동작 원리(State 분리, `terraform.workspace` 표현식, 저장 경로)를 이해하고, Workspace 방식과 디렉토리 기반 환경 분리 방식을 비교한다.

## What you will learn

- Workspace는 동일 코드베이스에서 독립된 State를 관리하는 메커니즘이다
- `terraform.workspace`로 환경별 조건 분기가 가능하다 (단, backend 블록에서는 사용 불가)
- State 경로: Local은 `terraform.tfstate.d/{workspace}/`, S3는 `{workspace_key_prefix}/{workspace}/{key}`
- Workspace의 한계: 코드 공유로 인한 복잡도 증가, 자격 증명 공유, delete 위험
- 환경별 차이가 클수록 디렉토리 분리가 적합하다 (HashiCorp 공식 권장)

## Reference

- Notion: [Notion 문서]()

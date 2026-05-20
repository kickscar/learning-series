# Ch07 환경 분리 / 02 Workspace

Terraform Workspace의 동작 원리(State 분리, `terraform.workspace` 표현식, 저장 경로)를 이해하고, CLI로 dev/prod 환경을 생성·전환하며 장단점을 체험한다.

## What you will learn

- Workspace는 동일 코드베이스에서 독립된 State를 관리하는 메커니즘이다
- `terraform.workspace`로 환경별 조건 분기가 가능하다 (단, backend 블록에서는 사용 불가)
- State 경로: Local은 `terraform.tfstate.d/{workspace}/`, S3는 `{workspace_key_prefix}/{workspace}/{key}`
- Workspace의 한계: 코드 공유로 인한 복잡도 증가, 자격 증명 공유, delete 위험
- env_config map이 커지면 조건식 복잡도가 급격히 증가한다

## Examples

- `lab01` → Workspace 생성 및 전환, S3 State 경로 확인
- `lab02` → `terraform.workspace` + env_config map으로 환경별 설정 분기, 복잡도 한계 체험

## Reference

- Notion: [Notion 문서](https://www.notion.so/02-Workspace-34edc703ccda8097bb68d00757597fdb?source=copy_link)

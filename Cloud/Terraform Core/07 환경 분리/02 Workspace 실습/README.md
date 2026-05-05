# Ch07 환경 분리 / 02 Workspace 실습

Workspace CLI 명령으로 dev/prod 환경을 생성·전환하고, `terraform.workspace`를 활용해 동일 코드에서 환경별로 리소스를 차별화한다.

## What you will learn

- `terraform workspace new/list/select/show/delete` CLI 명령 워크플로우
- S3 Backend에서 Workspace별 State 경로 분리 (`env:/dev/`, `env:/prod/`)
- `terraform.workspace` + locals map으로 환경별 설정 분기 (dev=t3.micro, prod=t3.small)
- Workspace 삭제 순서: destroy → select default → delete
- env_config map에 없는 Workspace에서 apply 시 key lookup 에러 발생

## Examples

- `lab01` → Workspace 생성 및 전환, S3 State 경로 확인
- `lab02` → `terraform.workspace`로 리소스 차별화 (instance_type 분기)

## Reference

- Notion: [Notion 문서]()

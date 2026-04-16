# Ch04 State Management / 02 State 파일 구조

`terraform.tfstate` 파일의 JSON 구조를 분석한다. 각 필드의 의미를 이해하면 State 관련 오류 진단과 디버깅에 활용할 수 있다.

## What you will learn

- `terraform.tfstate` 최상위 구조: `version`, `terraform_version`, `serial`, `lineage`, `outputs`, `resources`
- `serial`의 충돌 방지 메커니즘과 `lineage`의 State 이력 식별 역할
- `resources` 배열 구조: `mode`, `type`, `name`, `attributes`, `dependencies`
- `sensitive_attributes`의 동작 — CLI 마스킹용이며 State에는 plaintext 저장
- `terraform.tfstate.backup`의 생성 시점과 한계
- State 파일 직접 수정 금지 이유와 `terraform state` 명령 사용 원칙

## Reference

- Notion: [Notion 문서](https://www.notion.so/02-State-343dc703ccda807da335e573b43c5b3e?source=copy_link)

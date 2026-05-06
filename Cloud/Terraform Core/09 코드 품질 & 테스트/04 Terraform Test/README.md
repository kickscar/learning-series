# Ch09 코드 품질 & 테스트 / 04 Terraform Test

`.tftest.hcl` 파일로 Terraform 코드를 테스트한다. plan 수준 검증, mock provider로 credential 없이 단위 테스트, expect_failures로 네거티브 테스팅을 다룬다.

## What you will learn

- `.tftest.hcl` 파일 구조 — `run` 블록, `assert` 블록, `command = plan/apply`
- `expect_failures`로 variable validation의 의도적 실패를 테스트하는 방법
- `mock_provider "aws"`로 credential 없이 단위 테스트 실행
- `mock_data`로 data source 반환값을 직접 지정하여 값 전달 경로 검증
- 테스트 State는 in-memory — 라이브 인프라에 영향 없음

## Examples

- `lab01` → `.tftest.hcl` 작성, plan 수준 assert, naming 검증, expect_failures
- `lab02` → mock provider로 credential 없이 단위 테스트

## Reference

- Notion: [Notion 문서]()

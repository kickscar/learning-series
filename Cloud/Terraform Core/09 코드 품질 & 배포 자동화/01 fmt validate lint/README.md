# Ch09 코드 품질 & 배포 자동화 / fmt / validate / lint

Terraform 코드 품질의 세 가지 도구를 학습한다. 포맷팅(fmt), 문법 검증(validate), 정적 분석(tflint)의 역할 차이와 CI/CD 실행 순서를 이해한다.

## What you will learn

- `terraform fmt`의 동작과 `-check` 플래그로 CI 포맷 검사
- `terraform validate`의 검사 범위와 `-json` 출력
- `tflint` AWS Ruleset으로 값 유효성 검사 (validate가 잡지 못하는 오류)
- 세 도구의 역할 비교와 CI/CD 실행 순서 (`fmt → validate → tflint → plan`)

## Examples

- `lab01` → fmt 포맷 정렬 체험, validate 참조 오류 재현
- `lab02` → tflint 설치, AWS Ruleset으로 잘못된 instance_type 탐지

## Reference

- Notion: [Notion 문서]()

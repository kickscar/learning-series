# Ch10 배포 자동화 / 03 품질 자동화

Review 워크플로우에 quality-gate job을 추가하여 plan 전에 코드 품질을 검사한다. pre-commit으로 로컬 방어 계층을 만들고, branch protection으로 품질 게이트 통과를 merge 조건으로 강제한다.

## What you will learn

- Quality 역할: Review(plan) 앞에서 코드 품질을 먼저 검사
- 품질 게이트: fmt → validate → tflint → tfsec (fail-fast)
- `init -backend=false`로 AWS 인증 없이 품질 검사 실행
- pre-commit-terraform으로 commit 전 로컬 자동 검사
- branch protection + Required status checks로 merge 조건 설정

## Examples

- `lab01` → `09.07.review.yml`에 quality-gate job 추가 + `.tflint.hcl` + pre-commit 설정
- `lab02` → branch protection 설정, Required status checks 지정, 차단/허용 확인

## Reference

- Notion: [Notion 문서]()

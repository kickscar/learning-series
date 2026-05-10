# Ch10 배포 자동화 / 03 품질 게이트 & 브랜치 보호

Review 워크플로우에 quality-gate job을 추가하여 plan 전에 코드 품질을 검사한다. pre-commit으로 로컬 방어 계층을 만들고, branch protection으로 품질 게이트 통과를 merge 조건으로 강제한다.

## What you will learn

- Quality 역할: Review(plan) 앞에서 코드 품질을 먼저 검사
- 품질 게이트: fmt → validate → tflint → tfsec (fail-fast)
- `init -backend=false`로 AWS 인증 없이 품질 검사 실행
- pre-commit: CI와 같은 검사를 로컬에서 commit 전에 실행 (피드백 루프 단축)
- CI quality-gate + pre-commit 이중 방어 계층
- branch protection + Required status checks로 merge 조건 설정

## Examples

- `lab01` → `10.03.review.yml`에 quality-gate job 추가. CI에서 품질 검사
- `lab02` → `.pre-commit-config.yaml` 설정. 같은 검사를 로컬에서 commit 전에 실행
- `lab03` → branch protection 설정, Required status checks, 차단/허용 확인

## Reference

- Notion: [Notion 문서]()

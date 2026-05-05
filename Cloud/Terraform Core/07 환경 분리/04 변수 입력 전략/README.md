# Ch07 환경 분리 / 04 변수 입력 전략

Terraform의 변수 입력 우선순위 체계를 정리하고, 환경별 분리 전략(tfvars, -var-file, TF_VAR_*), CI/CD 파이프라인에서의 활용, sensitive 변수 처리를 실습한다.

## What you will learn

- 변수 우선순위 6단계: `-var` > `*.auto.tfvars` > `terraform.tfvars` > `TF_VAR_*` > default
- `-var`과 `-var-file`은 명령줄 나열 순서대로 — 마지막 값이 적용
- CI/CD에서 `TF_VAR_*`로 secrets 주입, `-var-file`로 환경 설정 분리
- `sensitive = true`는 CLI 마스킹일 뿐 — State에는 평문 저장
- default 전략: sane default (개발 편의) vs no default (필수 입력 강제)

## Examples

- `lab01` → tfvars, -var-file, -var, TF_VAR_* 우선순위 실험 (plan only)
- `lab02` → TF_VAR_* 환경변수 주입 + sensitive 변수 마스킹 확인

## Reference

- Notion: [Notion 문서]()

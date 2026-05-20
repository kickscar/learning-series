# Ch07 환경 분리 / 01 변수 입력 전략

IaC에서 variable의 역할을 정리하고, Terraform의 변수 입력 우선순위 체계, 환경별 분리 전략(tfvars, -var-file, TF_VAR_*), sensitive 변수 처리를 실습한다.

## What you will learn

- IaC에서 variable은 같은 인프라를 다른 환경에 배포할 때 scaling factor를 주입하는 용도다
- 인프라 정의는 locals에서 완성하고, variable은 환경 분리에만 사용한다
- 변수 우선순위: `-var`/`-var-file` > `*.auto.tfvars` > `terraform.tfvars` > `TF_VAR_*` > default
- `-var`과 `-var-file`은 명령줄 나열 순서대로 — 마지막 값이 적용
- `sensitive = true`는 CLI 마스킹일 뿐 — State에는 평문 저장

## Examples

- `lab01` → tfvars, -var-file, -var, TF_VAR_* 우선순위 실험 (plan only)
- `lab02` → TF_VAR_* 환경변수 주입 + sensitive 변수 마스킹 확인

## Reference

- Notion: [Notion 문서](https://www.notion.so/01-34edc703ccda800c9e65cac7955cdcab?source=copy_link)

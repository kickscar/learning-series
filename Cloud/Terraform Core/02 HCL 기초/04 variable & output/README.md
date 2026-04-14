# Ch02 HCL 기초 / 04 variable & output

`variable`과 `output` 블록으로 Terraform 코드를 파라미터화한다. 타입 제약, 값 전달 방법, validation, sensitive 처리를 이해한다.

## What you will learn

- `variable` 블록 구조: `type`, `default`, `description`, `sensitive`
- 타입 제약: `string`, `number`, `list(string)`, `map(string)`, `object`
- 값 전달 방법: `-var` 플래그, `terraform.tfvars`, `TF_VAR_` 환경변수, `default` 우선순위
- `validation` 블록으로 변수의 허용 값 제한 (`condition`, `error_message`)
- `output` 블록 구조: `value`, `description`, `sensitive`
- `terraform output` 명령과 sensitive output 처리

## Examples

- `lab01` → `string` / `number` / `list(string)` / `map(string)` 변수로 SG + EC2 파라미터화, `-var` 플래그 실험
- `lab02` → instance_type, app_port 변수에 validation 추가, 잘못된 값 입력 시 오류 차단 재현
- `lab03` → output 확장 (instance_id, public_ip, sg_id, sensitive output), `terraform output` 조회

## Reference

- Notion: [Notion 문서](https://www.notion.so/04-variable-output-33ddc703ccda806a95b6f71bf8e2ff0a?source=copy_link)

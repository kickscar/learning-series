# Ch02 HCL 기초 / 02 provider 블록

Terraform이 AWS와 통신하기 위한 Provider 설정을 다룬다. `terraform` 블록, `required_providers`, version constraints, `.terraform.lock.hcl`의 역할을 이해한다.

## What you will learn

- `terraform` 블록과 `required_providers`로 Provider와 버전을 선언하는 방법
- version constraints 표현식 (`~> 6.0`, `= 6.1.0`, `>= 6.0, < 7.0`)의 의미와 실무 표준
- `terraform init` 시 Registry에서 Provider 플러그인이 설치되는 흐름
- `.terraform.lock.hcl`의 역할과 VCS 포함 이유
- `default_tags`로 공통 태그를 provider 수준에서 선언하고 모든 리소스에 자동 적용하는 방법
- Provider `alias`로 멀티 리전 배포를 설정하는 방법

## Examples

- `lab01` → version constraint 표현식 변경 실험, `.terraform.lock.hcl` 동작 확인, `terraform init -upgrade` 사용
- `lab02` → `default_tags`로 공통 태그 선언, plan 출력에서 `tags` vs `tags_all` 차이 확인

## Reference

- Notion: [Notion 문서](https://www.notion.so/02-provider-33cdc703ccda805dbbf7e3475d1d6877?source=copy_link)

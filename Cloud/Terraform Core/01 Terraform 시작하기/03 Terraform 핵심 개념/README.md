# Ch01 Terraform 시작하기 / 03 Terraform 핵심 개념

코드를 작성하기 전에 알아야 할 전체 그림을 다룬다. Terraform의 동작 흐름, 핵심 구성 요소, 작업 디렉터리 파일 구성을 개략적으로 파악해 이후 챕터 학습의 좌표를 잡는다.

## What you will learn

- `init → plan → apply → destroy` 전체 동작 흐름과 각 단계의 역할
- 핵심 구성 요소 개요: Configuration, Provider, State, Plan, Apply (Ch02~Ch04에서 반복 심화)
- 작업 디렉터리 권장 파일 구조(`main.tf`, `providers.tf`, `variables.tf`, `outputs.tf`, `terraform.tfvars`)와 `.gitignore` 관례

## Reference

- Notion: [Notion 문서](https://www.notion.so/03-Terraform-33cdc703ccda804fa8e8f864c8ef3c77?source=copy_link)

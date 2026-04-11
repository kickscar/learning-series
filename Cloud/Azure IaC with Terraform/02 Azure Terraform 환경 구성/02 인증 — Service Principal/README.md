# 02 Azure Terraform 환경 구성 / 02 인증 — Service Principal

Service Principal을 생성하고 환경변수 방식으로 Terraform에 인증 정보를 전달하는 방법을 다룬다.

## What you will learn

- 콘솔 대화형 인증과 코드 비대화형 인증의 차이
- Service Principal 생성 및 인증 정보 구조
- 환경변수 방식 인증 (provider 블록 직접 지정과의 비교)
- .env + .gitignore 시크릿 관리
- Ch10 OIDC(Workload Identity Federation)로의 진화 방향

## Examples

- `lab04` → Service Principal 생성, 환경변수 인증, terraform plan/apply 확인

## Reference

- Notion: [Notion 문서]()

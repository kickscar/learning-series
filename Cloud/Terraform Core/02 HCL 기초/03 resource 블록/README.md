# Ch02 HCL 기초 / 03 resource 블록

Terraform의 핵심 블록인 `resource`를 다룬다. 리소스 선언, 참조 표현식, 암묵적/명시적 의존성, meta-argument 개요를 이해한다.

## What you will learn

- `resource "타입" "이름" {}` 구조로 인프라 리소스를 선언하는 방법
- 리소스 주소(`<타입>.<이름>`)와 참조 표현식(`<타입>.<이름>.<속성>`)
- 참조 표현식이 만드는 암묵적 의존성(implicit dependency)
- 참조 없이 의존성이 필요한 경우 `depends_on`으로 명시하는 방법
- meta-argument(`depends_on`, `count`, `for_each`, `lifecycle`) 개요

## Examples

- `lab01` → `aws_security_group` 생성, plan/apply/destroy 첫 사이클, `terraform.tfstate` 확인
- `lab02` → `aws_instance` + `aws_security_group` 참조 표현식으로 연결, 암묵적 의존성 확인
- `lab03` → IAM Role + Policy Attachment + EC2, `depends_on`으로 명시적 의존성 선언

## Reference

- Notion: [Notion 문서](https://www.notion.so/03-resource-33ddc703ccda80f99ad7c0cd2eb2b4d3?source=copy_link)

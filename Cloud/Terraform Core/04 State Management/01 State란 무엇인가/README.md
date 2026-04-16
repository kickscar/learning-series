# Ch04 State Management / 01 State란 무엇인가

Terraform State의 역할과 필요성을 다룬다. 코드와 실제 인프라를 연결하는 매핑 메커니즘, Refresh와 drift 감지, Local State의 한계를 이해하고 Remote Backend 전환의 동기를 파악한다.

## What you will learn

- State의 세 가지 목적: 매핑(코드 ↔ 리소스 ID), 메타데이터(의존 관계), 성능(API 호출 최소화)
- Refresh 동작과 `terraform apply -refresh-only` (deprecated `terraform refresh` 대체)
- State drift의 원인, 감지 방법(`terraform plan`), 해소 전략 3가지
- Local State의 한계: 협업, 팀 Locking, 백업, 민감 데이터 보안
- Remote Backend(S3)가 Local State 한계를 해결하는 방식

## Reference

- Notion: [Notion 문서](https://www.notion.so/01-State-343dc703ccda807cbe70f7413b6c4763?source=copy_link)

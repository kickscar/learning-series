# 02 IAM / 03 Policy

IAM Policy의 구조(Effect/Action/Resource/Condition)와 평가 로직(Explicit Deny 우선, 기본 거부)을 정리한다. `lab04`에서 Customer Managed Policy를 생성해 Group에 연결하고, 제한된 권한 User로 Console에서 ReadOnly/거부 동작을 검증한다.

## What you will learn

- Policy JSON의 핵심 필드와 의미(Effect/Action/Resource/Condition)
- AWS Managed / Customer Managed / Inline Policy의 차이
- Policy 평가 로직(Explicit Deny > Allow > Implicit Deny)
- 최소 권한(Least Privilege) 설계 감각과 검증 방식

## Examples

- `lab04` → S3 ReadOnly Custom Policy 생성, Group 연결, ReadOnly 동작/거부 동작 검증

## Reference

- Draft: `.cursor/draft/02.03.notion.cursor.md`
- Notion: [Notion 문서]()


# 06 S3와 CloudFront - Storage & Content Delivery / 02 Bucket Policy와 접근 제어

Bucket Policy와 IAM Role(Instance Profile)로 S3 접근을 통제하고, EC2에서 S3에 접근하는 표준 패턴(Role 기반)을 실습으로 검증한다.

## What you will learn

- S3 접근 제어 구성 요소(Block Public Access, Bucket Policy, IAM Policy)
- Bucket Policy의 구조와 IAM Policy와의 차이(Principal)
- EC2에서 Access key 없이 Role로 S3에 접근하는 흐름
- 접근 문제 트러블슈팅 순서(Role -> Policy -> Bucket Policy)

## Examples

- `lab18` -> Bucket Policy 작성, EC2 IAM Role 연결, EC2에서 S3 업로드/다운로드 검증

## Reference

- Draft: `.cursor/draft/06.02.notion.cursor.md`
- Notion: [Notion 문서]()

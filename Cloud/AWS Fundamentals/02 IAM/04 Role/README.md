# 02 IAM / 04 Role

IAM Role을 임시 자격 증명(Temporary Credentials) 기반 권한 위임 단위로 정리한다. `lab05`에서 EC2가 맡을 수 있는 Role(Trust Policy)과 S3 접근 권한(Permission Policy)을 구성해, 이후 EC2/S3 연동 실습에서 재사용 가능한 Instance Profile을 준비한다.

## What you will learn

- User(장기 자격)와 Role(임시 자격)의 차이
- Trust Policy와 Permission Policy 분리 설계
- EC2에서 Role이 적용되는 방식(Instance Profile)
- Access Key 없이 서비스 접근이 가능한 이유(임시 자격 증명)

## Examples

- `lab05` → EC2용 IAM Role 생성(Trust: EC2), S3 권한 연결, Instance Profile 확인

## Reference

- Draft: `.cursor/draft/02.04.notion.cursor.md`
- Notion: [Notion 문서]()


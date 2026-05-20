# 07 RDS - Managed Database / 02 DB Instance와 Subnet Group

Private Subnet 기반 DB Subnet Group과 DB Instance(MariaDB **11.8.5**)를 생성해 데이터 계층을 만든다. DB는 Public access 없이, SG 참조(App SG -> DB SG)로만 접근하도록 구성한다.

## What you will learn

- DB Subnet Group의 역할과 Multi-AZ 요구사항
- RDS 네트워크 설정의 핵심(VPC, Subnet group, Public access, SG)
- DB SG 설계 패턴(3306 from App SG)
- Endpoint/Port가 연결 문자열의 기준점이라는 점

## Examples

- `lab20` -> DB Subnet Group 생성, RDS(MariaDB 11.8.5) 생성, DB SG 구성, Endpoint 확인

## Reference

- Draft: `.cursor/draft/07.02.notion.cursor.md`
- Notion: [Notion 문서]()

# 07 RDS - Managed Database / 01 RDS 개요

RDS(관리형 관계형 데이터베이스)의 역할과 핵심 개념(DB Instance, Endpoint, 운영 책임 분리)을 정리한다. 다음 Section에서 Private Subnet의 DB 계층을 실제로 구성한다.

## What you will learn

- 본 시리즈에서 RDS 실습 엔진으로 **MariaDB 11.8.5**를 기준으로 둔다는 점(Console 가용 버전에 맞춰 11.8.x 조정 가능)
- RDS가 Managed DB로서 제공하는 것(백업, 패치, 장애 복구)
- EC2에 직접 DB 설치와의 차이(책임/제약)
- DB Instance와 Endpoint 개념
- Multi-AZ, Read Replica의 존재와 역할(개요)

## Reference

- Draft: `.cursor/draft/07.01.notion.cursor.md`
- Notion: [Notion 문서]()


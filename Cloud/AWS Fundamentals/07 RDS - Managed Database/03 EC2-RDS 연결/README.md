# 07 RDS - Managed Database / 03 EC2-RDS 연결

EC2에서 Private Subnet의 RDS(MariaDB **11.8.5**)로 연결 테스트를 수행하고, Chapter 프로젝트로 Gallery datasource를 RDS로 전환해 Phase 1(EC2 + S3 + RDS)을 완성한다.

## What you will learn

- EC2 -> RDS 연결 구조(Private 통신, SG 참조)
- Endpoint/Port와 JDBC URL의 구성 방식
- DB 클라이언트로 연결 테스트해 원인 범위를 분리하는 방법(RDS CA 번들, `mysql --ssl`, 선택 `--ssl-ca`)
- (프로젝트) Gallery의 `spring.datasource.*`를 RDS로 전환하는 흐름

## Examples

- `lab21` -> CA 번들 다운로드 후 `mysql --ssl`로 RDS 접속, 기본 쿼리/테이블 생성으로 연결 검증

## Gallery Project

- `Gallery: RDS(MariaDB 11.8.5) 연동` -> Gallery DB를 RDS(MariaDB 11.8.5)로 전환하고 업로드/삭제가 DB 레코드에 반영되는지 확인

## Reference

- Draft: `.cursor/draft/07.03.notion.cursor.md`
- Notion: [Notion 문서]()

# 07 Azure Database / 04 [실습] Gallery: MySQL 연동

Gallery의 DB를 H2 인메모리에서 Azure MySQL(Private)로 전환해, 파일(Blob)에 이어 레코드까지 외부화하는 Ch07 대미.

## What you will learn

- H2 인메모리의 문제 — 재시작 초기화·인스턴스별 분리(06.06 파일과 같은 문제)
- Azure MySQL Private(`vnet-gallery` 통합) + MariaDB 드라이버(MySQL 와이어 호환)
- 앱 데이터소스 전환(`--spring.datasource.*`), DB 암호는 Key Vault(프로덕션)
- 파일(Blob) + 레코드(MySQL) 외부화 → 컴퓨트 무상태

## Lab (Gallery)

- `rg-gallery` 누적. `mysql-gallery` Private(`snet-gallery-db` 위임) → datasource 전환 → Reimage → 데이터 영속 확인

## Examples

- 앱 소스: `Cloud/Workloads/gallery-spring-boot` — datasource override(`jdbc:mariadb://...`)

## Reference

- Draft: `.claude/draft/07.04.claude.notion.md`
- Notion: [Notion 문서]()

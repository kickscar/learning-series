# 07 Azure Database / 05 백업과 복원

MySQL Flexible Server의 자동 백업·PITR·Geo 백업을 이해하고, Point-in-Time Restore로 특정 시점의 새 서버를 복원하는 실습(lab23).

## What you will learn

- 자동 백업 — 전체·차등·트랜잭션 로그, 보존 1~35일(기본 7), AES-256
- PITR — 보존 창 내 특정 시점 → **새 서버** 복원(원본 보존)
- Geo-redundant 백업 — 보조 리전 복제(생성 시 설정), Geo-restore
- 복원 유형 — PITR / Geo-restore

## Lab

- **lab23: 백업 설정 및 PITR** (`rg-lab23`)
  - `mysql-lab23` + 데이터 → 백업 보존 확인 → PITR → `mysql-lab23-restore` 데이터 확인

## Reference

- Draft: `.claude/draft/07.05.claude.notion.md`
- Notion: [Notion 문서]()

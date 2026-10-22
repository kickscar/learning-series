# 08 운영 엔지니어링 / 01 백업과 복구

논리 백업(mysqldump)과 물리 백업(mariabackup)을 손으로 수행하고, employees를 지웠다가 복원하며 복원을 검증한다. MariaDB 설치의 employees 로드가 곧 복원이었음을, 그리고 크래시 복구가 못 살리는 것을 백업이 살림을 확인한다. Ch08(운영 엔지니어링)의 첫 섹션이다.

## What you will learn

- 백업이 필요한 이유: 장애·실수 `DROP`·보안 사고. **크래시 복구(redo/undo) ≠ 백업 복구**
- 논리 백업 mysqldump: SQL 추출, `--single-transaction`(락 없는 일관 스냅샷), 범위 옵션
- 물리 백업 mariabackup: 파일 복사, 온라인, `--backup`/`--prepare`(redo 적용)/`--copy-back`
- 논리 vs 물리 대비(이식성/속도), 백업 전략(전체/증분), PITR = 전체 + binlog(복제에서)
- 복원과 검증: "복원해 봐야 백업이다", 클라우드 자동 백업의 hook
- 실습: employees `DROP` → 복원 → `COUNT(*)` 300024 검증

## Reference

- Notion: [Notion document]()

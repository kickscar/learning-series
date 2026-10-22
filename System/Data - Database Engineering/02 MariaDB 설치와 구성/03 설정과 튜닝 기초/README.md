# 02 MariaDB 설치와 구성 / 03 설정과 튜닝 기초

MariaDB 설정 파일 구조와 성능에 직결되는 핵심 파라미터를 보고, `innodb_buffer_pool_size`와 문자셋을 직접 조정해 반영을 확인한다.

## What you will learn

- `/etc/my.cnf.d/` 설정 파일 구조와 읽기 순서(`[mysqld]` 섹션, 나중 값 우선)
- 핵심 파라미터: `innodb_buffer_pool_size`(InnoDB 캐시)·`max_connections`·`character_set_server`
- 서버 자원과 설정의 관계(버퍼 풀을 너무 키우면 스왑)
- 설정 변경 → 재시작 → 반영 확인(변경 전/후 비교)

## Reference

- Notion: [Notion document]()

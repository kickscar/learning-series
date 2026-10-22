# 07 워크로드 연결 / 02 커넥션 풀

연결을 미리 열어두고 재사용하는 커넥션 풀의 원리를 보고, 두 워크로드의 풀(HikariCP vs MySqlConnector)을 대조한다. 클라이언트 풀과 서버 한계의 구분, 풀 사이징의 오해, 그리고 격리 수준과 락이 예고한 "커넥션 풀 고갈 → 서비스 장애"를 완성한다.

## What you will learn

- 커넥션 풀 원리: 연결 비용(TCP·인증·세션) → 미리 열어 재사용(borrow/return), 클라이언트 쪽
- 두 워크로드 풀 대조: HikariCP(별도 라이브러리, `application.yaml` 명시) vs MySqlConnector(드라이버 내장, 연결 문자열)
- 클라이언트 풀 vs 서버 `max_connections`(151), `ERROR 1040`, `wait_timeout`과 `maxLifetime`(stale 회피)
- 풀 사이징: `(코어×2)+디스크`, "작은 풀이 대체로 빠르다"
- ⭐ 커넥션 풀 고갈 캐스케이드: 느린 쿼리·락 대기 → 반환 지연 → 고갈 → 서비스 장애 (`connectionTimeout` ≠ `innodb_lock_wait_timeout`)
- 실습: `Threads_connected`·`max_connections`·`SHOW PROCESSLIST`(Sleep/Query)·다중 접속·장기 점유 관찰

## Reference

- Notion: [Notion document]()

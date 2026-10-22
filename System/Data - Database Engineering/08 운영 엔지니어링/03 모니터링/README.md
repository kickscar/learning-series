# 08 운영 엔지니어링 / 03 모니터링

앞 챕터들이 넘긴 핵심 메트릭을 `SHOW STATUS`로 종합해, 느린 쿼리·락 대기·커넥션 고갈·버퍼 부족을 지금 이 순간의 숫자에서 감지한다. counter와 gauge를 구분해 읽고, 부하 시뮬레이션으로 메트릭 변화를 관찰한다. 클라우드 대시보드는 값을 보여줄 뿐, 해석은 엔지니어의 몫임을 확인한다.

## What you will learn

- 실시간 관찰(모니터링) vs 사후 분석(슬로우 로그)
- `SHOW GLOBAL STATUS` vs `SHOW STATUS`(기본 SESSION), `LIKE`, `information_schema.GLOBAL_STATUS`
- ⭐ counter(누적, 변화율로 읽기) vs gauge(현재값, 한계와 비교)
- 핵심 메트릭 4종: `Threads_connected`(커넥션 풀), `Slow_queries`(슬로우 쿼리), 버퍼 풀 히트율(설정/튜닝), `Innodb_row_lock_waits`(락)
- 버퍼 풀 히트율 = (1 − reads/read_requests)×100, `SHOW PROCESSLIST`·`information_schema.PROCESSLIST`
- 실습: 메트릭 스냅샷, 히트율 계산, 읽기 부하(employees JOIN)·락 경합(music) 시뮬레이션. 대시보드 해석은 엔지니어 몫(08.04 hook)

## Reference

- Notion: [Notion document]()

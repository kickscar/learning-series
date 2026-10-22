# 05 성능 엔지니어링 / 03 슬로우 쿼리

느린 쿼리를 슬로우 로그로 자동 수집하고, mysqldumpslow로 범인을 지목한 뒤, EXPLAIN으로 판독하고 인덱스로 처방해 개선을 검증한다. Ch05(인덱스·실행 계획·슬로우 쿼리)가 하나로 맞물리는 클라이맥스다.

## What you will learn

- `slow_query_log`·`long_query_time`(기본 10초 → 실습 0.1초) 설정과 두 함정(새 연결부터 적용 / 재시작 시 소멸)
- 로그 판독: `Query_time`, 그리고 **`Rows_examined ≫ Rows_sent` = 인덱스 미사용 지문**
- `mysqldumpslow` 요약과 쿼리 정규화(숫자→`N`, 문자열→`'S'`)로 부하 패턴 지목
- 전체 루프: 수집(슬로우 로그) → 판독(EXPLAIN) → 처방(인덱스) → 검증(로그에서 사라짐)
- 엔지니어링: 성능 문제 보고의 공통 언어, 클라우드 관리형 DB가 자동화하는 것 (실시간 관찰은 모니터링에서)
- **lab01** 슬로우 쿼리 로그 수집과 판독(로그 켜기, `Rows_examined ≫ Rows_sent` 판독) / **lab02** mysqldumpslow 분석과 처방 루프(지목→EXPLAIN→인덱스→검증→원복)

## Reference

- Notion: [Notion document]()

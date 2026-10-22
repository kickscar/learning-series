# 03 관계형 모델과 SQL / 05 데이터 조회 I: SELECT

데이터를 꺼내는 `SELECT`를 익힌다. 쓰기 DML이 단순한 명령이라면 조회는 무엇을 어떤 조건으로 어떻게 골라 뽑을지가 무한히 다양하다. 기본 SELECT와 조건, 정렬, 값을 가공하는 함수를 데이터 조작에서 넣은 album 15행으로 다룬다.

## What you will learn

- `SELECT` 시놉시스: `DISTINCT`, `AS` 별칭, `ORDER BY`(정렬), `LIMIT`(TOP-K). `LIMIT`은 MariaDB 방언(Oracle `FETCH FIRST`, MSSQL `TOP`과 다름)
- `WHERE` 조건: 비교, 논리(`AND`/`OR`), `IN`, `BETWEEN`, `IS NULL`, `LIKE`(`%`, `_`)
- 자주 쓰는 함수(`CONCAT`, `UPPER`, `CHAR_LENGTH`, `ROUND`, `DATE_FORMAT`, `CAST`)와 글자 수 vs 바이트 수
- `LIKE 'A%'`(앞 고정)의 인덱스 활용, `LIKE '%A'`(앞 열림)의 한계 (성능 예고)
- **lab01** 기본 조회(특정 컬럼, `WHERE`, `DISTINCT`, 별칭) / **lab02** 검색과 정렬(`LIKE`, `IN`, `BETWEEN`, `ORDER BY`, `LIMIT`) / **lab03** 함수로 값 가공

## Reference

- Notion: [Notion document]()

# 03 관계형 모델과 SQL / 03 데이터 정의: DDL

DDL로 데이터를 담을 그릇(테이블)의 구조를 정의한다. `CREATE`, `ALTER`, `DROP` 문법과 데이터 타입을 익히고, 앞으로 두루 쓸 비정규 `music.album` 테이블을 만든다. 구조를 정확히 정의하는 것이 이후 모든 쿼리의 전제다.

## What you will learn

- `CREATE`/`ALTER`/`DROP` 시놉시스, `AUTO_INCREMENT`와 `PRIMARY KEY`
- 공통 데이터 타입(`INT`, `VARCHAR`, `DECIMAL`, `DATE`/`DATETIME`, `TEXT`)과 **타입은 표준이 아님**(Oracle `VARCHAR2`, MSSQL `NVARCHAR` 등 비교)
- **lab01** album `CREATE` + `DESCRIBE`로 구조 확인
- **lab02** `ALTER`(add/modify/drop column) + `DROP TABLE`(임시 테이블로)
- album의 반복 컬럼 구조 = 데이터 조작의 update anomaly 미끼 준비

## Reference

- Notion: [Notion document]()

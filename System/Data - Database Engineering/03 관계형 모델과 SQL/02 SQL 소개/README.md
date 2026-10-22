# 03 관계형 모델과 SQL / 02 SQL 소개

SQL이 무엇이고 어디서 왔는지, 이 시리즈와 엔지니어링에서 어떤 자리와 값어치를 갖는지, 어떤 갈래로 나뉘는지를 잡는다. 뒤에 이어질 인덱스, 실행 계획, 트랜잭션, 락이 전부 이 언어 위에서 돌기 때문이다. (이론 전용)

## What you will learn

- SQL의 정의(관계형 표준 언어)와 **선언형**의 의미("무엇"만 기술, "어떻게"는 옵티마이저 → 실행 계획의 토대)
- 간단한 역사(Codd 1970 → IBM SEQUEL → ANSI 1986/ISO 1987)와 벤더 방언(MariaDB/Oracle/MSSQL)
- ⭐ 엔지니어링에서 SQL의 자리: 인덱스, EXPLAIN, 트랜잭션, 락이 모두 SQL 위에서 돈다. 엔지니어는 남이 짠 SQL을 **읽고 분석**해야 한다(작성 < 판독)
- SQL의 갈래(DDL/DML/DCL/TCL)와, DML 중 **조회(SELECT)가 방대하고 핵심**이며 쓰기는 단순하고 단일하다는 무게

## Reference

- Notion: [Notion document]()

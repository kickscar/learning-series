# 05 성능 엔지니어링 / 02 실행 계획

EXPLAIN으로 옵티마이저의 실행 계획을 읽는다. `type` 값의 서열과 `Using filesort`·`Using temporary` 위험 신호를 employees로 판독하며, "서버 CPU가 100%일 때 범인을 찾는" 눈을 기른다. 인덱스에서 넘긴 EXPLAIN 심층 해석의 본론이다.

## What you will learn

- EXPLAIN 개요: 실행하지 않고 계획을 본다, 한 행 = 한 테이블
- 진단 4컬럼: `type`·`key`·`rows`·`Extra`
- `type` 서열: `ALL → index → range → ref → eq_ref → const` (+ `type: index` ≠ `Extra: Using index` 함정)
- `Extra` 위험 신호: `Using filesort`(별도 정렬), `Using temporary`(임시 테이블) 메커니즘
- 엔지니어링: `type: ALL` + 큰 `rows` = 범인 패턴 (느린 쿼리 수집은 슬로우 쿼리에서)
- **lab01** EXPLAIN 읽는 법(4컬럼, `ALL→ref` 전후 비교) / **lab02** 조인 EXPLAIN 판독(3테이블, 여러 행) / **lab03** 위험 신호(filesort 관찰·제거, `Using temporary`)

## Reference

- Notion: [Notion document]()

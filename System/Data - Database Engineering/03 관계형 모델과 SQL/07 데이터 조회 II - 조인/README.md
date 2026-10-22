# 03 관계형 모델과 SQL / 07 데이터 조회 II: 조인 (Join)

흩어진 여러 테이블의 데이터를 함께 보는 연산이 조인이다. 실데이터 employees의 비즈니스 질문으로 조인의 기본(INNER)을 익히고, employees로는 만들 수 없는 상황(짝이 없는 행, 조건 누락)을 작은 두 테이블로 확인한다. 집계에서 코드로만 셌던 부서를 이름과 평균으로 잇는 것이 이 절의 payoff다.

## What you will learn

- `JOIN ... ON` 표준 문법과 **N개 테이블 = N-1개 조인 조건** 규칙
- `INNER JOIN`으로 실데이터의 비즈니스 질문에 답하기(조건, 정렬, 집계를 얹어)
- 외부 조인(`LEFT`/`RIGHT`): 부서 없는 직원(`LEFT`), 직원 없는 부서(`RIGHT`), `INNER`는 둘 다 탈락. `LEFT`로 통일, `FULL OUTER`는 MariaDB 미지원(방언)
- ⭐ 카테시안 곱: `ON`을 빠뜨리면 모든 조합으로 폭발 → 대용량에서 메모리와 디스크(swap) 소진, 서버 위협. 잘못된 SQL이 왜 엔지니어링 문제인가
- 조인 비용(Nested Loop / BNL / BNLH), 인덱스 유무가 속도를 가른다 (성능 예고)

## Labs

- **lab01 INNER JOIN으로 도메인 질문에 답하기** (employees): 이름+직책, 여성 엔지니어, 부서 이름별 인원(집계 hook 회수), 급여 높은 순(filesort), 부서 이름별 평균급여(3테이블 N-1 + 조인+집계)
- **lab02 OUTER JOIN** (employees 내 임시 `dept`/`emp`): `LEFT`(부서 없는 직원), `RIGHT`(직원 없는 부서), `FULL OUTER` 미지원
- **lab03 카테시안 곱** (임시 `dept`/`emp`): `ON` 누락 시연 + 규모 위험 + 엔지니어링 맥락, 실습 후 DROP

## Hooks (뒤에서 회수 / 앞에서 받음)

- 06 집계의 "부서 코드는 세지만 이름은 조인" → lab01 부서 이름별 인원으로 회수
- 부서 이름별 평균급여 → 08 서브쿼리(부서 평균을 다시 집계)로 이어짐
- filesort, 조인 비용 → 인덱스와 실행 계획(성능)으로 이어짐

## Reference

- Notion: [Notion document]()

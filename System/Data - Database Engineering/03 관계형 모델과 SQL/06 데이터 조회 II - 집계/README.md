# 03 관계형 모델과 SQL / 06 데이터 조회 II: 집계 (Aggregation)

여러 행을 묶어 하나의 값으로 요약하는 집계를 익힌다. 여기서 대상이 작은 album에서 실데이터 employees(390만)로 바뀌고, 아직 조인 없이 **한 테이블 안에서** 묶고 세고 요약한다. 예제는 비즈니스 질문으로 열고, 정렬과 집계의 비용이 성능 문제의 한 얼굴임을 짚는다.

## What you will learn

- 집계 함수(`COUNT`, `SUM`, `AVG`, `MAX`, `MIN`)와 `GROUP BY`. 그룹 개수 = 결과 행 수
- `SELECT`에는 `GROUP BY`로 묶은 컬럼과 집계 함수만 올릴 수 있다
- `HAVING` vs `WHERE`(그룹핑 후/전 필터), `WHERE`에 집계 함수를 쓰는 흔한 오류와 교정
- SQL 실행 순서(`FROM`→`WHERE`→`GROUP BY`→집계→`HAVING`→`ORDER BY`→`LIMIT`)
- 집계 함수 중첩(`MAX(AVG())`)은 벤더마다 다르다. MariaDB는 `ERROR 1111`, Oracle은 허용(방언). 해결은 서브쿼리로 회수한다
- `filesort`나 `Using temporary` 비용(개념), 대용량 집계의 실행 시간 체감 (성능 예고)

## Labs

- **lab01 통계 함수로 요약하기**: 현재 회사 평균 연봉(`AVG` + `WHERE 현재`), 신입 입사일(`MAX(hire_date)`), 사번 10060 급여 평균과 총합(`WHERE emp_no`), 그리고 사원별 평균 중 최고(`MAX(AVG())` → `ERROR 1111` → 서브쿼리로 예고)
- **lab02 GROUP BY로 묶어 답하기**: 각 사원별 평균연봉(`GROUP BY emp_no`, SELECT의 묶은 컬럼 강조), 부서 코드별 현재 인원(코드에서 이름은 조인 필요 예고)
- **lab03 HAVING으로 그룹 거르기**: 대형 부서(WHERE 실수 → `HAVING COUNT`), 고연봉 사원(`GROUP BY emp_no HAVING AVG(salary)>100000`)

## Hooks (뒤에서 회수)

- 부서 코드는 세지만 부서 **이름**을 붙이려면 조인이 필요하다 → 조인
- 집계의 집계(`MAX(AVG())`)는 한 번에 안 된다 → 서브쿼리(FROM절 파생 테이블)

## Reference

- Notion: [Notion document]()

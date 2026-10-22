# 04 데이터 설계 / 01 ER 모델링

ER 모델의 표기법(노테이션)을 익히고, 이미 만들어진 employees를 ER로 거꾸로 읽는다. "읽는 법과 부르는 법"에 집중하고, 구조를 왜 그렇게 나눴는가(정규화)는 다음 절에서 다룬다.

## What you will learn

- ER 3요소(엔티티, 속성, 관계)와 카디널리티(1:1 / 1:N / M:N)
- 크로우풋(crow's foot) 표기: `||--o{`가 1:N을 나타내는 방식
- PK와 FK를 직관으로 읽기(행 식별, 테이블 연결). 정규화의 수학적 근거는 다음 절
- 외래키로 관계 역설계: FK 하나면 1:N, junction이 FK 둘을 담으면 M:N
- employees를 `SHOW CREATE TABLE`로 읽어 엔티티, 속성, 키, 관계를 식별
- 관계 표기가 곧 JOIN 경로의 예고라는 엔지니어링 관점

## Labs

- **lab01 employees 구조를 ER 노테이션으로 읽기**: `SHOW CREATE TABLE`로 PK/FK 확인, 엔티티와 속성과 관계 식별 (설계나 정규화는 안 함)
- **lab02 관계를 크로우풋으로 그리기**: 외래키에서 카디널리티를 읽어 mermaid `erDiagram` 작성, dept_emp M:N junction 식별

## Hooks (뒤로 이어짐)

- PK/FK 직관 → 정규화에서 함수 종속으로 재유도(2-pass)
- 관계 표기 = JOIN 경로 예고, 정규화 깊이와 JOIN 비용의 맞교환 → 정규화

## Reference

- Notion: [Notion document]()

# dict
이 디렉터리의 예제들은 Python의 **매핑(mapping) 타입인 `dict`** 의 기본 동작과 사용 패턴을 이해하기 위해 구성되어 있다.
키-값 조회 방식, 항목 추가·수정, 키 제약(hashable), 그리고 Python 3.7+ / 3.9+ 이후 추가된 주요 특징을 코드로 확인한다.

## What These Examples Explain
이 예제들은 다음 개념을 설명한다.

- dict 생성 방법과 리터럴 표현
- `d[k]` 와 `d.get(k, default)` 조회 차이
- 키 추가·수정·삭제 패턴
- dict 키의 조건(hashable)
- 삽입 순서 보장(Python 3.7+)
- dict 합치기(`|`, `|=`)와 comprehension

## Examples
- `lab01` → dict 생성과 리터럴
- `lab02` → `d[k]` vs `d.get()`
- `lab03` → 추가·수정·삭제
- `lab04` → 삽입 순서 보장
- `lab05` → `|`, `|=` dict 병합 연산자

## Reference
[📘 Notion 문서](https://www.notion.so/04-dict-301d1253a08880b1b4f8f530b3fdf05a?source=copy_link)
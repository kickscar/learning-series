# 04 데이터 설계 / 02 정규화

정규화는 **논리 설계**다. 비정규 앨범 카탈로그에서 출발해 함수 종속을 따라 1NF, 2NF, 3NF로 논리 모델을 다듬고, 완성된 모델을 마지막에 DDL로 구현한다(포워드 엔지니어링). 정규화 과정에서는 테이블을 만들었다 부수지 않고 논리 모델(데이터 표 + 엔티티 다이어그램)을 변형해 간다.

> **실습 제약**: 정규화 설명을 위해 제약을 건 예시다. 컴필레이션 앨범(한 앨범에 여러 아티스트)은 다루되 피처링/듀엣(한 곡에 여러 아티스트)은 제외(곡당 아티스트 1명), 배급사/발매연도는 앨범 단위.

## What you will learn

- 중복이 낳는 수정, 삽입, 삭제 이상(anomaly)
- 함수 종속: 결정자에서 종속자로, 부분 종속(복합키 일부), 이행 종속(비키가 비키를 결정)
- 1NF(원자값) → 2NF(부분 종속 제거) → 3NF(이행 종속 제거) 논리 모델 분해
  - 2NF는 자연 복합키 `(album_id, track_no)`로(`running_time`이 완전 종속 대조), 3NF는 `label_name → country`, `artist_name → country` 이행 종속으로 시연
- 논리 모델을 물리 스키마로 옮기는 포워드 엔지니어링(엔티티→테이블, 1:N→외래키, 복합키→surrogate `song_id` + UNIQUE)
- 반정규화의 JOIN 트레이드오프, 정규화 = 변화 대응력(피처링 제약을 풀면 M:N을 junction 하나로 흡수)

## Labs

정규화 단계(1NF→2NF→3NF)를 각각 독립 실습으로 밟는다. lab02부터는 앞 실습의 산출물(논리 모델 또는 구현) 위에서 다음 단계를 진행한다(사전 준비에 선행 명시).

- **lab01 비정규 앨범 카탈로그와 세 가지 이상** (논리, 데이터 표): 수록곡 반복 그룹 + 컴필레이션, 수정/삽입/삭제 이상 진단. SQL 없음
- **lab02 1NF, 원자값과 복합키** (논리, 표 + `erDiagram`): 반복 그룹을 곡별 행으로, 복합키 `(album_id, track_no)` 확정. SQL 없음
- **lab03 2NF, 부분 종속 제거** (논리, `erDiagram`): 앨범 속성 부분 종속 → `album`/`song` 분리(`running_time`은 완전 종속 대조). SQL 없음
- **lab04 3NF, 이행 종속 제거** (논리, `erDiagram`): `label_name → country`, `artist_name → country` 이행 종속 → `label`/`artist` 분리. SQL 없음
- **lab05 포워드 엔지니어링** (SQL/DDL): 3NF 논리 모델을 `CREATE TABLE`로 구현, 복합키를 물리에서 `song_id` surrogate + `(album_id, track_no)` UNIQUE로
- **lab06 반정규화와 변화 대응력** (SQL): JOIN 트레이드오프, 피처링 제약을 풀 때 M:N을 `song_artist` junction으로 흡수

## Hooks (앞에서 받음)

- 03 DDL/DML의 "반복 = 정규화에서 푼다" hook을 수정이상으로 회수
- ER 모델링의 크로우풋 표기와 변환 규칙(1:N→외래키)을 정규화와 포워드 엔지니어링에 활용
- 조인/집계의 JOIN 비용을 반정규화 트레이드오프로 되짚음

## Reference

- Notion: [Notion document]()

# 03 관계형 모델과 SQL / 04 데이터 조작: DML (INSERT, UPDATE, DELETE)

데이터를 넣고 고치고 지우는 DML의 쓰기를 익힌다. 세 명령의 문법을 이론에서 정식으로 다루고, DDL에서 만든 비정규 `music.album`에 시드 15행을 넣고 다룬다. 쓰기는 단순한 명령이지만, `WHERE`를 빠뜨리면 테이블 전체를 덮어쓰거나 비우는 사고가 여기서 난다.

## What you will learn

- `INSERT`/`UPDATE`/`DELETE` 시놉시스와 짧은 소개(이론부)
- `WHERE` 없는 `UPDATE`/`DELETE`의 위험. 쓰기 전 같은 조건으로 `SELECT` 확인
- **lab01** 다중 행 `INSERT`로 album 시드 15행, `AUTO_INCREMENT` 자동 부여
- **lab02** `UPDATE`로 값 변경. 반복 저장의 대가(update anomaly 미끼, 정규화에서 회수). 시연 후 시드 원복
- **lab03** `WHERE`로 좁힌 `DELETE`(임시 행으로), `WHERE` 없는 삭제의 위험
- album 시드는 조회 실습의 공통 데이터라 canonical하게 보존(lab02 원복, lab03 임시 행)

## Reference

- Notion: [Notion document]()

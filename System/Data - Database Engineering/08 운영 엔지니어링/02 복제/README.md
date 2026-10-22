# 08 운영 엔지니어링 / 02 복제

백업과 복구가 넘긴 binary log의 정체를 밝히고, 그 로그로 Primary-Replica 복제를 손으로 구성한다. 비동기 복제의 대가인 복제 지연과 읽기 일관성 문제를 확인하고, 클라우드의 Read Replica가 무엇을 자동화하는지 짚는다.

## What you will learn

- binary log: 서버 레벨 논리 로그(DML/DDL), **redo log와 다름**(엔진 내부 물리 vs 서버 레벨 논리), 3포맷(기본 MIXED)
- 같은 binary log가 복제(옆으로 흘림)와 시점 복구(뒤로 재생)에 쓰임 (PITR은 백업과 복구에서 회수)
- Primary-Replica 비동기 복제: binlog → IO 스레드 → relay log → SQL 스레드
- 복제 구성: `server_id`·`log-bin`·복제 사용자·`CHANGE MASTER TO`·`START SLAVE`, `SHOW SLAVE STATUS` 판독
- ⭐ 복제 지연(`Seconds_Behind_Master`)과 읽기 일관성: "방금 저장한 게 안 보여요"
- 실습: Linked Clone Replica 구성, 전파 확인, 복제 지연 관찰 (Read Replica·Multi-AZ 자동화 hook)

## Reference

- Notion: [Notion document]()

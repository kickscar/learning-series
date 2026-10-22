# 06 트랜잭션과 동시성 / 02 격리 수준과 락

격리 수준 네 단계와 세 가지 이상 현상을 보고, InnoDB 락이 어떻게 락 대기를 만들며 그 대기가 커넥션 풀을 매개로 서비스 전체 장애로 번지는지 확인한다. 이 시리즈 엔지니어링 앵글의 시그니처 섹션이다. 실습은 music album에서 한다.

## What you will learn

- 격리 수준 4단계(`READ UNCOMMITTED`→`READ COMMITTED`→`REPEATABLE READ`(InnoDB 기본)→`SERIALIZABLE`)와 Dirty·Non-repeatable·Phantom Read
- MVCC 일관된 읽기(스냅샷, 안 막힘) vs 락 읽기(`UPDATE`, X 락) — "조회는 되는데 갱신은 멈춘다"
- InnoDB 락: 행·갭·넥스트 키 락, REPEATABLE READ `UPDATE`의 락 범위와 인덱스 영향
- ⭐ 락 대기 캐스케이드: 락 대기 → 커넥션 풀 고갈 → 서비스 장애 (`innodb_lock_wait_timeout`, `ERROR 1205`, 데드락 구분)
- 실습: 두 세션 락 대기 관찰, `SHOW PROCESSLIST`·`SHOW ENGINE INNODB STATUS` 진단, 격리 수준 실험(Non-repeatable Read)
- **lab01** 락 대기와 진단(두 세션 X락 충돌, PROCESSLIST/INNODB STATUS) / **lab02** 격리 수준과 Non-repeatable Read(READ COMMITTED 재현, REPEATABLE READ 대비)

## Reference

- Notion: [Notion document]()

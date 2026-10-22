# 06 트랜잭션과 동시성 / 03 WAL과 복구

Write-Ahead Logging(WAL)이 지속성을 어떻게 실현하는지, redo·undo log가 크래시에서 데이터를 어떻게 되살리고 되돌리는지, 그 구조가 디스크 I/O 패턴을 어떻게 결정하는지를 본다. Ch06을 닫으며 앞에서 미뤄둔 "어떻게"에 답하는 이론 섹션이다.

## What you will learn

- WAL 원리: 데이터보다 로그를 먼저 쓴다, 버퍼 풀·dirty page, 커밋 지속성은 redo log가 보장
- redo log(변경 후·순차·roll forward) vs undo log(변경 전·roll back·`ROLLBACK`·MVCC 스냅샷)
- 크래시 복구: redo roll forward(Durability) + undo roll back(Atomicity), 재시작 시 자동
- `innodb_flush_log_at_trx_commit`(0/1/2, 기본 1) = 지속성 다이얼
- ⭐ WAL과 디스크 I/O: redo 순차 쓰기 vs 데이터 파일 랜덤 쓰기, SSD/HDD
- 경계: 크래시 복구 ≠ 백업 복구(백업과 복구), redo log ≠ binary log(복제)

## Reference

- Notion: [Notion document]()

# 06 트랜잭션과 동시성 / 01 ACID와 트랜잭션

트랜잭션이 보장하는 네 가지 성질(ACID)을 보고, 정규화한 music에서 `COMMIT`·`ROLLBACK`으로 원자성을, 두 세션으로 격리성의 맛보기를 확인한다. 성능(Ch05)에 이어 "안전"의 문제를 다룬다.

## What you will learn

- 트랜잭션 = 논리적 작업 단위, all-or-nothing (InnoDB가 지원)
- ACID: 원자성·일관성·격리성·지속성 (정의 + music 예)
- `START TRANSACTION`·`COMMIT`·`ROLLBACK`과 **autocommit 함정**(기본 1, 각 문장 즉시 커밋 / DDL 암묵 커밋)
- 원자성 데모: 앨범 + 수록곡을 한 트랜잭션으로 넣고 `ROLLBACK` → 두 테이블 전부 취소
- 커밋 가시성 데모: 두 세션에서 미커밋 변경이 안 보이다 커밋 후 보임 (격리 수준·락은 다음 섹션, 지속성 메커니즘은 WAL과 복구)
- **lab01** 트랜잭션과 원자성(참조 데이터 INSERT, `START TRANSACTION`/`ROLLBACK` all-or-nothing) / **lab02** 커밋 가시성과 격리성(두 세션, 미커밋 불가시성)

## Reference

- Notion: [Notion document]()

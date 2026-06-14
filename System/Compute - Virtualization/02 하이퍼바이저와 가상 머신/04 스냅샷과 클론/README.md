# 02 하이퍼바이저와 가상 머신 / 04 스냅샷과 클론

스냅샷의 내부 원리(차분 디스크)를 이해하고, Full Clone과 Linked Clone의 차이를 체험하며, Golden Image 패턴으로 재현 가능한 Lab 환경을 만드는 방법을 익힌다.

## What you will learn

- 스냅샷이 차분 디스크로 동작하는 원리
- 롤백으로 특정 시점 상태를 복원하는 방법
- Full Clone과 Linked Clone의 차이와 디스크 사용량 비교
- Golden Image 패턴 (Base VM + Snapshot + Linked Clone)

## Examples

- `lab01` → 스냅샷 생성·롤백, Linked Clone·Full Clone 생성, 디스크 사용량 비교

## Reference

- Notion: [Notion document](https://app.notion.com/p/04-375dc703ccda80e995a0db69546253da?source=copy_link)

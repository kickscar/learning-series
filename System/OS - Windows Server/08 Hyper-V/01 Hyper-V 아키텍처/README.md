# 08 Hyper-V / 01 Hyper-V 아키텍처

Windows Server 내장 Type-1 하이퍼바이저 Hyper-V의 아키텍처를 다룬다. 이론 전용 섹션으로, Root Partition 구조, VirtualBox(Type-2)와의 차이, 가상 스위치·체크포인트를 보고, Azure 컴퓨트가 Hyper-V 기반이라는 연결을 인식한다. 이 시리즈가 가리켜 온 종착점이다.

## What you will learn

- Hyper-V = Type-1 하이퍼바이저. 켜면 Windows가 Root Partition(특권 VM)으로 부팅, 게스트는 Child Partition(가상 디바이스 via VMBus)
- VirtualBox(Type-2, 호스트 OS 위) vs Hyper-V(Type-1, 하드웨어 직접·프로덕션급)
- 가상 스위치: External(Bridged)/Internal(Host-Only)/Private(Internal Network)
- 체크포인트: Standard(메모리 포함, 일관성 주의) vs Production(VSS 기반, 기본)
- Azure 컴퓨트가 Hyper-V 기반 (Azure Migrate/Arc/Local), 시리즈 종착점

## Examples

- 이론 전용 (실습 없음). 실제 Hyper-V 역할 설치·VM 생성은 Hyper-V 운영에서 다룬다.

## Reference

- Notion: [Notion document]()

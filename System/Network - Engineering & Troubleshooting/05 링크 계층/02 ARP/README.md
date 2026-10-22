# 05 링크 계층 / 02 ARP

ARP의 동작 원리(Request/Reply), ARP와 라우팅의 관계(같은 서브넷 vs 게이트웨이), ARP 테이블을 다루고 패킷 캡처로 관찰한다.

## What you will learn

- ARP: IP → MAC 변환. EtherType 0x0806, 같은 서브넷에서만 동작
- Request(브로드캐스트) → Reply(유니캐스트)
- 같은 서브넷: 목적지 MAC을 ARP. 다른 서브넷: 게이트웨이 MAC을 ARP
- IP = End-to-End (변하지 않음), MAC = Hop-by-Hop (매 홉마다 변함)
- ARP 테이블: ip neigh show, REACHABLE → STALE, 캐시 효과

## Lab

- lab01: ARP 패킷 캡처 (캐시 초기화 → ARP 발생, 두 번째 ping → ARP 없음, 다른 서브넷 → 게이트웨이 MAC만)

## Reference

- Notion: [Notion document]()

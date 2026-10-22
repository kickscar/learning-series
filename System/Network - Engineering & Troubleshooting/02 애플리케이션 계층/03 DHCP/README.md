# 02 애플리케이션 계층 / 03 DHCP

DHCP의 동작 원리(DORA), 임대/갱신, 릴레이를 다루고 패킷 캡처로 4단계를 관찰한다.

## What you will learn

- DHCP: IP, 서브넷, 게이트웨이, DNS를 자동 할당
- DORA: Discover(브로드캐스트) → Offer → Request(브로드캐스트) → Ack
- 임대(Lease): T1(50% 갱신), T2(87.5% 재바인딩), 만료
- DHCP 릴레이: 브로드캐스트가 라우터를 넘지 못하는 문제 해결
- UDP 67(서버)/68(클라이언트): 양쪽 고정 포트인 이유
- 0.0.0.0에서 시작하는 브로드캐스트 캡처

## Lab

- lab01: DHCP 패킷 캡처 (nmcli down/up + tcpdump port 67/68, DORA 4패킷)

## Reference

- Notion: [Notion document]()

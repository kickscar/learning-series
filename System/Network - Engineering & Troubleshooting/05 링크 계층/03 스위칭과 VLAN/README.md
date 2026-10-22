# 05 링크 계층 / 03 스위칭과 VLAN

스위치 동작(MAC 테이블), VLAN(802.1Q), 클라우드에서의 L2 추상화. 인식 수준.

## What you will learn

- 스위치: MAC 주소 테이블로 목적지 포트에만 전달. 허브와 차이
- MAC 테이블: 학습(출발지 MAC) → 전달(목적지 MAC) → 플러딩(Unknown Unicast)
- VLAN (802.1Q): 물리 스위치를 논리 네트워크로 분리. 브로드캐스트 도메인 축소
- 802.1Q 태그: 4바이트, VLAN ID 12비트 (최대 4094)
- Access 포트 vs Trunk 포트
- 클라우드: L2 추상화, 서브넷(L3)으로 분리

## Reference

- Notion: [Notion document]()

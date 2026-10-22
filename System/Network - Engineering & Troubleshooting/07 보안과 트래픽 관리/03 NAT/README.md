# 07 보안과 트래픽 관리 / 03 NAT

NAT는 패킷 헤더의 IP 주소를 재작성하는 동작이다. 사설 IP를 공인 IP로 변환하여 인터넷 통신을 가능하게 한다. 이론 전용. 실습은 07.04 [실습] 미니 데이터센터: NAT에서 수행.

## What you will learn

- NAT의 본질: IP/TCP/UDP 헤더의 주소·포트·체크섬 재작성
- SNAT(출발지 변환) / DNAT(목적지 변환, 포트 포워딩)
- MASQUERADE: 동적 SNAT. 나가는 인터페이스 IP 자동 사용 (DHCP 환경)
- PAT: 하나의 공인 IP를 포트 번호로 공유
- DNAT은 prerouting, SNAT은 postrouting (라우팅 결정 전후 위치)
- conntrack의 자동 역변환. 역방향 NAT 규칙 불필요
- NAT의 한계: End-to-End 연결성 파괴, IPv6에서 불필요

## Reference

- Notion: [Notion document]()

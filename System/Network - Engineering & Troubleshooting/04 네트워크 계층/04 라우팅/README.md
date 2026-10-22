# 04 네트워크 계층 / 03 라우팅

패킷 포워딩, 라우팅 테이블, 기본 게이트웨이, 정적 라우팅, IP Forwarding을 다룬다. 이론 전용. 실습은 04.04 [실습] 미니 데이터센터: 네트워크와 라우팅에서 수행.

## What you will learn

- 패킷 포워딩: 목적지 IP → 다음 홉 결정 (Hop-by-Hop)
- 라우팅 테이블: ip route show, Longest Prefix Match
- 기본 게이트웨이: default route (0.0.0.0/0)
- 정적 라우팅: ip route add(임시), nmcli +ipv4.routes(영구)
- IP Forwarding: sysctl net.ipv4.ip_forward=1, Linux를 라우터로

## Reference

- Notion: [Notion document]()

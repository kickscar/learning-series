# 07 보안과 트래픽 관리 / 01 방화벽

패킷 헤더 기반 필터링, netfilter/nftables, 규칙 구조, 상태 기반 필터링을 다룬다. 이론 전용. 실습은 07.02 [실습] 미니 데이터센터: 방화벽에서 수행.

## What you will learn

- 방화벽 본질: 패킷 헤더(IP, TCP/UDP) 기반 필터링
- inbound/outbound/forward, accept/drop/reject
- netfilter(커널) → nftables(규칙 엔진). iptables는 레거시
- nftables 구조: 테이블 → 체인(hook) → 규칙
- 상태 기반 필터링: ct state established,related accept
- firewalld = nftables 프론트엔드. 혼용 금지

## Reference

- Notion: [Notion document]()

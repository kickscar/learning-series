# 02 애플리케이션 계층 / 02 DNS

DNS의 동작 원리, 도메인 계층, 레코드 타입, 재귀/반복 질의를 다루고 패킷 캡처로 UDP 53 통신을 관찰한다.

## What you will learn

- DNS: 도메인 → IP 변환, 분산 계층형 데이터베이스
- 동작 원리: Recursive(재귀) vs Iterative(반복) 질의, Root → TLD → Auth
- 도메인 계층: Root(.) → TLD → SLD → Subdomain, 13개 Root Server
- 레코드: A, AAAA, CNAME, MX, NS, PTR, SOA, TXT
- TTL: 캐시 유지 시간, "전파 시간"의 실체
- UDP 53 기본, TCP는 Zone Transfer/응답 초과 시
- dig: +short, +trace, +noall +answer, @server
- HTTP(TCP)와 DNS(UDP)의 패킷 캡처 차이

## Lab

- lab01: DNS 질의와 패킷 캡처 (dig, +trace, tcpdump port 53, NXDOMAIN)

## Reference

- Notion: [Notion document]()

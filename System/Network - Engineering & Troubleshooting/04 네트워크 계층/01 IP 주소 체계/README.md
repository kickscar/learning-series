# 04 네트워크 계층 / 01 IP 주소 체계

IPv4(32비트)와 IPv6(128비트)의 주소 구조, 클래스(역사), 공인/사설 IP, 듀얼 스택을 다룬다.

## What you will learn

- IPv4: 32비트, 점 표기법, 네트워크부 + 호스트부
- 클래스(역사): A/B/C의 비효율 → CIDR로 대체 (04.02)
- 공인 IP vs 사설 IP (RFC 1918): 10.0.0.0/8, 172.16.0.0/12, 192.168.0.0/16
- 특수 주소: 루프백(127.0.0.1), 브로드캐스트(255.255.255.255), Link-Local(169.254)
- IPv6: 128비트, 콜론 16진수, 축약(::), Link-Local(fe80::) 자동 생성
- 듀얼 스택: IPv4 + IPv6 공존. Rocky Linux 9 기본 활성화

## Lab

- lab01: IP 주소 확인과 IPv6 (ip addr, 사설/루프백/Link-Local 구분, ping -4/-6)

## Reference

- Notion: [Notion document]()

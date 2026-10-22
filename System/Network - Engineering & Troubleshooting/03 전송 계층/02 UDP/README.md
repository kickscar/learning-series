# 03 전송 계층 / 02 UDP

UDP의 동작 원리, 헤더(8바이트), TCP vs UDP 비교, UDP를 쓰는 이유를 다루고 TCP와 UDP 패킷을 나란히 캡처하여 비교한다.

## What you will learn

- UDP: 비연결, 비신뢰, 순서 미보장. RFC 768 (1980, 40년+ 현행)
- 헤더 8바이트 (Source Port, Dest Port, Length, Checksum). TCP 20바이트의 절반 이하
- TCP vs UDP: 연결, 신뢰성, 흐름/혼잡 제어, 헤더 크기, 패킷 수
- UDP 사용 사례: DNS, DHCP, 스트리밍, 게임, QUIC(HTTP/3)
- Datagram(메시지 경계 보존) vs Byte Stream
- TCP 10패킷 vs UDP 2패킷 나란히 캡처 비교

## Lab

- lab01: TCP vs UDP 패킷 비교 (DNS(UDP) + HTTP(TCP) 나란히 캡처, 패킷 수/Flags/seq 대비)

## Reference

- Notion: [Notion document]()

# 03 전송 계층 / 03 포트와 소켓

포트 번호의 역할과 범위, 소켓(IP+Port), 멀티플렉싱, TCP/IP 커널 구현과 Socket API를 다루고 ss로 소켓을 관찰한다.

## What you will learn

- 포트 번호: Well-known(0~1023), Registered(1024~49151), Dynamic(49152~65535)
- 소켓 = IP + Port. TCP 5-tuple로 연결 식별
- 멀티플렉싱/디멀티플렉싱: UDP 2-tuple vs TCP 4-tuple
- 프로토콜 구현: OS 커널(TCP/UDP/IP) + Socket API(경계) + User Space(앱)
- BSD Socket (1983): POSIX 표준, 모든 OS가 구현
- ss -tlnp/ulnp: Listen 포트 확인, ss -tn: ESTABLISHED 소켓 쌍

## Lab

- lab01: 포트와 소켓 관찰 (ss Listen/ESTABLISHED, ephemeral 포트 할당, 동시 연결 4-tuple 구분)

## Reference

- Notion: [Notion document]()

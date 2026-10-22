# 03 전송 계층 / 01 TCP

TCP 헤더(Flag 필드 중심), 주요 개념(Seq/Ack, 흐름/혼잡 제어), 작동 원리(3-way, 데이터 전송, 4-way, TIME_WAIT)를 다루고 telnet으로 전체 흐름을 캡처하여 3개 구간으로 분석한다.

## What you will learn

- TCP 헤더: 20바이트, Flag(SYN/ACK/FIN/PSH/RST), MSS(SYN 옵션)
- Seq/Ack: ACK = SEQ + length, Cumulative ACK, 바이트 단위 추적
- 흐름 제어: Window Size, Window Scale, Zero Window (수신자 보호)
- 혼잡 제어: Slow Start, Congestion Avoidance (네트워크 보호)
- 3-way handshake: SYN=1 → SYN=1,ACK=1 → ACK=1
- 데이터 전송: PSH=1,ACK=1, Seq/Ack 산술
- 4-way 종료: FIN=1,ACK=1, Active/Passive Close
- TIME_WAIT: Active Close, 60초. CLOSE_WAIT: 앱 버그

## Lab

- lab01: TCP 전체 흐름 캡처와 분석 (telnet + tcpdump 1회 캡처 → 3구간 분석: handshake/데이터/종료)
- lab02: 소켓 상태 관찰 (ss, ESTABLISHED → TIME_WAIT 전이)

## Reference

- Notion: [Notion document]()

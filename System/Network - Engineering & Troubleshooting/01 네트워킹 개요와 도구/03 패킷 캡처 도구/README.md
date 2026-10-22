# 01 네트워킹 개요와 도구 / 03 패킷 캡처 도구

패킷 캡처의 필요성, tcpdump와 Wireshark, 실무 워크플로우를 다룬다. 시리즈 전체에서 사용할 핵심 도구.

## What you will learn

- 왜 패킷 캡처인가: Header의 비트열을 눈으로 확인하는 유일한 방법
- tcpdump: CLI 캡처, 옵션(-i, -nn, -c, -w), BPF 필터(host, port, and/or)
- tcpdump 출력 읽기: TCP 플래그([S], [S.], [.], [P.], [F.]), ICMP echo
- Wireshark: GUI 분석, 3패널(List/Details/Bytes), 디스플레이 필터
- 실무 워크플로우: 서버 tcpdump -w → scp → 로컬 Wireshark 분석
- libpcap: 두 도구의 공통 기반 라이브러리

## Lab

- lab01: tcpdump 첫 캡처 (SSH 트래픽 관찰, ICMP 캡처, .pcap 저장/읽기, 필터 조합)

## Reference

- Notion: [Notion document]()

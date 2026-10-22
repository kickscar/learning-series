# 01 네트워킹 개요와 도구 / 02 계층 모델

계층화의 이유, TCP/IP 4계층, OSI 7계층, 캡슐화와 역캡슐화를 다룬다.

## What you will learn

- 계층화: 모듈화, 추상화, 서비스 모델
- TCP/IP 4계층: Link, Internet, Transport, Application (인터넷의 실제 구현)
- OSI 7계층: 참조 모델, L2/L3/L7 분류 도구
- 캡슐화: Data → Segment → Packet → Frame. 프로토콜은 각 계층 Header에 비트열로 존재
- 역캡슐화: EtherType, Protocol, 포트 번호로 상위 프로토콜 식별
- 구현 위치: OS 커널 TCP/IP 스택 + 소켓 인터페이스 (03.03 예고)

## Reference

- Notion: [Notion document]()

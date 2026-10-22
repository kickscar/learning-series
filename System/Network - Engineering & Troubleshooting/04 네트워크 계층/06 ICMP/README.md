# 04 네트워크 계층 / 06 ICMP

ICMP의 역할, 메시지 타입(Echo, Destination Unreachable, Time Exceeded), ping, traceroute를 다루고 미니 데이터센터 환경에서 TTL 감소를 관찰한다.

## What you will learn

- ICMP: Network 계층 제어/에러 프로토콜. 포트 없음, Type+Code로 구분
- 메시지 타입: Echo(0/8), Destination Unreachable(3), Time Exceeded(11)
- TTL: 라우터 통과 시 1 감소, 0이면 폐기 + Time Exceeded 반환
- ping: Echo Request/Reply, 연결 가능성 확인
- traceroute: TTL을 1부터 증가시켜 각 홉의 IP 추적

## Lab

- lab01: ICMP 패킷 캡처와 경로 추적 (미니 데이터센터 환경에서 TTL 감소 관찰)

## Reference

- Notion: [Notion document]()

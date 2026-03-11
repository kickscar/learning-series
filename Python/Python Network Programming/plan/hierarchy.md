# Python Network Programming - 상세 Hierarchy

Python을 이용한 네트워크 통신의 기본 원리와 서버/클라이언트 구현 방법을 다룬다. 이 Series는 이후 Web Server / Web Framework / Async Server의 기반이 된다.

---

## Chapter 01: Network Fundamentals

| Section | 내용 | 실습 |
| ------- | ---- | ---- |
| 1.1 | OSI Model | Wireshark로 계층별 패킷 관찰 |
| 1.2 | TCP / UDP | Wireshark로 TCP/UDP 패킷 비교 |
| 1.3 | IP Address | Wireshark로 IP 헤더·주소 관찰 |
| 1.4 | Port | Wireshark로 포트 필드 관찰 |

## Chapter 02: Python Socket Programming

본격 소켓 프로그래밍. 코드 실습 중심. 서버 다중 처리의 두 가지 방법(selectors, Thread)을 다룬다. 이후 Ch07에서 비동기로 개선되는 흐름을 따른다.

| Section | 내용 | 실습 |
| ------- | ---- | ---- |
| 2.1 | socket 모듈 - bind, listen, accept, send, recv | 기본 TCP/UDP 소켓 생성 |
| 2.2 | TCP Socket | Echo Client/Server |
| 2.3 | UDP Socket | UDP Echo Client/Server |
| 2.4 | Blocking vs Non-Blocking IO | - |
| 2.5 | 서버 다중 처리 - Selectors | 다중 클라이언트 Echo Server |
| 2.6 | 서버 다중 처리 - Thread | 멀티스레드 Echo Server |
| 2.7 | Chatting Client/Server | Chatting C/S (다중처리 적용) |
| 2.8 | Simple HTTP Server | raw socket HTTP Server (다중처리 적용) |

## Chapter 03: TCP Internals

TCP 연결/종료, 데이터 송수신, Keep-Alive 내부 동작과 관련 소켓 옵션 실습.

| Section | 내용 | 실습 |
| ------- | ---- | ---- |
| 3.1 | TCP 연결/종료 | Wireshark로 handshake 관찰, SO_REUSEADDR (Time-wait 대응) |
| 3.2 | TCP 데이터 송수신 | Sliding Window, Nagle → 소켓 버퍼, TCP_NODELAY |
| 3.3 | TCP Keep-Alive | SO_KEEPALIVE (장시간 연결, 죽은 연결 감지) |

## Chapter 04: HTTP Protocol

| Section | 내용 | 실습 |
| ------- | ---- | ---- |
| 4.1 | HTTP request / response | raw socket으로 HTTP GET, Wireshark로 HTTP 패킷 관찰 |
| 4.2 | Headers, Methods, Status codes | - |
| 4.3 | Persistent connection, Keep-Alive | - |

## Chapter 05: Building HTTP Client

| Section | 내용 | 실습 |
| ------- | ---- | ---- |
| 5.1 | urllib3 | 기본 사용 |
| 5.2 | requests | 기본 사용, Session |
| 5.3 | httpx | 동기/비동기 기본 사용 |

## Chapter 06: Building HTTP Server

http.server, aiohttp. (uvicorn, WSGI/ASGI는 Series 03 Web Server에서 다룸)

| Section | 내용 | 실습 |
| ------- | ---- | ---- |
| 6.1 | http.server (stdlib) | Simple HTTP Server |
| 6.2 | aiohttp Async HTTP Server | aiohttp Server |

## Chapter 07: Async Network Programming

Ch02 서버 다중 처리(selectors, Thread)를 비동기로 개선. Event loop, Async IO. 성능·리소스 이점을 설명한다. (asyncio 심화는 Series 08에서)

| Section | 내용 | 실습 |
| ------- | ---- | ---- |
| 7.1 | Event loop, Async IO 개념 | - |
| 7.2 | asyncio | async/await 예제 |
| 7.3 | aiohttp Client/Server | aiohttp HTTP Client |

## Chapter 08: Streaming

| Section | 내용 | 실습 |
| ------- | ---- | ---- |
| 8.1 | HTTP Client Streaming | requests/httpx stream |
| 8.2 | HTTP Server Streaming | Streaming response |

## Chapter 09: WebSocket Programming

| Section | 내용 | 실습 |
| ------- | ---- | ---- |
| 9.1 | WebSocket 프로토콜 | - |
| 9.2 | websockets 라이브러리 | Echo WebSocket Server/Client |

---

## Series 연계 안내

| Chapter | 연계 Series |
| ------- | ----------- |
| Ch06 Building HTTP Server | 운영용 HTTP 서버(WSGI/ASGI, uvicorn)는 **Series 03 Web Server**에서 |
| Ch07 Async Network Programming | asyncio 심화(task, 동시성 패턴)는 **Series 08 Async Programming**에서 |

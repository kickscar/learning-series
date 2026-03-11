# Python Network Programming 기술 문서 작성 계획

## 1. 문서 개요

| 항목 | 내용 |
| ---- | ---- |
| 대상 Python | 3.12+ |
| 실습 형식 | 마크다운 문서 내 코드 블록 |
| 관찰 도구 | Wireshark (패킷 캡처·분석, Ch01·Ch03 등 실습 시 반영) |
| Chapter 이름 | 영어 (예: Network Fundamentals) |
| Section 이름 | 영어/한글 자유 |
| 구조 | Chapter > Section(내용) > 실습 |

---

## 2. 참고: Python Network Programming 세부내용

Python을 이용한 네트워크 통신의 기본 원리와 서버/클라이언트 구현 방법을 다룬다. 이 Series는 이후 Web Server / Web Framework / Async Server의 기반이 된다.

### 핵심 기술 / 이론

**Network Fundamentals**: OSI Model, TCP/UDP, IP Address, Port, DNS, TLS/SSL

**Socket Programming**: Client/Server Model, bind/listen/accept/send/recv, Blocking vs Non-Blocking IO

**HTTP Protocol**: request/response, Headers, Methods, Status codes, Persistent connection, Keep-Alive

**Concurrency**: Thread-per-request, Process model, Event loop, Async IO

**실무**: HTTP Client, HTTP Server

### 주요 Python 라이브러리

- **Low-level**: socket, selectors, ssl (stdlib)
- **HTTP client**: requests, httpx, urllib3
- **HTTP Server**: http.server, aiohttp (uvicorn, WSGI/ASGI는 Series 03 Web Server에서)
- **기타**: websockets

---

## 3. 전체 Hierarchy

상세 Hierarchy는 [hierarchy.md](hierarchy.md) 참조.

---

## 4. 문서 파일 구조

```
plan/
  README.md
  hierarchy.md

./{chapter no} {chapter name}/{section no} {section name}/{chapter no}{section no}notion.cursor.md

01 Network Fundamentals/
  01 OSI Model/0101notion.cursor.md
  02 TCP UDP/0102notion.cursor.md
  03 IP Address/0103notion.cursor.md
  04 Port/0104notion.cursor.md
02 Python Socket Programming/
  01 socket 모듈/0201notion.cursor.md
  02 TCP Socket/0202notion.cursor.md
  03 UDP Socket/0203notion.cursor.md
  04 Blocking vs Non-Blocking IO/0204notion.cursor.md
  05 서버 다중 처리 - Selectors/0205notion.cursor.md
  06 서버 다중 처리 - Thread/0206notion.cursor.md
  07 Chatting Client Server/0207notion.cursor.md
  08 Simple HTTP Server/0208notion.cursor.md
03 TCP Internals/
  01 TCP 연결 종료/0301notion.cursor.md
  02 TCP 데이터 송수신/0302notion.cursor.md
  03 TCP Keep-Alive/0303notion.cursor.md
04 Async Network Programming/
  01 Event loop Async IO/0401notion.cursor.md
  02 asyncio/0402notion.cursor.md
05 HTTP Protocol/
  01 HTTP request response/0501notion.cursor.md
  02 Headers Methods Status codes/0502notion.cursor.md
  03 Persistent connection Keep-Alive/0503notion.cursor.md
06 Building HTTP Client/
  01 urllib3/0601notion.cursor.md
  02 requests/0602notion.cursor.md
  03 aiohttp Async HTTP Client/0603notion.cursor.md
  04 httpx/0604notion.cursor.md
07 Building HTTP Server/
  01 http.server/0701notion.cursor.md
  02 aiohttp Async HTTP Server/0702notion.cursor.md
08 Streaming/
  01 HTTP Client Streaming/0801notion.cursor.md
  02 HTTP Server Streaming/0802notion.cursor.md
09 WebSocket Programming/
  01 WebSocket 프로토콜/0901notion.cursor.md
  02 websockets 라이브러리/0902notion.cursor.md
```

---

## 5. 결정 사항

| 항목 | 결정 |
| ---- | ---- |
| Ch02 Python Socket Programming | 코드 실습 다수 (Echo, Chatting, Simple HTTP Server) |
| Ch03 TCP Internals | TCP 내부 동작, 알고리즘(Nagle, Sliding Window), 소켓 옵션 실습 |
| Ch02 서버 다중 처리 | 두 가지 방법: selectors 멀티플렉싱, Thread-per-request → Ch04 비동기로 개선 |
| DNS & TLS | 제외 (Ch06 Building HTTP Client에서 getaddrinfo, ssl 필요 시 통합) |
| Streaming | 별도 Chapter (Ch08) - HTTP Client/Server Streaming |
| Ch04 Async | 비동기 완전 다룸, Ch02 selectors/thread 대비 성능 우수 설명 |
| Connection Pool | 제외 |
| uvicorn, WSGI/ASGI | 제외 (Series 03 Web Server에서) |
| Wireshark | Ch01 전 섹션, Ch03.1, Ch05.1 실습 시 패킷 관찰. 실습 작성 시 **자세히 문서화** |

---

## 6. 작성 순서 권장

1. **Phase 1**: Ch01, Ch02, Ch03 (기초 + 소켓 + TCP Internals)
2. **Phase 2**: Ch04 (Async Network Programming)
3. **Phase 3**: Ch05 (HTTP Protocol)
4. **Phase 4**: Ch06, Ch07 (HTTP Client, HTTP Server)
5. **Phase 5**: Ch08, Ch09 (Streaming, WebSocket)

---

## 7. 다음 단계

Phase 1부터 Section별 기술 문서 초안 작성 지시.

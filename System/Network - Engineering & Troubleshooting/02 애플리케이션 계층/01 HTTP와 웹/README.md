# 02 애플리케이션 계층 / 01 HTTP와 웹

HTTP의 동작 원리, 메시지 구조, 메서드, 상태 코드를 다루고 패킷 캡처로 평문 Header를 관찰한다.

## What you will learn

- HTTP: 클라이언트-서버 모델의 첫 번째 실체. TCP 위에서 동작
- 메시지 구조: 요청 라인/상태 라인 + 헤더 + 빈 줄 + 바디
- 메서드: GET, POST, PUT, DELETE (CRUD 대응, Safe/Idempotent)
- 상태 코드: 2xx(성공), 3xx(리다이렉트), 4xx(클라이언트 오류), 5xx(서버 오류)
- HTTP 버전: 1.1(keep-alive), 2(멀티플렉싱), 3(QUIC/UDP)
- HTTP Header는 평문: tcpdump -A로 직접 읽을 수 있다
- curl: -v(상세), -I(HEAD), -X(메서드 지정)

## Lab

- lab01: HTTP 패킷 캡처 (curl -v + tcpdump -A, 200 OK / 404 Not Found)

## Reference

- Notion: [Notion document]()

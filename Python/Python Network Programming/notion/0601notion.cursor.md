# 6.1 http.server

## 개요

본 Section은 Python 표준 라이브러리 **http.server**를 사용한 간단한 HTTP 서버 구동을 다룬다. http.server는 개발·테스트용으로 현재 디렉터리의 파일을 서빙한다. 학습 흐름은 다음과 같다. ① http.server의 구조, SimpleHTTPRequestHandler, ThreadingTCPServer, ThreadingHTTPServer, ForkingTCPServer를 이해한다. ② 명령줄과 스크립트로 Simple HTTP Server를 실행한다.

## 이론

### http.server의 역할

> **http.server**는 Python 표준 라이브러리로, 간단한 HTTP 서버를 구동한다. 프로덕션 환경에는 권장되지 않으며, 개발·테스트용이다.

Ch02에서 raw socket으로 구현한 Simple HTTP Server와 달리, http.server는 HTTP 요청 파싱과 응답 생성을 내장한다. 운영용 서버(WSGI/ASGI, uvicorn)는 Series 03 Web Server에서 다룬다.

### SimpleHTTPRequestHandler

> **SimpleHTTPRequestHandler**는 현재 디렉터리와 하위 디렉터리의 정적 파일을 GET으로 서빙한다.

`GET /` 요청 시 `index.html`을, `GET /path/to/file` 요청 시 해당 파일을 응답한다. `Content-Type`은 파일 확장자에 따라 자동 설정된다.

### HTTPServer와 TCPServer

`HTTPServer`는 `socketserver.TCPServer`를 상속한다. `(host, port)`와 `Handler` 클래스를 받아 서버를 생성하고, `serve_forever()`로 요청을 처리한다. 기본 `TCPServer`는 한 번에 하나의 요청만 처리한다.

### ThreadingTCPServer

> **ThreadingTCPServer**는 `ThreadingMixIn`과 `TCPServer`를 조합한 클래스로, 요청마다 새 스레드를 생성하여 동시에 여러 요청을 처리한다.

`socketserver.ThreadingTCPServer`를 사용하면, 각 연결이 별도 스레드에서 처리된다. 브라우저가 미리 소켓을 열어두는 경우처럼 동시 연결이 많을 때 유용하다.

### ThreadingHTTPServer

> **ThreadingHTTPServer**는 `ThreadingMixIn`과 `HTTPServer`를 조합한 클래스로, HTTP 요청을 스레드별로 처리한다. (Python 3.7+)

`http.server.ThreadingHTTPServer`를 사용하면 동시 HTTP 요청을 처리할 수 있다. `python -m http.server`는 Python 3.7부터 내부적으로 `ThreadingHTTPServer`를 사용한다.

### ForkingTCPServer (참고)

> **ForkingTCPServer**는 `ForkingMixIn`과 `TCPServer`를 조합한 클래스로, 요청마다 새 **프로세스**를 생성한다.

**ThreadingTCPServer와의 차이**: ThreadingTCPServer는 **스레드**를, ForkingTCPServer는 **프로세스**를 사용한다. ForkingTCPServer는 CPU-bound 작업에 유리하지만, 프로세스 생성 비용이 크고 **Windows에서 동작하지 않는다**. 본 Section의 실습에서는 사용하지 않는다.

## 실습

### 환경

- Python 3.12+
- 설치 패키지: 없음 (표준 라이브러리)

    ```bash
    # http.server는 stdlib에 포함되어 별도 설치 불필요
    ```

### 목표

http.server로 Simple HTTP Server를 구동하고, 브라우저 또는 curl로 접근한다.

### lab1: 명령줄로 서버 실행

`python -m http.server`는 Python 3.7부터 내부적으로 **ThreadingHTTPServer**를 사용하여 동시 요청을 처리한다.

#### 단계 1: 기본 서버 구동

```bash
# 터미널에서 실행. 현재 디렉터리를 루트로 서빙한다
$ python -m http.server 8000
```

**예상 결과**: `Serving HTTP on 0.0.0.0 port 8000 ...`가 출력되고, 서버가 대기한다.

#### 단계 2: CLI 옵션 사용

```bash
# -b: 바인드 주소 (기본: 0.0.0.0)
# -d: 서빙할 디렉터리 (기본: 현재 디렉터리)
$ python -m http.server -b 127.0.0.1 -d static 8080
```

**예상 결과**: `127.0.0.1:8080`에서 `static/` 디렉터리를 서빙한다. `static/` 디렉터리가 없으면 오류가 발생한다.

#### 단계 3: 접근 확인

다른 터미널 또는 브라우저에서:

```bash
$ curl http://127.0.0.1:8000/
```

또는 브라우저에서 `http://127.0.0.1:8000/` 접속.

**예상 결과**: 현재 디렉터리의 파일 목록(HTML) 또는 index.html이 반환된다.

### lab2: 스크립트로 서버 실행

#### 단계 1: TCPServer (단일 요청 처리)

```python
# simple_server.py
import http.server
import socketserver

PORT = 8000
Handler = http.server.SimpleHTTPRequestHandler

with socketserver.TCPServer(("", PORT), Handler) as httpd:
    print(f"Serving at port {PORT} (single-threaded)")
    httpd.serve_forever()
```

**예상 결과**: `Serving at port 8000 (single-threaded)` 출력 후 서버가 대기한다. 한 번에 하나의 요청만 처리한다. `Ctrl+C`로 종료한다.

#### 단계 2: ThreadingHTTPServer (동시 요청 처리)

```python
# threading_server.py
import http.server

PORT = 8000
Handler = http.server.SimpleHTTPRequestHandler

with http.server.ThreadingHTTPServer(("", PORT), Handler) as httpd:
    print(f"Serving at port {PORT} (threaded)")
    httpd.serve_forever()
```

**예상 결과**: `Serving at port 8000 (threaded)` 출력 후 서버가 대기한다. 요청마다 새 스레드를 생성하여 동시에 여러 요청을 처리한다.

#### 단계 3: 특정 디렉터리 서빙

```python
# simple_server_directory.py
import http.server
import socketserver

PORT = 8000
DIRECTORY = "static"  # 서빙할 디렉터리

class Handler(http.server.SimpleHTTPRequestHandler):
    def __init__(self, *args, **kwargs):
        super().__init__(*args, directory=DIRECTORY, **kwargs)

with http.server.ThreadingHTTPServer(("", PORT), Handler) as httpd:
    print(f"Serving {DIRECTORY} at port {PORT}")
    httpd.serve_forever()
```

**예상 결과**: `static/` 디렉터리에 `index.html` 등을 두면 해당 경로에서 서빙된다.

### 트러블슈팅

| 현상 | 원인 | 대응 |
|------|------|------|
| `Address already in use` | 포트 8000 사용 중 | 다른 포트 사용 (예: 8080) |
| `Permission denied` | 1024 미만 포트 사용 | 1024 이상 포트 사용 |
| `FileNotFoundError` | `directory` 경로 없음 | `static` 등 디렉터리 생성 후 실행 |

### 실습 포인트

- `python -m http.server 8000`으로 빠르게 서버를 띄울 수 있다. Python 3.7+에서는 ThreadingHTTPServer를 사용한다.
- `-b`, `-d` 옵션으로 바인드 주소와 서빙 디렉터리를 지정할 수 있다.
- `TCPServer`는 단일 요청, `ThreadingHTTPServer`는 동시 요청을 처리한다.

## 핵심 정리

- http.server는 Python 표준 라이브러리로, 개발·테스트용 Simple HTTP Server를 제공한다.
- `SimpleHTTPRequestHandler`는 현재 디렉터리의 정적 파일을 GET으로 서빙한다.
- `TCPServer`는 단일 요청, `ThreadingTCPServer`/`ThreadingHTTPServer`는 스레드로 동시 요청을 처리한다.
- `ForkingTCPServer`는 프로세스를 사용하며 Windows 미지원. 실습에서는 사용하지 않는다.
- `python -m http.server`는 Python 3.7+에서 ThreadingHTTPServer를 사용한다.

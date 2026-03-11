# 6.1 http.server

## 개요

본 Section은 Python 표준 라이브러리 **http.server**를 사용한 간단한 HTTP 서버 구동을 다룬다. http.server는 개발·테스트용으로 현재 디렉터리의 파일을 서빙한다. 학습 흐름은 다음과 같다. ① http.server의 구조와 SimpleHTTPRequestHandler를 이해한다. ② 명령줄과 스크립트로 Simple HTTP Server를 실행한다.

## 이론

### http.server의 역할

> **http.server**는 Python 표준 라이브러리로, 간단한 HTTP 서버를 구동한다. 프로덕션 환경에는 권장되지 않으며, 개발·테스트용이다.

Ch02에서 raw socket으로 구현한 Simple HTTP Server와 달리, http.server는 HTTP 요청 파싱과 응답 생성을 내장한다. 운영용 서버(WSGI/ASGI, uvicorn)는 Series 03 Web Server에서 다룬다.

### SimpleHTTPRequestHandler

> **SimpleHTTPRequestHandler**는 현재 디렉터리와 하위 디렉터리의 정적 파일을 GET으로 서빙한다.

`GET /` 요청 시 `index.html`을, `GET /path/to/file` 요청 시 해당 파일을 응답한다. `Content-Type`은 파일 확장자에 따라 자동 설정된다.

### HTTPServer와 TCPServer

`HTTPServer`는 `socketserver.TCPServer`를 상속한다. `(host, port)`와 `Handler` 클래스를 받아 서버를 생성하고, `serve_forever()`로 요청을 처리한다.

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

#### 단계 1: 서버 구동

```bash
# 터미널에서 실행. 현재 디렉터리를 루트로 서빙한다
$ python -m http.server 8000
```

**예상 결과**: `Serving HTTP on 0.0.0.0 port 8000 ...`가 출력되고, 서버가 대기한다.

#### 단계 2: 접근 확인

다른 터미널 또는 브라우저에서:

```bash
$ curl http://127.0.0.1:8000/
```

또는 브라우저에서 `http://127.0.0.1:8000/` 접속.

**예상 결과**: 현재 디렉터리의 파일 목록(HTML) 또는 index.html이 반환된다.

### lab2: 스크립트로 서버 실행

#### 단계 1: 기본 스크립트

```python
# simple_server.py
import http.server
import socketserver

PORT = 8000
Handler = http.server.SimpleHTTPRequestHandler

with socketserver.TCPServer(("", PORT), Handler) as httpd:
    print(f"Serving at port {PORT}")
    httpd.serve_forever()
```

**예상 결과**: `Serving at port 8000` 출력 후 서버가 대기한다. `Ctrl+C`로 종료한다.

#### 단계 2: 특정 디렉터리 서빙

```python
# simple_server_directory.py
import http.server
import socketserver

PORT = 8000
DIRECTORY = "static"  # 서빙할 디렉터리

class Handler(http.server.SimpleHTTPRequestHandler):
    def __init__(self, *args, **kwargs):
        super().__init__(*args, directory=DIRECTORY, **kwargs)

with socketserver.TCPServer(("", PORT), Handler) as httpd:
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

- `python -m http.server 8000`으로 빠르게 서버를 띄울 수 있다.
- `--directory` 옵션으로 서빙 디렉터리를 지정할 수 있다. (Python 3.7+)
- `serve_forever()`는 블로킹되므로, 한 번에 하나의 요청만 처리한다. (동시 처리 없음)

## 핵심 정리

- http.server는 Python 표준 라이브러리로, 개발·테스트용 Simple HTTP Server를 제공한다.
- `SimpleHTTPRequestHandler`는 현재 디렉터리의 정적 파일을 GET으로 서빙한다.
- `python -m http.server 8000` 또는 `TCPServer` + `Handler`로 서버를 구동한다.
- 운영용 서버는 Series 03 Web Server에서 다룬다.

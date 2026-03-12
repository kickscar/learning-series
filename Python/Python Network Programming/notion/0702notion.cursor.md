# 7.2 aiohttp

## 개요

본 Section은 **aiohttp**를 사용한 비동기 HTTP 서버 구동을 다룬다. 7.1의 ThreadingHTTPServer는 요청마다 스레드를 생성하는 반면, aiohttp는 **이벤트 루프**와 **논블로킹 IO**로 단일 스레드에서 동시에 여러 요청을 처리한다. 학습 흐름은 다음과 같다. ① 7.1과의 다중 요청 처리 차이를 이해한다. ② aiohttp로 비동기 HTTP 서버를 구동한다.

## 이론

### 7.1 http.server와의 차이

| 구분 | 7.1 ThreadingHTTPServer | 7.2 aiohttp |
|------|--------------------------|-------------|
| **다중 요청** | 요청마다 새 스레드 | 이벤트 루프, 논블로킹 IO |
| **모델** | 스레드 풀 | 단일 스레드, 코루틴 |
| **적합** | 개발·테스트, 정적 파일 | 경량 API, 실시간성, 많은 동시 연결 |

운영용 Web Server(WSGI/ASGI, uvicorn)를 선택할 때도 **스레드 vs 비동기** 관점을 함께 고려한다. 자세한 내용은 Series 03 Web Server에서 다룬다.

### aiohttp의 역할

> **aiohttp**는 asyncio 기반의 비동기 HTTP 클라이언트·서버 라이브러리로, 논블로킹 IO로 동시 요청을 처리한다.

`web.Application`으로 앱을 만들고, `add_routes()` 또는 `router.add_get()` 등으로 경로와 핸들러를 매핑한다. 핸들러는 `async def`로 정의하며, `await`로 IO 대기 중 다른 요청을 처리할 수 있다.

### web.Application과 web.run_app

`web.Application()`은 라우팅과 미들웨어를 관리한다. `web.run_app(app, host, port)`로 서버를 구동한다. `web.Response`로 텍스트, JSON, 스트리밍 응답을 반환한다.

## 실습

### 환경

- Python 3.12+
- 설치 패키지

    ```bash
    $ pip install aiohttp
    ```

### 목표

aiohttp로 비동기 HTTP 서버를 구동하고, GET·POST 요청을 처리한다.

### lab1: 기본 서버

#### 단계 1: Hello World 서버

```python
# hello_server.py
from aiohttp import web


async def hello(request):
    return web.Response(text="Hello, World!")


app = web.Application()
app.router.add_get("/", hello)

if __name__ == "__main__":
    web.run_app(app, host="127.0.0.1", port=8080)
```

**예상 결과**: `http://127.0.0.1:8080/` 접속 시 `Hello, World!`가 출력된다.

#### 단계 2: JSON 응답

```python
# json_server.py
from aiohttp import web


async def handle_get(request):
    return web.json_response({"status": "ok", "message": "aiohttp server"})


app = web.Application()
app.router.add_get("/", handle_get)

if __name__ == "__main__":
    web.run_app(app, host="127.0.0.1", port=8080)
```

**예상 결과**: `curl http://127.0.0.1:8080/` 시 JSON이 반환된다.

### lab2: POST 요청 처리

```python
# post_server.py
from aiohttp import web


async def handle_post(request):
    data = await request.json()
    name = data.get("name", "Guest")
    return web.json_response({"greeting": f"Hello, {name}!"})


app = web.Application()
app.router.add_post("/greet", handle_post)

if __name__ == "__main__":
    web.run_app(app, host="127.0.0.1", port=8080)
```

**예상 결과**: `curl -X POST -H "Content-Type: application/json" -d '{"name":"Python"}' http://127.0.0.1:8080/greet` 시 `{"greeting": "Hello, Python!"}`가 반환된다.

### 트러블슈팅

| 현상 | 원인 | 대응 |
|------|------|------|
| `ModuleNotFoundError: aiohttp` | 미설치 | `pip install aiohttp` |
| `Address already in use` | 포트 사용 중 | 다른 포트 사용 |
| `aiohttp.web_exceptions.HTTPBadRequest` | JSON 파싱 실패 | `Content-Type: application/json` 확인 |

### 실습 포인트

- 핸들러는 `async def`로 정의하고 `web.Response` 또는 `web.json_response`를 반환한다.
- `await request.json()`으로 POST 본문을 비동기적으로 읽는다.
- `web.run_app()`이 이벤트 루프를 실행한다.

## 핵심 정리

- aiohttp는 이벤트 루프 기반 비동기 HTTP 서버로, 7.1의 스레드 모델과 다르다.
- `web.Application`, `router.add_get/post()`, `async def` 핸들러로 서버를 구성한다.
- Web Server 선택 시 스레드 vs 비동기 관점을 고려한다. (Series 03 Web Server 참조)

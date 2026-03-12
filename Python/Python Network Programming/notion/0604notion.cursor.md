# 6.4 httpx

## 개요

본 Section은 **httpx** 라이브러리의 동기·비동기 기본 사용법을 다룬다. httpx는 requests와 유사한 API를 제공하면서 HTTP/2, 비동기(Async)를 지원하는 HTTP 클라이언트다. 학습 흐름은 다음과 같다. ① httpx의 특징과 동기 API를 이해한다. ② `AsyncClient`를 사용한 비동기 요청을 실습한다.

## 이론

### httpx의 역할

> **httpx**는 동기·비동기 모두 지원하는 HTTP 클라이언트 라이브러리로, HTTP/1.1과 HTTP/2를 지원한다.

requests와 비슷한 `httpx.get()`, `httpx.post()` API를 제공한다. `Client`는 동기용, `AsyncClient`는 비동기용이다. Ch04에서 다루는 asyncio와 함께 사용하면 비동기 HTTP 요청을 수행할 수 있다.

### Client vs AsyncClient

| 클래스 | 용도 | 사용 방식 |
|--------|------|-----------|
| `Client` | 동기 요청 | `client.get()`, `client.post()` |
| `AsyncClient` | 비동기 요청 | `await client.get()`, `await client.post()` |

`Client`와 `AsyncClient`는 연결 풀을 관리한다. `with` 또는 `async with`로 사용하면 `close()`가 자동 호출된다.

### Response 객체

`Response` 객체는 `status_code`, `headers`, `text`, `content`, `json()` 등을 제공한다. requests의 Response와 유사하다.

## 실습

### 환경

- Python 3.12+
- 설치 패키지

    ```bash
    $ pip install httpx
    ```

### 목표

httpx로 동기·비동기 GET, POST 요청을 수행한다.

### lab1: 동기 기본 사용

#### 단계 1: GET 요청

```python
# sync_get.py
import httpx

resp = httpx.get("https://httpbin.org/get")
print(f"Status: {resp.status_code}")
print(resp.json())
```

**예상 결과**: Status 200, JSON 형식의 응답이 출력된다.

#### 단계 2: POST 요청 (JSON)

```python
# sync_post.py
import httpx

resp = httpx.post(
    "https://httpbin.org/post",
    json={"name": "python", "version": "3.12"},
)
print(resp.json().get("json"))
```

**예상 결과**: `{'name': 'python', 'version': '3.12'}`가 출력된다.

#### 단계 3: Client 사용 (연결 풀)

```python
# sync_client.py
import httpx

with httpx.Client() as client:
    r1 = client.get("https://httpbin.org/get")
    r2 = client.get("https://httpbin.org/get")
    print(r1.status_code, r2.status_code)
```

**예상 결과**: 두 요청 모두 200이 출력된다. `Client`는 동일 호스트에 대한 연결을 재사용한다.

### lab2: 비동기 기본 사용

#### 단계 1: AsyncClient로 비동기 요청

```python
# async_basic.py
import asyncio
import httpx


async def main():
    async with httpx.AsyncClient() as client:
        resp = await client.get("https://httpbin.org/get")
        print(f"Status: {resp.status_code}")
        print(resp.json())


asyncio.run(main())
```

**예상 결과**: Status 200, JSON 형식의 응답이 출력된다.

#### 단계 2: 여러 요청 동시 수행

```python
# async_concurrent.py
import asyncio
import httpx


async def main():
    async with httpx.AsyncClient() as client:
        r1 = client.get("https://httpbin.org/get")
        r2 = client.get("https://httpbin.org/delay/1")
        responses = await asyncio.gather(r1, r2)
        for resp in responses:
            print(resp.status_code)


asyncio.run(main())
```

**예상 결과**: 두 응답의 status_code가 출력된다. `asyncio.gather`로 여러 요청을 동시에 수행할 수 있다.

### 트러블슈팅

| 현상 | 원인 | 대응 |
|------|------|------|
| `ModuleNotFoundError: httpx` | 미설치 | `pip install httpx` |
| `httpx.ConnectError` | 네트워크/방화벽 | URL 접근 가능 여부, 프록시 설정 확인 |
| `RuntimeError: no running event loop` | async 코드를 sync 컨텍스트에서 실행 | `asyncio.run(main())`으로 실행 |

### 실습 포인트

- `httpx.get()`, `httpx.post()`는 동기 API다. `Client`를 사용하면 연결 풀을 활용한다.
- 비동기 요청은 `AsyncClient`와 `await`를 사용한다. `asyncio.run()`으로 진입점을 만든다.
- `asyncio.gather()`로 여러 비동기 요청을 동시에 수행할 수 있다.

## 핵심 정리

- httpx는 동기·비동기 모두 지원하는 HTTP 클라이언트다.
- `Client`는 동기용, `AsyncClient`는 비동기용이다. 둘 다 연결 풀을 관리한다.
- 비동기 요청은 `async with httpx.AsyncClient()`와 `await client.get()`으로 수행한다.
- `asyncio.run()`으로 비동기 진입점을 만들고, `asyncio.gather()`로 동시 요청을 수행한다.

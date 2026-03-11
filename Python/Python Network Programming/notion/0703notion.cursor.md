# 7.3 aiohttp Client/Server

## 개요

본 Section은 **aiohttp**를 사용한 비동기 HTTP **클라이언트** 구동을 다룬다. 7.1·7.2에서 Event loop와 asyncio를 이해했고, 6.2에서 aiohttp 서버를 다뤘다. 이제 aiohttp의 **ClientSession**으로 비동기 HTTP 요청을 수행한다. 학습 흐름은 다음과 같다. ① aiohttp Client와 5.3 httpx AsyncClient의 관계를 이해한다. ② ClientSession으로 GET, POST 요청과 `asyncio.gather()` 동시 요청을 실습한다.

## 이론

### aiohttp Client의 역할

> **aiohttp**는 asyncio 기반의 비동기 HTTP 클라이언트·서버 라이브러리다. **ClientSession**으로 비동기 HTTP 요청을 수행한다.

5.3 httpx의 `AsyncClient`와 유사하다. `aiohttp.ClientSession()`을 `async with`로 사용하고, `session.get()`, `session.post()` 등으로 요청을 보낸다. 응답은 `async with session.get(url) as resp:` 형태로 컨텍스트 매니저로 받는다.

### ClientSession과 연결 풀

`ClientSession`은 연결 풀을 관리한다. 동일 호스트에 대한 TCP 연결을 재사용하여 성능을 높인다. 애플리케이션당 하나의 Session을 만들고 여러 요청에 재사용하는 것이 권장된다.

### 7.2 asyncio와의 연계

`ClientSession`의 `get()`, `post()`는 코루틴을 반환한다. `await session.get(url)`로 단일 요청을 보내거나, `asyncio.gather(session.get(url1), session.get(url2))`로 여러 요청을 동시에 보낼 수 있다. 7.2에서 익힌 `asyncio.gather()`가 그대로 적용된다.

## 실습

### 실습 환경

- Python 3.12+
- 설치 패키지

    ```bash
    $ pip install aiohttp
    ```

### 목표

aiohttp ClientSession으로 비동기 HTTP 요청을 수행하고, `asyncio.gather()`로 동시 요청을 확인한다.

### lab1: 기본 HTTP Client

#### 단계 1: GET 요청

```python
# client_get.py
import asyncio
import aiohttp


async def main():
    async with aiohttp.ClientSession() as session:
        async with session.get("https://httpbin.org/get") as resp:
            print(resp.status)
            data = await resp.json()
            print(data)


asyncio.run(main())
```

**예상 결과**: 200과 JSON 응답이 출력된다.

#### 단계 2: POST 요청 (JSON)

```python
# client_post.py
import asyncio
import aiohttp


async def main():
    async with aiohttp.ClientSession() as session:
        async with session.post(
            "https://httpbin.org/post",
            json={"name": "python", "version": "3.12"},
        ) as resp:
            data = await resp.json()
            print(data.get("json"))


asyncio.run(main())
```

**예상 결과**: `{'name': 'python', 'version': '3.12'}`가 출력된다.

### lab2: asyncio.gather() 동시 요청

```python
# client_concurrent.py
import asyncio
import aiohttp


async def fetch(session, url):
    async with session.get(url) as resp:
        return await resp.json()


async def main():
    async with aiohttp.ClientSession() as session:
        urls = [
            "https://httpbin.org/get",
            "https://httpbin.org/get",
            "https://httpbin.org/delay/1",
        ]
        results = await asyncio.gather(*[fetch(session, url) for url in urls])
        for i, r in enumerate(results):
            print(f"Result {i}: {r.get('url', 'ok')}")


asyncio.run(main())
```

**예상 결과**: 세 요청이 동시에 수행되고, 각 결과가 출력된다. 순차 실행 시 `delay/1` 포함 약 3초 이상 걸리지만, 동시 실행 시 약 1초 수준이다.

### 트러블슈팅

| 현상 | 원인 | 대응 |
|------|------|------|
| `ModuleNotFoundError: aiohttp` | 미설치 | `pip install aiohttp` |
| `aiohttp.ClientError` | 네트워크/URL 오류 | URL 접근 가능 여부 확인 |
| `RuntimeError: no running event loop` | sync 컨텍스트에서 실행 | `asyncio.run(main())`으로 진입 |

### 실습 포인트

- `async with aiohttp.ClientSession()`으로 세션을 만들고, `async with session.get(url)`로 응답을 받는다.
- `resp.json()`은 코루틴이므로 `await resp.json()`으로 호출한다.
- `asyncio.gather()`로 여러 `session.get()` 코루틴을 동시에 실행할 수 있다.

## 핵심 정리

- aiohttp ClientSession으로 비동기 HTTP 요청을 수행한다.
- `async with`로 Session과 응답을 관리한다. `resp.json()`은 `await`가 필요하다.
- `asyncio.gather()`와 결합하여 여러 요청을 동시에 보낼 수 있다.
- 5.3 httpx AsyncClient와 유사한 역할이며, aiohttp는 서버(6.2)와 클라이언트를 모두 지원한다.

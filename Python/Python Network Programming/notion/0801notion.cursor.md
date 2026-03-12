# HTTP Client Streaming : 스트리밍 응답 수신

## 개요

본 Section은 HTTP 클라이언트에서 **스트리밍(Streaming)** 방식으로 응답을 수신하는 원리와 실습을 다룬다. Ch06에서 다룬 requests, httpx의 기본 사용법은 응답 전체를 메모리에 적재한 뒤 처리하는 방식이었다. 그러나 대용량 파일 다운로드, 실시간 이벤트 수신, 청크(Chunk) 단위 데이터 처리 등에서는 응답을 **조각 단위로 점진적으로 읽는** 스트리밍 방식이 필요하다. 학습 흐름은 다음과 같다. ① 스트리밍의 필요성과 동작 원리를 이해한다. ② HTTP 청크 전송 인코딩(Chunked Transfer Encoding)의 구조를 파악한다. ③ requests와 httpx를 사용하여 동기·비동기 스트리밍 응답을 실습한다.

## 이론

### 스트리밍의 필요성 : 일반 응답 vs 스트리밍 응답

> **스트리밍 응답(Streaming Response)** 이란 HTTP 응답 본문을 한꺼번에 수신하지 않고, 데이터가 도착하는 대로 **조각(Chunk) 단위로 점진적으로 읽는** 방식이다.

Ch06에서 다룬 `requests.get()`이나 `httpx.get()`은 응답 전체를 메모리에 적재한다. 응답 크기가 작을 때는 문제가 없지만, 수백 MB 이상의 파일이나 끝을 알 수 없는 실시간 데이터 스트림을 동일한 방식으로 처리하면 **메모리 부족**이나 **긴 대기 시간** 문제가 발생한다.

| 구분 | 일반 응답 | 스트리밍 응답 |
|------|-----------|---------------|
| 메모리 사용 | 응답 전체를 한 번에 적재 | 청크 크기만큼만 유지 |
| 첫 데이터 수신 시점 | 전체 수신 완료 후 | 첫 청크 도착 즉시 |
| 적합한 상황 | JSON API, 소규모 HTML | 대용량 파일, 실시간 이벤트 |
| 연결 유지 | 응답 수신 후 즉시 해제 가능 | 스트림을 다 읽을 때까지 유지 |

*일반 응답과 스트리밍 응답의 메모리·타이밍 차이*

스트리밍이 필요한 대표적인 상황은 다음과 같다.

### **① 대용량 파일 다운로드**

수 GB 크기의 파일을 메모리에 전부 올리면 프로세스가 OOM(Out Of Memory)으로 종료될 수 있다. 스트리밍으로 청크 단위로 읽으며 디스크에 순차 기록하면 메모리 사용량을 일정하게 유지할 수 있다.

### **② 실시간 이벤트 스트림**

서버가 **Server-Sent Events(SSE)** 나 줄 단위(Line-delimited) JSON을 지속적으로 전송하는 경우, 응답의 끝이 정해져 있지 않다. 스트리밍으로 줄(Line)이 도착할 때마다 즉시 처리해야 한다.

### **③ 메모리 제한 환경**

IoT 디바이스, 컨테이너 등 메모리가 제한된 환경에서는 응답을 통째로 적재하는 것이 불가능할 수 있다.

### HTTP 청크 전송 인코딩 : Chunked Transfer Encoding

> **청크 전송 인코딩(Chunked Transfer Encoding)** 은 HTTP/1.1에서 응답 본문의 전체 크기를 미리 알 수 없을 때, 데이터를 **청크(Chunk) 단위로 나누어 전송**하는 메커니즘이다.

Ch05에서 다룬 HTTP 응답에는 `Content-Length` 헤더로 본문 크기를 명시하는 방식이 있었다. 그러나 동적으로 생성되는 데이터나 실시간 스트림은 전체 크기를 사전에 알 수 없다. 이때 서버는 `Transfer-Encoding: chunked` 헤더를 사용하여 데이터를 조각 단위로 전송한다.

```
HTTP/1.1 200 OK
Transfer-Encoding: chunked
Content-Type: text/plain

7\r\n
Hello, \r\n
6\r\n
World!\r\n
0\r\n
\r\n
```

각 청크는 **크기(16진수)**와 **데이터**로 구성된다. 크기가 `0`인 청크가 전송의 끝을 의미한다. requests, httpx 등의 라이브러리는 이 디코딩을 내부적으로 처리하므로, 클라이언트 코드에서는 청크 포맷을 직접 다룰 필요가 없다.

### requests의 스트리밍 API

> requests에서 스트리밍 응답을 사용하려면 `stream=True` 파라미터를 전달한다.

`stream=True`를 지정하면 `requests.get()`은 응답 헤더만 수신하고 본문 다운로드를 지연한다. 이후 `iter_content()` 또는 `iter_lines()`로 본문을 점진적으로 읽는다.

| 메서드 | 용도 | 파라미터 |
|--------|------|----------|
| `iter_content(chunk_size)` | 바이너리 청크 단위 읽기 | `chunk_size`: 청크 바이트 크기 (기본 1) |
| `iter_lines(decode_unicode)` | 줄 단위 읽기 | `decode_unicode=True`로 문자열 변환 |

`stream=True` 사용 시 반드시 `response.close()`를 호출하거나 `with` 문으로 연결을 해제해야 한다. 그렇지 않으면 TCP 연결이 반환되지 않아 연결 풀이 고갈될 수 있다.

### httpx의 스트리밍 API

> httpx에서 스트리밍을 사용하려면 `client.stream()` 메서드를 사용한다.

requests와 달리 httpx는 별도의 `stream()` 메서드를 제공한다. 이 메서드는 컨텍스트 매니저로 동작하며, `response.iter_bytes()`, `response.iter_lines()`, `response.iter_text()` 등의 이터레이터를 제공한다.

| 메서드 | 용도 |
|--------|------|
| `iter_bytes(chunk_size)` | 바이너리 청크 단위 읽기 |
| `iter_text(chunk_size)` | 텍스트 청크 단위 읽기 |
| `iter_lines()` | 줄 단위 읽기 |
| `iter_raw(chunk_size)` | 디코딩 없이 원시 바이트 읽기 |

httpx의 `AsyncClient`에서는 `async with client.stream()` 형태로 비동기 스트리밍을 수행한다. 이터레이터도 `async for`로 순회한다.

## 실습

앞서 다룬 requests와 httpx의 스트리밍 API를 사용하여, 대용량 파일 다운로드와 줄 단위 스트리밍을 실습한다.

### 실습 환경

- Python 3.12+
- 설치 패키지

    ```bash
    $ pip install requests
    $ pip install httpx
    ```

### lab1: requests 스트리밍 — 파일 다운로드

`stream=True`와 `iter_content()`를 사용하여 대용량 파일을 청크 단위로 다운로드한다.

#### 단계 1: 청크 단위 파일 다운로드

```python
# stream_download_requests.py
import requests

url = "https://httpbin.org/stream-bytes/1048576"

with requests.get(url, stream=True) as resp:
    resp.raise_for_status()
    total = 0
    with open("download_requests.bin", "wb") as f:
        for chunk in resp.iter_content(chunk_size=8192):
            f.write(chunk)
            total += len(chunk)
            print(f"\r수신: {total:,} bytes", end="", flush=True)

print(f"\n완료: {total:,} bytes 저장")
```

**예상 결과**: 1,048,576 bytes(1 MB)가 8,192 bytes 청크 단위로 수신되며, 진행 상황이 출력된다.

#### 단계 2: 줄 단위 스트리밍 읽기

```python
# stream_lines_requests.py
import requests

url = "https://httpbin.org/stream/5"

with requests.get(url, stream=True) as resp:
    resp.raise_for_status()
    for line in resp.iter_lines(decode_unicode=True):
        if line:
            print(f"수신: {line}")
```

**예상 결과**: httpbin이 생성하는 5개의 JSON 줄이 순차적으로 출력된다.

```
수신: {"id": 0, "url": "https://httpbin.org/stream/5", ...}
수신: {"id": 1, "url": "https://httpbin.org/stream/5", ...}
수신: {"id": 2, "url": "https://httpbin.org/stream/5", ...}
수신: {"id": 3, "url": "https://httpbin.org/stream/5", ...}
수신: {"id": 4, "url": "https://httpbin.org/stream/5", ...}
```

### lab2: httpx 동기 스트리밍 — 파일 다운로드

`Client.stream()`과 `iter_bytes()`를 사용한다.

#### 단계 1: 청크 단위 파일 다운로드

```python
# stream_download_httpx.py
import httpx

url = "https://httpbin.org/stream-bytes/1048576"

with httpx.Client() as client:
    with client.stream("GET", url) as resp:
        resp.raise_for_status()
        total = 0
        with open("download_httpx.bin", "wb") as f:
            for chunk in resp.iter_bytes(chunk_size=8192):
                f.write(chunk)
                total += len(chunk)
                print(f"\r수신: {total:,} bytes", end="", flush=True)

print(f"\n완료: {total:,} bytes 저장")
```

**예상 결과**: requests 실습과 동일하게 1 MB 파일이 청크 단위로 저장된다.

#### 단계 2: 줄 단위 스트리밍 읽기

```python
# stream_lines_httpx.py
import httpx

url = "https://httpbin.org/stream/5"

with httpx.Client() as client:
    with client.stream("GET", url) as resp:
        resp.raise_for_status()
        for line in resp.iter_lines():
            print(f"수신: {line}")
```

**예상 결과**: 5개의 JSON 줄이 순차적으로 출력된다.

### lab3: httpx 비동기 스트리밍

`AsyncClient.stream()`과 `async for`를 사용하여 비동기 환경에서 스트리밍을 수행한다. Ch04에서 다룬 asyncio와 함께 사용한다.

#### 단계 1: 비동기 청크 단위 다운로드

```python
# async_stream_download.py
import asyncio
import httpx

url = "https://httpbin.org/stream-bytes/1048576"


async def main():
    async with httpx.AsyncClient() as client:
        async with client.stream("GET", url) as resp:
            resp.raise_for_status()
            total = 0
            with open("download_async.bin", "wb") as f:
                async for chunk in resp.aiter_bytes(chunk_size=8192):
                    f.write(chunk)
                    total += len(chunk)
                    print(f"\r수신: {total:,} bytes", end="", flush=True)

    print(f"\n완료: {total:,} bytes 저장")


asyncio.run(main())
```

**예상 결과**: 비동기 방식으로 1 MB 파일이 청크 단위로 저장된다. 동기 버전과 결과는 동일하지만, 이벤트 루프가 블로킹되지 않으므로 다른 코루틴과 동시에 실행할 수 있다.

#### 단계 2: 비동기 줄 단위 스트리밍

```python
# async_stream_lines.py
import asyncio
import httpx

url = "https://httpbin.org/stream/5"


async def main():
    async with httpx.AsyncClient() as client:
        async with client.stream("GET", url) as resp:
            resp.raise_for_status()
            async for line in resp.aiter_lines():
                print(f"수신: {line}")


asyncio.run(main())
```

**예상 결과**: 5개의 JSON 줄이 비동기로 순차 출력된다.

### 트러블슈팅

| 현상 | 원인 | 대응 |
|------|------|------|
| `requests.exceptions.ChunkedEncodingError` | 서버가 전송 중 연결을 끊음 | 재시도 로직 추가, 네트워크 상태 확인 |
| `httpx.RemoteProtocolError` | 서버의 비정상 응답 종료 | 예외 처리 후 재시도 |
| 파일 크기가 0 | `stream=True` 누락 (requests) | `stream=True` 파라미터 확인 |
| `iter_bytes()` 호출 시 빈 결과 | 컨텍스트 매니저 밖에서 호출 | `with client.stream()` 블록 안에서 사용 |
| `TypeError: 'async_generator' object is not iterable` | `for` 대신 `async for` 필요 | 비동기 이터레이터는 `async for`로 순회 |

### 실습 포인트

- requests는 `stream=True` + `iter_content()`/`iter_lines()` 조합으로 스트리밍한다.
- httpx는 `client.stream()` 컨텍스트 매니저 + `iter_bytes()`/`iter_lines()` 조합을 사용한다.
- httpx 비동기 스트리밍은 `aiter_bytes()`, `aiter_lines()`처럼 `a` 접두사가 붙은 비동기 이터레이터를 사용한다.
- 스트리밍 사용 시 반드시 `with` 또는 `async with`로 연결을 관리해야 한다.
- `chunk_size`는 메모리 사용량과 I/O 횟수의 트레이드오프다. 일반적으로 8,192(8 KB) ~ 65,536(64 KB)이 적절하다.

## 핵심 정리

- **스트리밍 응답**은 HTTP 응답 본문을 청크 단위로 점진적으로 읽는 방식이다. 대용량 파일 다운로드, 실시간 이벤트 수신, 메모리 제한 환경에서 필수적이다.
- **Chunked Transfer Encoding**은 HTTP/1.1에서 응답 크기를 사전에 알 수 없을 때 청크 단위로 전송하는 메커니즘이다.
- **requests**는 `stream=True` 파라미터와 `iter_content()`, `iter_lines()`로 스트리밍을 지원한다.
- **httpx**는 `client.stream()` 컨텍스트 매니저와 `iter_bytes()`, `iter_lines()`, `iter_text()`로 스트리밍을 지원하며, `AsyncClient`를 통한 비동기 스트리밍도 가능하다.
- 스트리밍 사용 시 연결 해제를 위해 반드시 컨텍스트 매니저(`with`/`async with`)를 사용해야 한다.

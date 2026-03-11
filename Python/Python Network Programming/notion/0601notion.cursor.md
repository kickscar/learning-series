# 6.1 urllib3

## 개요

본 Section은 **urllib3**의 역할과 기본 사용법을 다룬다. urllib3는 Python 표준 라이브러리의 `urllib`보다 안정적이고, **연결 풀(Connection Pool)** 을 기본 제공하는 HTTP 클라이언트 라이브러리다. requests 라이브러리의 하위 의존성으로도 널리 사용된다. 학습 흐름은 다음과 같다. ① urllib3의 특징과 PoolManager 구조를 이해한다. ② GET, POST 요청을 수행하는 기본 실습을 진행한다.

## 이론

### urllib3의 역할

> **urllib3**는 스레드 안전한 HTTP 클라이언트 라이브러리로, 연결 재사용(Connection Reuse)을 통해 성능을 최적화한다.

Python 표준 라이브러리의 `urllib`는 기능은 충분하지만, 연결 풀 관리와 재시도 로직이 없다. urllib3는 이를 보완하여 프로덕션 환경에서 안정적으로 HTTP 요청을 수행할 수 있게 한다. `requests` 라이브러리는 내부적으로 urllib3를 사용한다.

### PoolManager

> **PoolManager**는 호스트별 연결 풀을 관리하는 urllib3의 핵심 객체다.

`PoolManager` 인스턴스를 생성하면, 동일 호스트에 대한 요청 시 기존 TCP 연결을 재사용한다. 이는 Ch05에서 다룬 HTTP Keep-Alive와 대응된다. `request()` 메서드로 HTTP 메서드와 URL을 지정하여 요청을 보낸다.

### HTTPResponse

`request()`의 반환값은 **HTTPResponse** 객체다. `status`(상태 코드), `data`(응답 본문 바이트), `headers`(응답 헤더), `json()`(JSON 파싱) 등의 속성과 메서드를 제공한다.

## 실습

### 전제 조건

- Python 3.12+ 설치
- `pip install urllib3` (Python 3.12+에서는 보통 별도 설치 필요)

### 목표

PoolManager를 사용하여 GET, POST 요청을 수행하고 응답을 확인한다.

### 단계 1: GET 요청

```python
# basic_get.py
import urllib3

http = urllib3.PoolManager()
resp = http.request("GET", "https://httpbin.org/get")

print(f"Status: {resp.status}")
print(f"Headers: {resp.headers}")
print(f"Body: {resp.data.decode('utf-8')}")
```

**예상 결과**: Status 200, JSON 형식의 응답 본문이 출력된다.

### 단계 2: POST 요청 (form 데이터)

```python
# basic_post.py
import urllib3

http = urllib3.PoolManager()
resp = http.request(
    "POST",
    "https://httpbin.org/post",
    fields={"name": "python", "version": "3.12"},
)

print(f"Status: {resp.status}")
print(resp.data.decode("utf-8"))
```

**예상 결과**: 전송한 form 필드가 응답에 포함된 JSON이 출력된다.

### 단계 3: JSON 요청 및 응답

```python
# basic_json.py
import json
import urllib3

http = urllib3.PoolManager()
resp = http.request(
    "POST",
    "https://httpbin.org/post",
    body=json.dumps({"key": "value"}),
    headers={"Content-Type": "application/json"},
)

data = resp.json()
print(data.get("json"))
```

**예상 결과**: `{'key': 'value'}`가 출력된다.

### 트러블슈팅

| 현상 | 원인 | 대응 |
|------|------|------|
| `ModuleNotFoundError: urllib3` | 미설치 | `pip install urllib3` |
| `SSLError` | 인증서 검증 실패 | 테스트 시 `cert_reqs='CERT_NONE'` 사용 가능 (프로덕션에서는 비권장) |
| `NewConnectionError` | 네트워크/방화벽 | URL 접근 가능 여부, 프록시 설정 확인 |

### 실습 포인트

- `PoolManager()`는 싱글톤처럼 재사용하는 것이 좋다.
- `resp.data`는 `bytes`이므로 `decode('utf-8')`로 문자열 변환이 필요하다.
- `resp.json()`은 JSON 응답을 딕셔너리로 파싱한다.

## 핵심 정리

- urllib3는 연결 풀을 기본 제공하는 HTTP 클라이언트 라이브러리다.
- `PoolManager`로 요청을 보내며, `request(메서드, URL, ...)` 형태로 사용한다.
- `HTTPResponse`의 `status`, `data`, `headers`, `json()`으로 응답을 처리한다.
- requests의 하위 의존성으로 널리 사용되며, 저수준 제어가 필요할 때 직접 사용한다.

# 5.2 requests

## 개요

본 Section은 **requests** 라이브러리의 기본 사용법과 **Session**을 통한 연결 재사용을 다룬다. requests는 Python에서 가장 널리 쓰이는 HTTP 클라이브러리로, urllib3 위에 구축되어 있다. 학습 흐름은 다음과 같다. ① requests의 특징과 `get`, `post` 등 메서드별 API를 이해한다. ② Session을 사용해 TCP 연결 재사용(HTTP Keep-Alive)을 실습한다.

## 이론

### requests의 역할

> **requests**는 사람 친화적(Human-friendly) API를 제공하는 HTTP 클라이언트 라이브러리로, 내부적으로 urllib3를 사용한다.

`requests.get()`, `requests.post()`처럼 메서드 이름으로 직관적으로 요청을 보낼 수 있다. 응답은 **Response** 객체로 반환되며, `response.json()`으로 JSON을 바로 파싱할 수 있다. urllib3의 `resp.data.decode()` 단계가 필요 없다.

### Response 객체

`Response` 객체는 `status_code`, `headers`, `text`(문자열 본문), `content`(바이트 본문), `json()` 등의 속성과 메서드를 제공한다. `response.raise_for_status()`로 4xx, 5xx 시 예외를 발생시킬 수 있다.

### Session과 연결 재사용

> **Session**은 동일 호스트에 대한 TCP 연결을 재사용한다. 이는 HTTP/1.1 Keep-Alive(RFC 7230)에 해당한다.

`requests.get()`을 반복 호출하면 매 요청마다 새 TCP 연결을 맺는다. `Session` 인스턴스를 만들고 `session.get()`, `session.post()`를 사용하면, 동일 호스트에 대한 기존 TCP 연결이 재사용된다. 서버가 Keep-Alive를 지원할 때, 연결 수를 줄이고 지연을 낮추는 효과가 있다.

## 실습

### 전제 조건

- Python 3.12+ 설치
- `pip install requests`

### 목표

requests로 GET, POST 요청을 수행하고, Session으로 연결 재사용을 확인한다.

### lab1: 기본 사용

#### 단계 1: GET 요청

```python
# basic_get.py
import requests

resp = requests.get("https://httpbin.org/get")
print(f"Status: {resp.status_code}")
print(resp.json())
```

**예상 결과**: Status 200, JSON 형식의 응답이 출력된다.

#### 단계 2: POST 요청 (JSON)

```python
# basic_post.py
import requests

resp = requests.post(
    "https://httpbin.org/post",
    json={"name": "python", "version": "3.12"},
)
print(resp.json().get("json"))
```

**예상 결과**: `{'name': 'python', 'version': '3.12'}`가 출력된다.

#### 단계 3: 쿼리 파라미터, 헤더

```python
# basic_params_headers.py
import requests

resp = requests.get(
    "https://httpbin.org/get",
    params={"key": "value", "page": 1},
    headers={"User-Agent": "Python-Network-Programming/1.0"},
)
print(resp.url)
```

**예상 결과**: URL에 `?key=value&page=1`이 포함된다.

### lab2: Session - 연결 재사용

Session으로 동일 호스트에 연속 요청을 보내고, Wireshark로 패킷을 관찰한다.

#### 단계 1: Session으로 동일 호스트 연속 요청

```python
# session_connection_reuse.py
import requests

session = requests.Session()

# 동일 호스트에 연속 요청 → TCP 연결 재사용 시도
r1 = session.get("https://httpbin.org/get")
r2 = session.get("https://httpbin.org/get")

print(r1.status_code, r2.status_code)
```

**예상 결과**: 두 요청 모두 200이 출력된다.

#### 단계 2: Wireshark로 패킷 관찰

1. Wireshark를 실행하고 캡처 인터페이스를 선택한다.
2. `tcp.port == 443` 또는 `host httpbin.org` 필터를 적용한다.
3. 위 스크립트를 실행한다.
4. 패킷 목록에서 **첫 번째 요청**: TCP 3-way handshake(SYN, SYN-ACK, ACK) 후 TLS 핸드셰이크, HTTP 요청이 보인다.
5. **두 번째 요청**: 서버가 Keep-Alive를 지원하면 새로운 handshake 없이 기존 TCP 연결 위에서 HTTP 요청이 이어질 수 있다. `Connection: close`를 반환하는 서버라면 매 요청마다 새 연결이 생성된다.

**비교**: `requests.get()`만 반복 호출하면 매 요청마다 새 TCP 연결을 맺는다. Session 사용 시 동일 호스트에 대한 연결 재사용을 시도한다.

### 트러블슈팅

| 현상 | 원인 | 대응 |
|------|------|------|
| `ModuleNotFoundError: requests` | 미설치 | `pip install requests` |
| `requests.exceptions.ConnectionError` | 네트워크/방화벽 | URL 접근 가능 여부, 프록시 설정 확인 |
| `JSONDecodeError` | 응답이 JSON 아님 | `resp.text`로 본문 확인 후 `resp.json()` 사용 여부 판단 |
| `HTTPError` (4xx, 5xx) | `raise_for_status()` 호출 시 | `resp.status_code` 확인 또는 예외 처리 |

### 실습 포인트

- `requests.get(url, params=...)`로 쿼리 파라미터를 딕셔너리로 전달한다.
- `requests.post(url, json=...)`로 JSON 본문을 보낼 때 `Content-Type`이 자동 설정된다.
- `Session`을 사용하면 동일 호스트에 대한 TCP 연결이 재사용된다(HTTP Keep-Alive).
- Wireshark로 패킷을 관찰하면 TCP 연결 생성·재사용 여부를 확인할 수 있다.

## 핵심 정리

- requests는 `get()`, `post()` 등 메서드별 API로 HTTP 요청을 수행한다.
- `Response`의 `status_code`, `text`, `json()`으로 응답을 처리한다.
- `Session`은 동일 호스트에 대한 TCP 연결 재사용(HTTP Keep-Alive)에 사용한다.
- 서버가 Keep-Alive를 지원할 때, 연결 수 감소와 지연 감소 효과가 있다.

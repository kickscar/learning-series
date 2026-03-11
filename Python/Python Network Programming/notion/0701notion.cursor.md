# 7.1 Event loop, Async IO

## 개요

본 Section은 **Event loop**와 **Async IO**의 개념을 다룬다. Ch02에서 selectors, Thread-per-request로 다중 요청을 처리했으나, 비동기 모델은 스레드·프로세스 없이 단일 스레드에서 많은 동시 연결을 처리할 수 있다. 학습 흐름은 다음과 같다. ① Event loop와 Async IO의 동작 방식을 이해한다. ② Ch02 대비 성능·리소스 이점을 파악한다. 실습은 7.2 asyncio에서 진행한다.

## 이론

### Blocking IO와 Non-blocking IO

> **Blocking IO**는 IO 작업이 완료될 때까지 호출 스레드가 대기한다. **Non-blocking IO**는 IO가 완료되지 않아도 즉시 제어를 반환한다.

Ch02의 `socket.recv()`는 데이터가 도착할 때까지 블로킹된다. selectors는 여러 소켓을 감시하여 "준비된" 소켓만 처리하지만, 실제 IO는 여전히 블로킹 방식이다. 비동기 모델은 IO 대기 중에도 다른 작업을 수행한다.

### Event loop

> **Event loop**는 준비된 작업을 순차적으로 실행하고, IO 대기 시 다른 작업으로 전환하는 루프다.

이벤트 루프는 "어떤 소켓/작업이 준비되었는지"를 감시하고, 준비된 것만 실행한다. IO가 완료될 때까지 기다리는 동안 다른 코루틴을 실행하여 CPU를 활용한다. 단일 스레드로 많은 동시 연결을 처리할 수 있다.

### Async IO와 코루틴

> **Async IO**는 `async def`로 정의된 **코루틴(Coroutine)** 과 `await`를 사용하여 논블로킹 IO를 수행한다.

`await`를 만나면 해당 코루틴은 일시 중단되고, 이벤트 루프는 다른 코루틴을 실행한다. IO가 완료되면 중단된 코루틴이 재개된다. 스레드를 추가하지 않고도 동시성을 얻을 수 있다.

### Ch02 대비 이점

| 구분 | Ch02 selectors / Thread | Ch07 Async IO |
|------|-------------------------|---------------|
| **모델** | 멀티플렉싱 또는 스레드당 연결 | 단일 스레드, 코루틴 |
| **리소스** | 스레드당 스택·컨텍스트 스위칭 | 코루틴은 경량 |
| **적합** | 중간 규모 | 많은 동시 연결, IO-bound |

IO-bound 작업이 많을 때 비동기는 스레드보다 메모리와 컨텍스트 스위칭 비용이 적다. asyncio 심화(task, 동시성 패턴)는 Series 08 Async Programming에서 다룬다.

## 실습

본 Section은 개념 설명만 다룬다. 7.2 asyncio에서 `async/await` 실습을 진행한다.

## 핵심 정리

- Event loop는 준비된 작업을 순차 실행하고, IO 대기 시 다른 작업으로 전환한다.
- Async IO는 `async def`, `await`로 논블로킹 IO를 수행한다.
- 비동기 모델은 스레드 없이 많은 동시 연결을 처리할 수 있어, IO-bound 서버에 유리하다.
- asyncio 심화는 Series 08에서 다룬다.

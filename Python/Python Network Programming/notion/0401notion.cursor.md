# 4.1 Event loop, Async IO

## 개요

본 Section은 **Event loop**와 **Async IO**의 개념을 다룬다. Ch02에서 selectors, Thread-per-request로 다중 요청을 처리했으나, 비동기 모델은 스레드·프로세스 없이 단일 스레드에서 많은 동시 연결을 처리할 수 있다. 학습 흐름은 다음과 같다. ① Event loop와 Async IO의 동작 방식을 이해한다. ② `asyncio.run()`, `asyncio.gather()`의 역할과 Python 비동기 원리(코루틴·Task·Cooperative multitasking)를 파악한다. ③ Ch02 대비 성능·리소스 이점을 파악한다. 실습은 4.2 asyncio에서 진행한다.

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

### asyncio.run()의 역할

> **asyncio.run(coro)**는 비동기 프로그램의 최상위 진입점으로, 이벤트 루프를 생성·실행·정리한다.

`asyncio.run(main())`을 호출하면 다음이 수행된다. ① 실행 중인 이벤트 루프가 있는지 확인한다. (한 스레드에는 하나의 루프만 허용) ② 새 이벤트 루프를 생성한다. ③ 전달받은 코루틴을 **Task**로 래핑하여 루프에 스케줄한다. ④ `loop.run_until_complete()`로 코루틴이 완료될 때까지 루프를 실행한다. ⑤ 완료 후 비동기 제너레이터 종료, executor 정리 등을 수행하고 루프를 닫는다. `asyncio.run()` 내부에서 다시 `asyncio.run()`을 호출하는 중첩은 불가능하다.

### asyncio.gather()의 역할

> **asyncio.gather(*coros)**는 여러 코루틴을 동시에 실행하고, 모든 결과를 모아 반환한다.

`gather()`에 전달된 코루틴은 내부적으로 **Task**로 변환되어 이벤트 루프에 스케줄된다. `await`만으로는 코루틴이 순차 실행되지만, `gather()`는 여러 코루틴을 **동시에** 루프에 올려 IO 대기 시간을 활용한다. 모든 Task가 완료되면 결과 리스트를 인자 순서대로 반환한다.

### Python 비동기 원리: 코루틴과 Task

코루틴 함수(`async def`)를 **호출만** 하면 실행되지 않는다. 코루틴 객체가 생성될 뿐이며, `await`하거나 **Task**로 래핑해야 이벤트 루프에 스케줄된다.

> **Task**는 코루틴을 래핑하여 이벤트 루프가 실행할 수 있게 하는 객체다. `asyncio.create_task()`, `asyncio.gather()` 등이 코루틴을 Task로 변환한다.

**Cooperative multitasking(협력적 멀티태스킹)**: 스레드는 OS가 강제로 컨텍스트를 전환하는 반면, asyncio는 Task가 `await`에서 **자발적으로** 제어를 이벤트 루프에 반환한다. 루프는 한 번에 하나의 Task만 실행하며, `await`를 만나면 다른 준비된 Task로 전환한다.

**이벤트 루프 동작 흐름**:
1. Task가 `await`(예: `asyncio.sleep`, 네트워크 요청)에서 IO 대기를 요청하면, 제어권을 루프에 반환한다.
2. 루프는 대기 중인 다른 Task를 선택하여 실행한다.
3. IO가 완료되면 **Future** 객체의 콜백이 실행되고, 대기 중이던 Task가 재개된다.
4. 1~3을 반복한다.

단일 스레드에서 여러 Task가 번갈아 실행되므로, IO 대기 시간을 다른 Task 실행에 활용할 수 있다.

### Ch02 대비 이점

| 구분 | Ch02 selectors / Thread | Ch04 Async IO |
|------|-------------------------|---------------|
| **모델** | 멀티플렉싱 또는 스레드당 연결 | 단일 스레드, 코루틴 |
| **리소스** | 스레드당 스택·컨텍스트 스위칭 | 코루틴은 경량 |
| **적합** | 중간 규모 | 많은 동시 연결, IO-bound |

IO-bound 작업이 많을 때 비동기는 스레드보다 메모리와 컨텍스트 스위칭 비용이 적다. asyncio 심화(task, 동시성 패턴)는 Series 08 Async Programming에서 다룬다.

## 실습

본 Section은 개념 설명만 다룬다. 4.2 asyncio에서 `async/await` 실습을 진행한다.

## 핵심 정리

- Event loop는 준비된 Task를 순차 실행하고, `await`에서 제어를 받아 다른 Task로 전환한다.
- `asyncio.run()`은 이벤트 루프를 생성·실행·정리하는 최상위 진입점이다.
- `asyncio.gather()`는 여러 코루틴을 Task로 변환하여 동시에 실행하고, 결과를 모아 반환한다.
- 코루틴은 Task로 래핑되어야 이벤트 루프에 스케줄된다. Cooperative multitasking으로 `await` 시점에만 전환이 일어난다.
- asyncio 심화는 Series 08에서 다룬다.

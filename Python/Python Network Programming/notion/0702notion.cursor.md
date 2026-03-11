# 7.2 asyncio

## 개요

본 Section은 Python 표준 라이브러리 **asyncio**를 사용한 `async/await` 실습을 다룬다. 7.1에서 Event loop와 Async IO 개념을 이해했으므로, 이제 asyncio로 코루틴을 작성하고 실행한다. 학습 흐름은 다음과 같다. ① `asyncio.run()`과 `async def`, `await`의 기본 사용법을 익힌다. ② `asyncio.gather()`로 여러 코루틴을 동시에 실행한다.

## 이론

### asyncio의 역할

> **asyncio**는 Python 표준 라이브러리로, Event loop를 제공하고 `async/await` 문법으로 코루틴을 실행한다.

`asyncio.run(coro)`가 이벤트 루프를 생성하고, 인자로 받은 코루틴을 실행한다. 코루틴은 `async def`로 정의하고, `await`로 다른 코루틴 또는 IO 작업의 완료를 기다린다.

### asyncio.run()과 진입점

`asyncio.run(main())`은 프로그램의 비동기 진입점이다. `main()`은 `async def`로 정의된 최상위 코루틴이다. `run()`은 해당 코루틴이 완료될 때까지 이벤트 루프를 실행하고, 완료 후 루프를 정리한다.

### asyncio.gather()

`asyncio.gather(*coros)`는 여러 코루틴을 동시에 실행하고, 모든 결과를 모아 반환한다. IO-bound 작업을 병렬로 수행할 때 사용한다.

### asyncio.sleep()

`await asyncio.sleep(1)`은 1초 동안 코루틴을 일시 중단한다. 실제 IO 대신 "대기"를 시뮬레이션하여 비동기 동작을 확인할 때 유용하다.

## 실습

### 실습 환경

- Python 3.12+
- 설치 패키지: 없음 (asyncio는 표준 라이브러리)

    ```bash
    # asyncio는 stdlib에 포함되어 별도 설치 불필요
    ```

### 목표

asyncio로 `async/await` 코루틴을 작성하고, `asyncio.gather()`로 동시 실행을 확인한다.

### lab1: 기본 async/await

#### 단계 1: asyncio.run() 진입

```python
# async_basic.py
import asyncio


async def main():
    print("Hello, asyncio!")


asyncio.run(main())
```

**예상 결과**: `Hello, asyncio!`가 출력된다.

#### 단계 2: await asyncio.sleep()

```python
# async_sleep.py
import asyncio


async def say_after(delay, msg):
    await asyncio.sleep(delay)
    print(msg)


async def main():
    await say_after(1, "first")
    await say_after(1, "second")


asyncio.run(main())
```

**예상 결과**: 1초 후 "first", 1초 후 "second"가 순차 출력된다. 총 약 2초 소요.

### lab2: asyncio.gather() 동시 실행

```python
# async_gather.py
import asyncio


async def say_after(delay, msg):
    await asyncio.sleep(delay)
    print(msg)
    return msg


async def main():
    results = await asyncio.gather(
        say_after(1, "first"),
        say_after(1, "second"),
        say_after(1, "third"),
    )
    print(results)


asyncio.run(main())
```

**예상 결과**: 약 1초 후 "first", "second", "third"가 출력되고, `['first', 'second', 'third']`가 출력된다. 순차 실행 시 3초 걸릴 작업이 1초에 완료된다.

### 트러블슈팅

| 현상 | 원인 | 대응 |
|------|------|------|
| `RuntimeError: no running event loop` | async 코드를 sync 컨텍스트에서 실행 | `asyncio.run(main())`으로 진입 |
| `coroutine was never awaited` | 코루틴을 `await` 없이 호출 | `await coro()` 또는 `asyncio.run(coro())` 사용 |

### 실습 포인트

- `async def`로 정의한 함수를 호출하면 코루틴 객체가 반환된다. `await`로 실행한다.
- `asyncio.gather()`로 여러 코루틴을 동시에 실행할 수 있다.
- `asyncio.run()`은 한 번에 하나의 진입점만 실행한다. 중첩 루프는 `run()` 내부에서 처리된다.

## 핵심 정리

- asyncio는 `asyncio.run()`으로 진입하고, `async def`, `await`로 코루틴을 작성한다.
- `await asyncio.sleep()`으로 대기 시 다른 코루틴이 실행된다.
- `asyncio.gather()`로 여러 코루틴을 동시에 실행한다.
- asyncio 심화(task, 동시성 패턴)는 Series 08에서 다룬다.

# 4.3 Task와 Concurrency

## 개요

본 Section은 **asyncio.create_task()**와 **Task**, **동시성 패턴(Semaphore)**을 다룬다. 4.1·4.2에서 Event loop, `asyncio.run()`, `asyncio.gather()`를 이해했으므로, 이제 Task를 직접 생성하고 동시 연결 수를 제한하는 방법을 익힌다. 학습 흐름은 다음과 같다. ① `create_task()`로 코루틴을 Task로 스케줄하는 방법을 이해한다. ② `gather()`와 `create_task()`의 차이를 파악한다. ③ `asyncio.Semaphore`로 동시 실행 수를 제한한다.

## 이론

### asyncio.create_task()의 역할

> **asyncio.create_task(coro)**는 코루틴을 **Task**로 래핑하여 이벤트 루프에 즉시 스케줄한다. 호출 즉시 Task가 시작되며, `await` 없이도 백그라운드에서 실행된다.

`gather()`는 여러 코루틴을 **한꺼번에** 넘겨서 모두 완료될 때까지 기다린다. `create_task()`는 **코루틴 하나**를 Task로 만들어 루프에 올리고, 반환된 Task를 나중에 `await`할 수 있다. "fire-and-forget" 또는 "백그라운드 작업"처럼 사용할 때 유용하다.

### gather() vs create_task()

| 구분 | asyncio.gather() | asyncio.create_task() |
|------|------------------|------------------------|
| **인자** | 여러 코루틴 | 코루틴 1개 |
| **반환** | 모든 결과 리스트 | Task 객체 |
| **용도** | N개 동시 실행 후 결과 모음 | Task 개별 스케줄, 나중에 await |
| **대기** | `await gather()` 시 모두 완료까지 | `await task` 시 해당 Task만 |

`create_task()`로 만든 Task를 `gather()`에 넘겨서 함께 기다릴 수도 있다. `await asyncio.gather(task1, task2, task3)`처럼 Task 객체 자체를 `gather()`에 전달할 수 있다.

### Task와 await

`create_task(coro)`를 호출하면 Task가 생성되고 **즉시** 루프에 스케줄된다. `await task`를 하면 해당 Task가 완료될 때까지 현재 코루틴이 대기한다. `await` 없이 호출만 하면 Task는 백그라운드에서 실행되며, 완료 후 결과를 확인하지 않을 수 있다. (주의: 예외가 발생하면 "Task exception was never retrieved" 경고가 발생할 수 있음)

### asyncio.Semaphore

> **asyncio.Semaphore(n)**는 동시에 n개까지만 실행되도록 제한하는 동기화 객체다.

네트워크 HTTP 요청 시 서버 부하를 줄이거나, 동시 연결 수를 제한할 때 사용한다. `async with semaphore:`로 감싸면, 세마포어가 가용할 때까지 대기하고, 사용 후 반환한다.

```python
sem = asyncio.Semaphore(5)  # 최대 5개 동시 실행

async def limited_fetch(url):
    async with sem:
        return await fetch(url)  # fetch는 5개씩만 동시 실행
```

Ch06 aiohttp, httpx에서 많은 URL을 동시에 요청할 때 Semaphore로 제한하는 패턴이 자주 사용된다.

## 실습

### 실습 환경

- Python 3.12+
- 설치 패키지: 없음 (asyncio는 표준 라이브러리)

### 목표

`create_task()`로 Task를 생성하고, `Semaphore`로 동시 실행 수를 제한한다.

### lab1: asyncio.create_task()

```python
# create_task_basic.py
import asyncio


async def fetch(sleep_time, name):
    await asyncio.sleep(sleep_time)
    print(f"Done: {name}")
    return name


async def main():
    t1 = asyncio.create_task(fetch(1, "A"))
    t2 = asyncio.create_task(fetch(1, "B"))
    t3 = asyncio.create_task(fetch(1, "C"))
    # 세 Task가 모두 루프에 스케줄됨
    results = await asyncio.gather(t1, t2, t3)
    print(results)


asyncio.run(main())
```

**예상 결과**: 약 1초 후 "Done: A", "Done: B", "Done: C"가 출력되고, `['A', 'B', 'C']`가 출력된다. `create_task()`로 Task를 만들고, `gather()`로 한꺼번에 기다린다.

### lab2: Semaphore로 동시 실행 제한

```python
# semaphore_demo.py
import asyncio


async def limited_task(sem, name, delay):
    async with sem:
        print(f"Start: {name}")
        await asyncio.sleep(delay)
        print(f"End: {name}")
    return name


async def main():
    sem = asyncio.Semaphore(2)  # 최대 2개 동시 실행
    t1 = asyncio.create_task(limited_task(sem, "A", 1))
    t2 = asyncio.create_task(limited_task(sem, "B", 1))
    t3 = asyncio.create_task(limited_task(sem, "C", 1))
    results = await asyncio.gather(t1, t2, t3)
    print(results)


asyncio.run(main())
```

**예상 결과**: "Start: A", "Start: B"가 먼저 출력되고, 1초 후 "End: A", "End: B", "Start: C"가 출력된다. C는 A와 B가 끝난 후에 시작된다. Semaphore(2)로 동시 2개만 허용됨.

### 트러블슈팅

| 현상 | 원인 | 대응 |
|------|------|------|
| `Task exception was never retrieved` | create_task()로 만든 Task에서 예외 발생, await 안 함 | `await task` 또는 `try/except`로 예외 처리 |
| `create_task() got invalid object` | 코루틴이 아닌 객체 전달 | `async def`로 정의된 함수 호출 결과 전달 |

### 실습 포인트

- `create_task()`는 코루틴을 Task로 변환한다. 반환된 Task를 `await`하거나 `gather()`에 넘겨서 기다린다.
- `Semaphore(n)`으로 동시 실행 수를 n개로 제한할 수 있다. 네트워크 요청 제한에 유용하다.

## 핵심 정리

- `asyncio.create_task(coro)`는 코루틴을 Task로 래핑하여 루프에 즉시 스케줄한다.
- `gather()`는 여러 코루틴/Task를 동시에 실행하고 결과를 모은다. `create_task()`는 Task 1개를 생성한다.
- `asyncio.Semaphore(n)`으로 동시 실행 수를 n개로 제한한다. `async with sem:`로 사용한다.
- Ch06 aiohttp, httpx에서 많은 동시 요청 시 Semaphore로 동시 연결 수를 제한하는 패턴이 자주 쓰인다.

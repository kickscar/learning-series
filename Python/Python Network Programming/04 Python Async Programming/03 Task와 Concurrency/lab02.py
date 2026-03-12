# la02.py

import asyncio

async def fetch(sem, data, delay):
    async with sem:
        print(f"fetching: {data}")
        await asyncio.sleep(delay)
        print(f" fetched: {data}")
        
    return data

async def main():
    sem = asyncio.Semaphore(2)  # 최대 2개 동시 실행
    t1 = asyncio.create_task(fetch(sem, "a", 1))
    t2 = asyncio.create_task(fetch(sem, "b", 1))
    t3 = asyncio.create_task(fetch(sem, "c", 1))

    results = await asyncio.gather(t1, t2, t3)
    print(results)

asyncio.run(main())
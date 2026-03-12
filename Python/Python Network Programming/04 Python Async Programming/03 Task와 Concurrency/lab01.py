# lab01.py

import asyncio

async def fetch(delay, data):
    await asyncio.sleep(delay)
    print(f"fetched: {data}")
    return data

async def main():
    t1 = asyncio.create_task(fetch(1, "a"))
    t2 = asyncio.create_task(fetch(1, "b"))
    t3 = asyncio.create_task(fetch(1, "c"))
    
    # 세 Task가 모두 루프에 스케줄됨
    results = await asyncio.gather(t1, t2, t3)
    print(results)

asyncio.run(main())
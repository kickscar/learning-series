# lab03.py

import asyncio
import aiohttp

async def fetch(session, url):
    async with session.get(url) as resp:
        return await resp.json()

async def main():
    urls = ["https://httpbin.org/get", "https://httpbin.org/get", "https://httpbin.org/delay/1"]

    async with aiohttp.ClientSession() as session:
        results = await asyncio.gather(*[fetch(session, url) for url in urls])

        for i, r in enumerate(results):
            print(f"Result {i}: {r.get('url', 'ok')}")

asyncio.run(main())

# lab01.py

import asyncio
import aiohttp

async def main():
    async with aiohttp.ClientSession() as session:
        async with session.get("https://httpbin.org/get") as resp:
            print(resp.status)
            data = await resp.json()
            print(data)

asyncio.run(main())

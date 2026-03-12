# lab02.py

import asyncio
import aiohttp

async def main():
    async with aiohttp.ClientSession() as session:
        async with session.post("https://httpbin.org/post", json={"name": "python", "version": "3.12"}) as resp:
            data = await resp.json()
            print(data.get("json"))

asyncio.run(main())

# lab04.py

import asyncio
import httpx

async def main():
    async with httpx.AsyncClient() as client:
        resp = await client.get("https://httpbin.org/get")
        print(f"Status: {resp.status_code}")
        print(resp.json())


asyncio.run(main())
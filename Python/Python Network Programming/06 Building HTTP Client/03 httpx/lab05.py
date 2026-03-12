# lab05.py

import httpx
import asyncio

async def main():
    async with httpx.AsyncClient() as client:
        r1 = client.get("https://httpbin.org/get")
        r2 = client.get("https://httpbin.org/delay/1")
        
        responses = await asyncio.gather(r1, r2)
        
        for resp in responses:
            print(resp.status_code)


asyncio.run(main())
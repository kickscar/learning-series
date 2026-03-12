# lab02.py

import asyncio

async def print_msg(delay, msg):
    await asyncio.sleep(delay)
    print(msg)

async def main():
    await print_msg(1, 'hello')
    await print_msg(1, 'asyncio')

asyncio.run(main())
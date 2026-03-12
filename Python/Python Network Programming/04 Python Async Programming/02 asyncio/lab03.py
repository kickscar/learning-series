# lab03.py

import asyncio

async def print_msg(delay, msg):
    await asyncio.sleep(delay)
    print(msg)
    return msg

async def main():
    result = await asyncio.gather(
	    print_msg(1, 'hello'),
	    print_msg(1, 'asyncio'),
	    print_msg(1, '!')
    )
    print(result)

asyncio.run(main())
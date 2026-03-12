# lab01.py

import httpx

resp = httpx.get("https://httpbin.org/get")
print(f"Status: {resp.status_code}")
print(resp.json())
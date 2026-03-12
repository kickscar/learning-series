# lab02.py

import httpx

resp = httpx.post(
    "https://httpbin.org/post",
    json={"name": "python", "version": "3.12"},
)

print(resp.json().get("json"))
# lan03.py
import httpx

with httpx.Client() as client:
    r1 = client.get("https://httpbin.org/get")
    r2 = client.get("https://httpbin.org/get")

    print(r1.status_code, r2.status_code)

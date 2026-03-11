# lab03.py
import requests

resp = requests.get(
    "https://httpbin.org/get",
    params={"key": "value", "page": 1},
    headers={"User-Agent": "Python-Network-Programming/1.0"}
)
print(resp.url)
print(resp.json().get("headers", {}).get("User-Agent"))
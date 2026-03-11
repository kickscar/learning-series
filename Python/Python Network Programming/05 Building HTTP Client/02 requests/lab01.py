# lab01.py
import requests

resp = requests.get("https://httpbin.org/get")
print(f"Status: {resp.status_code}")
print(resp.json())
# lab02.py
import requests

resp = requests.post(
    "https://httpbin.org/post",
    json={"name": "python", "version": "3.12"},
)
print(resp.json().get("json"))
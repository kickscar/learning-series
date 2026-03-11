# lab04.py
import requests

session = requests.Session()

# 동일 호스트에 연속 요청 → TCP 연결 재사용 시도
r1 = session.get("https://httpbin.org/get")
r2 = session.get("https://httpbin.org/get")

print(r1.status_code, r2.status_code)
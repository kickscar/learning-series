import urllib3
import json

http = urllib3.PoolManager(cert_reqs='CERT_NONE')
resp = http.request(
    "POST",
    "https://httpbin.org/post",
    body=json.dumps({"name": "python", "version": "3.14.3"}),
    headers={"Content-Type": "application/json"})

print(f"Status: {resp.status}")
print(f"Headers: {resp.headers}")
print(f"Body: {resp.data.decode('utf-8')}")
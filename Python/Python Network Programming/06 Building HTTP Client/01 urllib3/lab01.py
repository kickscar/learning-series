import urllib3

http = urllib3.PoolManager(cert_reqs='CERT_NONE')
resp = http.request("GET", "https://httpbin.org/get")

print(f"Status: {resp.status}")
print(f"Headers: {resp.headers}")
print(f"Body: {resp.data.decode('utf-8')}")

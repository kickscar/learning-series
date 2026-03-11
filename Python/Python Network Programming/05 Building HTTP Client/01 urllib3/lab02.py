import urllib3

http = urllib3.PoolManager(cert_reqs='CERT_NONE')
resp = http.request(
    "POST",
    "https://httpbin.org/post",
    fields={"name": "python", "version": "3.14.3"})

print(f"Status: {resp.status}")
print(f"Headers: {resp.headers}")
print(f"Body: {resp.data.decode('utf-8')}")
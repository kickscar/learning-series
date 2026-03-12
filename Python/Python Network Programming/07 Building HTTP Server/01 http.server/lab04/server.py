# server.py

import http.server

PORT = 8000
DIRECTORY = "static"  # 서빙할 디렉터리

class Handler(http.server.SimpleHTTPRequestHandler):
    def __init__(self, *args, **kwargs):
        super().__init__(*args, directory=DIRECTORY, **kwargs)

with http.server.ThreadingHTTPServer(("", PORT), Handler) as httpd:
    print(f"Serving {DIRECTORY} at port {PORT} with ThreadingHTTPServer")
    httpd.serve_forever()
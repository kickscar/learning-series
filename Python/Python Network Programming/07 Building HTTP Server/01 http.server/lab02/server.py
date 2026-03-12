# server.py

import http.server

PORT = 8000
Handler = http.server.SimpleHTTPRequestHandler

with http.server.HTTPServer(("", PORT), Handler) as httpd:
    print(f"Serving at port {PORT} with HTTPServer")
    httpd.serve_forever()
# 07 Building HTTP Server / 01 http.server

이 디렉토리는 Python에서 **http.server**를 이해하기 위한 예제 코드들을 포함한다.

## What you will learn

- SimpleHTTPRequestHandler로 정적 파일 서빙
- TCPServer vs ThreadingHTTPServer (단일 vs 동시 요청 처리)
- ThreadingTCPServer, ForkingTCPServer 차이
- http.server CLI 옵션 (-b, -d)

## Examples

- `simple_server.py` → TCPServer로 단일 요청 처리
- `threading_server.py` → ThreadingHTTPServer로 동시 요청 처리
- `simple_server_directory.py` → 지정 디렉터리 서빙

## Reference

📘 Notion 문서: [0701notion.cursor.md](https://www.notion.so/01-http-server-320dc703ccda803ca494d5de75f9034e?source=copy_link)

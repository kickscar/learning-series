# 08 Streaming / 02 HTTP Client
이 디렉토리는 Python에서 **HTTP 클라이언트 스트리밍 응답 수신**을 이해하기 위한 예제 코드들을 포함한다.

## What you will learn
- 스트리밍 응답의 필요성과 일반 응답과의 차이
- HTTP Chunked Transfer Encoding의 동작 원리
- requests, httpx를 사용한 동기·비동기 스트리밍 실습

## Examples
- `stream_download_requests.py` → requests의 `stream=True`와 `iter_content()`를 사용한 청크 단위 파일 다운로드
- `stream_lines_requests.py` → requests의 `iter_lines()`를 사용한 줄 단위 스트리밍
- `stream_download_httpx.py` → httpx `Client.stream()`과 `iter_bytes()`를 사용한 파일 다운로드
- `stream_lines_httpx.py` → httpx `Client.stream()`과 `iter_lines()`를 사용한 줄 단위 스트리밍
- `async_stream_download.py` → httpx `AsyncClient.stream()`을 사용한 비동기 파일 다운로드
- `async_stream_lines.py` → httpx `AsyncClient.stream()`을 사용한 비동기 줄 단위 스트리밍

## Reference
📘 [Notion 문서](노션링크)

# 05 Building HTTP Client / 02 requests

이 디렉토리는 Python에서 **requests**와 **Session(연결 재사용)**을 이해하기 위한 예제 코드들을 포함한다.

## What you will learn

- requests의 get(), post() 등 메서드별 API
- Response 객체의 status_code, text, json()으로 응답 처리
- Session을 통한 TCP 연결 재사용(HTTP Keep-Alive)

## Examples

- `lab01.py` → GET 요청
- `lab02.py` → POST 요청 (JSON)
- `lab03.py` → 쿼리 파라미터, 헤더 설정
- `lab04.py` → Session으로 동일 호스트 연속 요청 (연결 재사용)

## Reference

📘 [Notion 문서](https://www.notion.so/02-requests-320dc703ccda80589c05eee8101711cd?source=copy_link)

# 03 셸과 CLI / 01 셸의 역할

셸이 무엇이고, 명령어가 입력에서 실행까지 어떤 과정을 거치는지를 다룬다. 터미널과 셸의 관계, bash 프롬프트 구조, 명령어 탐색 순서, 내장 명령과 외부 명령의 차이를 이해한다.

## What you will learn

- 셸이 커널과 사용자 사이의 인터페이스라는 것
- 터미널(화면)과 셸(명령 처리)의 구분
- bash 프롬프트 구조 (user@host:path$)
- 명령어 해석 과정: 입력 → 파싱 → alias/builtin/PATH 탐색 → fork/exec → 출력
- cd가 반드시 builtin이어야 하는 이유
- type, which, man, --help 사용법

## Reference

- Notion: [Notion document](https://app.notion.com/p/01-379dc703ccda80e4bce6e2a9de67625a?source=copy_link)

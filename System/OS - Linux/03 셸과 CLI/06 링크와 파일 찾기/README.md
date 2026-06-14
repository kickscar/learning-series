# 03 셸과 CLI / 06 링크와 파일 찾기

파일의 다른 이름을 만드는 링크(하드 링크, 심볼릭 링크)와 파일시스템에서 파일을 찾는 방법(find, locate)을 다룬다.

## What you will learn

- inode — 파일의 실체는 이름이 아니라 inode다
- 하드 링크: 같은 inode를 가리키는 다른 이름 (ln)
- 심볼릭 링크: 경로를 가리키는 특수 파일 (ln -s), dangling link
- find: 이름, 타입, 크기, 수정 시간, 권한 기준 실시간 탐색. -exec, -delete
- locate: 데이터베이스 기반 빠른 검색. Rocky 9에서 plocate로 교체
- which, type, whereis: 명령어 위치와 유형 확인

## Reference

- Notion: [Notion document](https://app.notion.com/p/06-379dc703ccda80af85ecefc19cdf50c5?source=copy_link)

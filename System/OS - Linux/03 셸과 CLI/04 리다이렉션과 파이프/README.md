# 03 셸과 CLI / 04 리다이렉션과 파이프

stdin, stdout, stderr를 파일이나 다른 프로그램으로 연결하는 리다이렉션과 파이프를 다룬다. UNIX 설계 철학 "작은 도구를 파이프로 조합한다"를 직접 실현한다.

## What you will learn

- 표준 스트림 stdin(0), stdout(1), stderr(2)의 리다이렉션
- 출력(>, >>), 입력(<), 에러(2>, 2>&1, &>) 리다이렉션과 순서 함정
- /dev/null로 출력 버리기 — 2>/dev/null 실무 패턴
- 파이프(|)로 명령어를 체인으로 조합
- tee(화면+파일 동시 출력), xargs(stdin을 인수로 변환)
- 리다이렉션 + 파이프 + tee를 한 줄에 조합하는 실전 패턴

## Reference

- Notion: [Notion document](https://app.notion.com/p/04-379dc703ccda809194d5cd4a8ec02108?source=copy_link)

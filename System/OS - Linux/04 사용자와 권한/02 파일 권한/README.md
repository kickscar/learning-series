# 04 사용자와 권한 / 02 파일 권한

Linux의 rwx 권한 모델을 이해하고, 권한과 소유권을 CLI로 관리한다.

## What you will learn

- 소유자(owner), 소유 그룹(group), 기타(other)의 구분
- rwx 권한: 파일과 디렉토리에서의 의미 차이
- ls -l 퍼미션 문자열 해석과 8진수 변환
- chmod: 기호 방식(u+x)과 8진수 방식(755)
- chown, chgrp: 소유권 변경
- umask: 파일 생성 시 기본 권한 마스크. Rocky Linux 9 기본값 0002

## Reference

- Notion: [Notion document](https://app.notion.com/p/02-379dc703ccda809faf88c6e1ace8763a?source=copy_link)

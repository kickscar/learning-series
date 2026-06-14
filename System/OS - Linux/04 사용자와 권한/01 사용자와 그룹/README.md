# 04 사용자와 권한 / 01 사용자와 그룹

Linux의 멀티유저 체계를 다룬다. 사용자와 그룹의 구조, 관련 파일(/etc/passwd, /etc/shadow, /etc/group), 사용자·그룹 관리 명령을 익힌다.

## What you will learn

- 멀티유저 시스템과 UID/GID 체계 (root=0, 시스템=1~999, 일반=1000+)
- 기본 그룹(Primary)과 보조 그룹(Supplementary)의 차이
- /etc/passwd, /etc/shadow, /etc/group 파일 구조와 필드 해석
- useradd, passwd, usermod (-aG 주의), userdel로 사용자 관리
- groupadd, groupdel로 그룹 관리
- su vs su - 의 차이 (환경 로드 여부)

## Reference

- Notion: [Notion document](https://app.notion.com/p/01-379dc703ccda80e9bfb7d9a37dc7a1de?source=copy_link)

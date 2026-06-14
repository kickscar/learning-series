# 04 사용자와 권한 / 03 권한 상승과 특수 권한

sudo로 root 권한을 안전하게 사용하는 방법과, setuid/setgid/sticky bit 특수 권한을 다룬다.

## What you will learn

- sudo: 자신의 비밀번호로 root 권한 획득. su와의 차이
- /etc/sudoers 문법과 visudo. %wheel ALL=(ALL) ALL의 의미
- sudoers.d 드롭인 디렉토리
- setuid (4000): 파일 소유자 권한으로 실행. /usr/bin/passwd 사례
- setgid (2000): 디렉토리에서 그룹 상속
- sticky bit (1000): 소유자만 삭제 가능. /tmp 사례

## Reference

- Notion: [Notion document](https://app.notion.com/p/03-379dc703ccda8007a28cd33726838a98?source=copy_link)

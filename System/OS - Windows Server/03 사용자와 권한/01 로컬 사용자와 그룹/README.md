# 03 사용자와 권한 / 01 로컬 사용자와 그룹

Windows의 로컬 사용자/그룹 관리와 식별자 SID를 다룬다. Linux의 사용자 관리(useradd, /etc/passwd, UID/GID)와 대응시키며, GUI 확인 → PowerShell 패턴으로 계정을 운영한다.

## What you will learn

- 로컬 사용자 계정(Administrator/Guest)과 SAM 데이터베이스 (Linux `/etc/passwd`+`/etc/shadow` 대응)
- SID(Security Identifier)와 RID — Windows는 이름이 아니라 SID로 사용자를 식별 (Linux UID/GID 대응, RID 500=Administrator)
- 로컬 그룹(Administrators/Users/Remote Desktop Users) = 권한의 묶음
- 관리 도구 3종: `lusrmgr.msc`(GUI) / `net user`(CLI) / `New-LocalUser` 등 PowerShell(주력)
- Linux 대응: useradd→New-LocalUser, usermod -aG→Add-LocalGroupMember, id→whoami /user

## Examples

- `lab01` → GUI(`lusrmgr.msc`)와 `Get-LocalUser`로 목록 확인 → `New-LocalUser`/`New-LocalGroup`/`Add-LocalGroupMember`로 생성·추가 → `whoami /user`로 SID 확인

## Reference

- Notion: [Notion document]()

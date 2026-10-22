# 03 사용자와 권한 / 02 NTFS 권한과 ACL

NTFS 권한 체계와 ACL(Access Control List), 상속을 다룬다. Linux의 `chmod`(대상 3개 × rwx 3개)와 대비해 "같은 목적, 더 세분화된 구현"임을 체감하고, `icacls`/`Get-Acl`로 권한을 운영한다.

## What you will learn

- NTFS 기본 권한 6종(Full Control/Modify/Read & Execute/Read/Write/List)과 13가지 넘는 특수 권한
- ACL = ACE(Access Control Entry)의 목록. 각 ACE = "어떤 사용자(SID)에게 어떤 권한"
- Linux `chmod`(3대상×rwx) vs NTFS ACL(무제한 대상×세분 권한) — 핵심 대조
- 상속(inherited vs explicit ACE)과 상속 차단(`/inheritance:d`)
- 관리 도구: 보안 탭(GUI) / `icacls`(CLI) / `Get-Acl`·`Set-Acl`(PowerShell), Linux `chmod`/`chown` 대응

## Examples

- `lab01` → `C:\data` 생성 → GUI 보안 탭·`icacls`로 ACL 확인 → `icacls /grant`로 webadmin에 Modify 부여 → `Get-Acl`로 ACE 객체 확인 → 상속 차단

## Reference

- Notion: [Notion document]()

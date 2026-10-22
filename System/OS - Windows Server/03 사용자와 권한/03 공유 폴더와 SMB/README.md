# 03 사용자와 권한 / 03 공유 폴더와 SMB

SMB로 폴더를 네트워크에 공유한다. 공유 권한과 NTFS 권한의 이중 구조(둘 중 더 제한적인 것이 유효 권한)를 핵심으로 짚고, `New-SmbShare`로 공유를 만들어 호스트에서 접근한다. Linux NFS/Samba에 대응한다.

## What you will learn

- SMB = Windows 네트워크 파일 공유 프로토콜(NFS 대응), 포트 445
- **이중 권한 구조**: 공유 권한(네트워크 연결) + NTFS 권한(파일 접근), 유효 권한 = 가장 제한적인 것(교집합)
- 모범 사례: 공유 권한은 관대하게, NTFS를 source of truth로
- `New-SmbShare`/`Get-SmbShare`/`Get-SmbShareAccess`/`Grant-SmbShareAccess`
- Linux NFS, Windows↔Linux 공유는 Samba

## Examples

- `lab01` → 방화벽 "File and Printer Sharing" 허용 → 폴더+NTFS(Users:Read) → `New-SmbShare -ChangeAccess Everyone` → `Get-SmbShareAccess` → `\\192.168.56.10\TeamData` 접근(읽기 O, 쓰기 X = NTFS가 이김)

## Reference

- Notion: [Notion document]()

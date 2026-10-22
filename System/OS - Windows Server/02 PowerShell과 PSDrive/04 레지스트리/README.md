# 02 PowerShell과 PSDrive / 04 레지스트리

Windows 고유의 중앙 설정 저장소인 레지스트리를 다룬다. Linux는 설정이 `/etc`와 커널 파라미터로 분산되지만 Windows는 레지스트리로 중앙화한다. 파일에서 쓰던 항목 cmdlet이 키에 그대로 통하고, 값은 `*-ItemProperty` 계열로 갈리는 것을 확인한다.

## What you will learn

- 레지스트리 구조: 하이브(HKLM 시스템 전체 / HKCU 현재 사용자) → 키(폴더 격) → 값(설정 데이터). Linux 대응 없음
- 키는 파일과 같은 cmdlet으로: `Set-Location`(cd), `Get-ChildItem`(ls), `New-Item`, `Remove-Item` — 드라이브만 `HKLM:`으로 바뀐다
- 값은 `*-ItemProperty` 계열로: `New-ItemProperty`(형식 지정), `Set-ItemProperty`, `Get-ItemPropertyValue`, `Remove-ItemProperty`
- 핵심 대비: 같은 PSDrive 추상이지만 키(항목)와 값(항목의 속성)은 다른 cmdlet 계열
- 값 형식: `String`(REG_SZ), `DWord`(REG_DWORD), `Binary`. HKLM 수정은 관리자 권한
- 뒤 챕터 재등장 예고: 원격 접속 `fDenyTSConnections`(DWord) 등

## Examples

- `lab01` → `regedit`와 `Get-ChildItem HKLM:\...`로 탐색(이중 패턴) → `New-Item HKCU:\Software\WinLab`로 키 생성 → `New/Set-ItemProperty`로 값 설정·수정 → `regedit`로 확인 → `Remove-Item -Recurse`로 정리

## Reference

- Notion: [Notion document]()

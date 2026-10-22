# 01 설치와 관리 기초 / 05 MMC와 스냅인

Windows GUI 관리의 본체인 MMC(Microsoft Management Console)와 스냅인을 다룬다. 다음 섹션의 PowerShell과 짝을 이루는, 관리의 두 얼굴 중 GUI 쪽이다. GUI로 구조를 파악하고 cmdlet으로 반복한다는 이 과목의 방식을 여기서 세운다.

## What you will learn

- MMC는 관리 도구를 담는 틀(Framework), 스냅인은 그 틀에 끼우는 개별 도구(.msc)라는 구조
- `compmgmt.msc`(컴퓨터 관리): 여러 스냅인이 미리 조립된 기성 MMC 콘솔로 개념을 체감
- 스냅인과 cmdlet은 짝이다: `services.msc`↔`Get-Service`, `eventvwr.msc`↔`Get-WinEvent`, `lusrmgr.msc`↔`Get-LocalUser`
- AD·Hyper-V 스냅인(`dsa.msc`, `gpmc.msc`, `virtmgmt.msc`)은 해당 역할 설치 후 나타난다(후반부 예고)
- Linux는 관리 도구가 개별 CLI로 흩어져 있고, Windows는 MMC로 GUI를 통합한다

## Examples

- `lab01` → `compmgmt.msc`로 기성 콘솔 구조 확인 → 빈 `mmc.exe`에 스냅인(서비스·이벤트 뷰어·로컬 사용자 및 그룹) 추가 → `C:\Tools\admin.msc`로 저장 → 각 스냅인 대응 cmdlet(`Get-Service` 등) 실행

## Reference

- Notion: [Notion document]()

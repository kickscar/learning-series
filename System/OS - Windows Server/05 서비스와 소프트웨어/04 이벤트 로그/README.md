# 05 서비스와 소프트웨어 / 04 이벤트 로그

Windows 이벤트 로그를 `Get-WinEvent`로 조회·필터한다. Linux의 `journalctl`과 대응시키며, 채널(System/Application/Security/Setup)과 이벤트 수준을 짚고, `eventvwr.msc` 확인 → PowerShell 패턴으로 오류 필터·로그인 기록을 본다.

## What you will learn

- Windows 이벤트 로그 = 처음부터 중앙 집중·구조화(`journalctl` 통합에 대응), GUI `eventvwr.msc`
- 채널: System/Application/Security/Setup (Security = 인증·감사)
- 이벤트 수준: 1 Critical / 2 Error / 3 Warning / 4 Information, **필터 시 정수**
- `Get-WinEvent -LogName -MaxEvents`(=`journalctl -n`), `-FilterHashtable @{Level=2}`(=`journalctl -p err`)
- `Get-EventLog`은 deprecated → `Get-WinEvent` 사용

## Examples

- `lab01` → `eventvwr.msc`로 System 로그 확인 → `Get-WinEvent -LogName System -MaxEvents 10` → `-FilterHashtable @{Level=2}`로 오류 필터 → `Get-WinEvent -LogName Security`로 로그온(4624/4625) 확인

## Reference

- Notion: [Notion document]()

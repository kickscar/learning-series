# 01 설치와 관리 기초 / 07 호스트명·시간·로캘

서버 초기 설정(호스트명, 시간/타임존, 로캘)을 "GUI 확인 → PowerShell" 패턴으로 수행한다. 이 과목의 핵심 실습 패턴이 처음 본격 적용되는 섹션이다.

## What you will learn

- 호스트명 변경(`Rename-Computer`, 재부팅 필요)과 Linux `hostnamectl`과의 차이
- 타임존 설정(`Set-TimeZone`)과 NTP 동기화(Windows Time service `w32time`), Linux의 `timedatectl`/chrony 대응
- 시스템 로캘(`Get-WinSystemLocale`, en-US 유지)과 Linux `localectl` 대응
- `systeminfo`로 시스템 정보 종합 확인
- "GUI 확인 → PowerShell" 이중 패턴: 같은 작업의 두 방식 비교

## Examples

- `lab01` → 호스트명·타임존을 GUI에서 확인하고 PowerShell로 변경, `systeminfo`로 결과 확인, 재부팅으로 호스트명 적용

## Reference

- Notion: [Notion document]()

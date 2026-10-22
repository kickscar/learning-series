# 05 서비스와 소프트웨어 / 01 Windows Services

Windows Service를 `Get-Service` 계열 cmdlet으로 다룬다. Linux의 systemd 유닛/데몬과 같은 개념임을 짚고, `systemctl`과 대응시키며 GUI(`services.msc`) 확인 → PowerShell 패턴으로 서비스를 제어한다.

## What you will learn

- Windows Service = 백그라운드 상시 프로세스(Linux 데몬/systemd 유닛 대응), SCM이 관리
- 상태(Running/Stopped/Paused), 시작 유형(Automatic/Manual/Disabled), `Disabled`는 시작 불가
- `Get-Service`(조회), `Start/Stop/Restart-Service`(제어), `Set-Service -StartupType`(시작 유형)
- `systemctl start/stop/enable` ↔ `Start/Stop-Service`, `Set-Service -StartupType` 대응
- 레거시 `sc.exe`/`net start`, GUI `services.msc`

## Examples

- `lab01` → `Get-Service | Where Status -eq Running`으로 목록 → `Get-Service WinRM`(원격 접속)·`W3SVC`(미설치 에러) 확인 → `Spooler` 중지/시작 → `Set-Service -StartupType`로 시작 유형 변경 → `services.msc` 확인

## Reference

- Notion: [Notion document]()

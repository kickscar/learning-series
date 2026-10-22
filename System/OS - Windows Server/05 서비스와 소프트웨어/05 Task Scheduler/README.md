# 05 서비스와 소프트웨어 / 05 Task Scheduler

Windows Task Scheduler를 ScheduledTasks cmdlet으로 다룬다. Linux `cron`/systemd timer와 대응시키며, cron의 한 줄이 Windows에서는 Action·Trigger 객체 조립으로 나뉘는 차이를 짚고, `taskschd.msc` 확인 → PowerShell로 1분마다 실행하는 작업을 등록한다.

## What you will learn

- Task Scheduler = 예약 작업 실행기(`cron`/systemd timer 대응)
- cron 한 줄 ↔ Windows의 Action(`New-ScheduledTaskAction`) + Trigger(`New-ScheduledTaskTrigger`) + `Register-ScheduledTask` 조립
- 트리거: `-Once`/`-Daily`/`-AtStartup`/`-AtLogon`, 반복 `-RepetitionInterval`
- `Get-ScheduledTask`(=`crontab -l`), `Unregister-ScheduledTask`(=`crontab -r`)

## Examples

- `lab01` → `taskschd.msc` 확인 → `sysinfo-log.ps1`(시스템 정보를 `C:\labs\sysinfo.log`에 기록) 배치 → `Register-ScheduledTask`로 1분마다 등록 → `Get-Content`로 누적 확인 → `Unregister-ScheduledTask`로 정리
- 소스: `lab01/sysinfo-log.ps1`

## Reference

- Notion: [Notion document]()

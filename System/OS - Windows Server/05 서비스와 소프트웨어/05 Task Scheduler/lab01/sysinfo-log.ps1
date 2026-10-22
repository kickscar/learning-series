# sysinfo-log.ps1
# 시스템 정보 스냅샷을 로그 파일에 한 줄씩 추가한다.
# Task Scheduler가 1분마다 실행한다 (Linux cron의 "* * * * *"에 대응).

$logPath = "C:\labs\sysinfo.log"

# 로그 디렉토리 보장
$logDir = Split-Path $logPath -Parent
if (-not (Test-Path $logDir)) {
    New-Item -ItemType Directory -Path $logDir -Force | Out-Null
}

# 시스템 정보 수집
$time   = Get-Date -Format "yyyy-MM-dd HH:mm:ss"
$cpu    = (Get-CimInstance Win32_Processor).LoadPercentage
$os     = Get-CimInstance Win32_OperatingSystem
$freeMB = [math]::Round($os.FreePhysicalMemory / 1024)

# 한 줄로 기록
$line = "{0}  host={1}  cpu={2}%  freeMem={3}MB" -f $time, $env:COMPUTERNAME, $cpu, $freeMB
Add-Content -Path $logPath -Value $line

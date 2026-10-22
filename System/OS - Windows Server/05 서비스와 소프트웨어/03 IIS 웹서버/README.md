# 05 서비스와 소프트웨어 / 03 IIS 웹서버

전반부 종합 실습. IIS를 설치·서비스 확인·방화벽 개방으로 한 줄기로 엮어 웹서버를 세운다. Linux의 "Nginx 설치 → systemctl → firewall-cmd → curl" 흐름과 완전 대응하며, IIS 고유의 애플리케이션 풀을 본다.

## What you will learn

- IIS = Windows 표준 웹서버(Nginx/Apache 대응), 서비스 `W3SVC`, 루트 `C:\inetpub\wwwroot\`, 관리 `inetmgr`
- IIS 차별점 3가지: Windows 인증·AD 통합, .NET 네이티브 호스팅, 애플리케이션 풀(`w3wp.exe` 프로세스 격리)
- `Install-WindowsFeature Web-Server -IncludeManagementTools`로 설치
- `New-NetFirewallRule`로 HTTP(80) 개방 → 호스트 브라우저 접속
- `Get-IISAppPool`로 `DefaultAppPool` 확인

## Examples

- `lab01` → `Install-WindowsFeature Web-Server` → `Get-Service W3SVC`(Running) → `Default.htm` 배포 → `New-NetFirewallRule "IIS-HTTP"` → 호스트에서 `http://192.168.56.10` 접속 → `Get-IISAppPool` 확인

## Reference

- Notion: [Notion document]()

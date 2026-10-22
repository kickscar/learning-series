# 04 네트워크와 원격 운영 / 03 원격 접속

Windows Server의 원격 접속 세 갈래(RDP·PowerShell Remoting·OpenSSH)를 다룬다. Linux의 SSH 하나가 하던 일을 용도별로 나눠 쓰며, GUI 확인 → PowerShell 패턴으로 RDP를 활성화하고 PSRemoting으로 원격 셸을 연다.

## What you will learn

- RDP(GUI 화면 원격), PowerShell Remoting(객체 셸), OpenSSH(텍스트 셸)의 차이와 Linux SSH 대응
- RDP 활성화: `Set-ItemProperty fDenyTSConnections` + `Enable-NetFirewallRule -DisplayGroup "Remote Desktop"` (Windows Firewall 연결)
- `Enter-PSSession`(대화형, `ssh user@host` 대응), `Invoke-Command`(1회 명령, `ssh host 'cmd'` 대응)
- PSRemoting이 SSH와 다른 점: 텍스트가 아닌 **객체**를 전송
- OpenSSH 설치(`Add-WindowsCapability`)로 Linux SSH 그대로 접속

## Examples

- `lab01` → RDP 활성화(`fDenyTSConnections`=0, 방화벽 그룹) → 호스트에서 관리망 `192.168.56.10`으로 `mstsc` 접속 → `Enable-PSRemoting` 확인 → `Enter-PSSession`/`Invoke-Command`로 원격 셸·명령

## Reference

- Notion: [Notion document]()

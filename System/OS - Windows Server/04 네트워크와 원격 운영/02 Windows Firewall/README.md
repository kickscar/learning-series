# 04 네트워크와 원격 운영 / 02 Windows Firewall

Windows Defender Firewall를 NetSecurity cmdlet으로 다룬다. Linux `firewalld`와 대응시키며, 정책 단위가 zone이 아니라 프로필(Domain/Private/Public)이라는 차이를 짚고, GUI(`wf.msc`) 확인 → PowerShell 패턴으로 HTTP 인바운드 규칙을 만든다.

## What you will learn

- Windows Defender Firewall 기본 정책(인바운드 차단, 아웃바운드 허용)과 `wf.msc`
- 프로필 Domain/Private/Public — 네트워크 위치에 따라 자동 전환 (Linux firewalld zone 대응)
- `New-NetFirewallRule -Direction -Protocol -LocalPort -Action`으로 규칙 생성 (`firewall-cmd --add-service=http` 대응)
- `Get-NetFirewallProfile`로 프로필 상태, `Get-NetFirewallRule`로 규칙 조회
- `Disable/Enable-NetFirewallRule`로 규칙 켜고 끄기, 레거시 `netsh advfirewall`

## Examples

- `lab01` → `Get-NetFirewallProfile`로 프로필 확인 → `New-NetFirewallRule`로 HTTP(80) 인바운드 허용 → `wf.msc` GUI 확인 → `Disable/Enable-NetFirewallRule`로 비활성화/재활성화

## Reference

- Notion: [Notion document]()

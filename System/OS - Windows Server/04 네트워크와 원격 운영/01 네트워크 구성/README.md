# 04 네트워크와 원격 운영 / 01 네트워크 구성

Windows Server의 네트워크 구성(어댑터·IP·경로·DNS)을 NetTCPIP cmdlet으로 다룬다. Linux의 `ip addr`/`ip route`/`nmcli`와 대응시키며, 이 서버를 내부 서브넷에 연결해 다른 서브넷의 서버까지 도달한다.

## What you will learn

- `Get-NetAdapter`로 여러 NIC 확인 (Linux `ip link` 대응), 어댑터는 InterfaceAlias/InterfaceIndex로 지정
- `Get-NetIPConfiguration`/`Get-NetIPAddress`로 IP 조회, `New-NetIPAddress`로 정적 IP 설정
- `New-NetRoute`로 다른 서브넷 경로 추가 (Linux `ip route add ... via` 대응)
- `Set-DnsClientServerAddress`로 내부 DNS 지정 (외부 DNS가 아닌 내부 DNS 서버)
- `Test-NetConnection`으로 연결 확인 (`-Port`로 포트까지, Linux `ping`/`nc` 대응)

## Examples

- `lab01` → winserver-vm에 Internal Network(subnet-pub) 어댑터 추가 → `New-NetIPAddress`로 172.16.1.20/24 설정 → `New-NetRoute`로 사설 서브넷(172.16.2.0/24) 경로 추가 → 내부 DNS 지정 → `Test-NetConnection`으로 라우터(172.16.1.1)·DB 서버(172.16.2.10:3306) 도달 확인

## Reference

- Notion: [Notion document]()

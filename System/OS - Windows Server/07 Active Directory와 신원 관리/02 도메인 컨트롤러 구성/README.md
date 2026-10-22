# 07 Active Directory와 신원 관리 / 02 도메인 컨트롤러 구성

`winserver-vm`을 `lab.local` 포레스트의 첫 도메인 컨트롤러로 승격한다. 역할 설치와 DC 승격이 별개 단계임을 짚고, MMC 스냅인(`dsa.msc`)이 처음 등장한다.

## What you will learn

- 두 단계: 역할 설치(`Install-WindowsFeature AD-Domain-Services`) → DC 승격(`Install-ADDSForest`)
- `Install-ADDSForest -DomainName lab.local -DomainNetbiosName LAB -InstallDns` (도메인 이름 = DNS 이름)
- DSRM 암호(복구 모드용, 도메인 관리자 암호와 별개)
- 승격 후 변화: DNS 자동 구성, 로그인 `LAB\Administrator`, 로컬 SAM 비활성, AD 도구 추가
- `Get-ADDomainController`/`nslookup`으로 DC·DNS 확인, `dsa.msc` 기본 구조

## Examples

- `lab01` → `Install-WindowsFeature AD-Domain-Services` → `Install-ADDSForest`(lab.local 포레스트, 자동 재부팅) → `LAB\Administrator` 로그인 → `Get-ADDomainController`/`nslookup lab.local` 확인 → `dsa.msc` 기본 컨테이너 확인

## Reference

- Notion: [Notion document]()

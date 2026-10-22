# 07 Active Directory와 신원 관리 / 03 사용자·OU·그룹

`lab.local` 도메인에 OU·도메인 사용자·그룹을 만든다. 로컬 계정이 도메인 계정으로 확장되는 지점이며, AD 모듈 cmdlet과 DN(Distinguished Name) 개념을 익힌다. 반복 작업은 PowerShell 스크립트로 일괄 처리한다.

## What you will learn

- OU = GPO·위임의 단위. IT/HR/Dev 부서별 설계
- 도메인 사용자 vs 로컬 사용자: AD DB 저장, 도메인 전역 인증, `New-ADUser`
- DN(Distinguished Name): `lab.local` = `DC=lab,DC=local`, `OU=IT,DC=lab,DC=local`
- 그룹: Security/Distribution × Global/DomainLocal/Universal
- `New-ADOrganizationalUnit`/`New-ADUser`/`New-ADGroup`/`Add-ADGroupMember`/`Get-ADUser`

## Examples

- `lab01` → `dsa.msc`로 OU 생성 확인 → `New-ADOrganizationalUnit`(IT/HR/Dev) → `New-ADUser`(각 OU 배치) → `New-ADGroup`+`Add-ADGroupMember`(IT-Admins) → `Get-ADUser -Filter *` 조회
- 소스: `lab01/provision-ad.ps1` (OU·사용자·그룹 일괄 생성, 재실행 시 중복 건너뜀)

## Reference

- Notion: [Notion document]()

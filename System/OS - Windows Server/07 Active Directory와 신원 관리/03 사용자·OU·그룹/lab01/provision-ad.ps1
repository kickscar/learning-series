# provision-ad.ps1
# lab.local 도메인에 OU·도메인 사용자·그룹을 일괄 생성한다.
# DC(winserver-vm)에서 관리자 권한 PowerShell로 실행한다.
# 실습용 스크립트이므로 암호를 코드에 두었다. 운영에서는 이렇게 하지 않는다.

$domainDN = "DC=lab,DC=local"
$ous      = "IT", "HR", "Dev"
$password = ConvertTo-SecureString "P@ssw0rd2026!" -AsPlainText -Force

# 1. OU 생성 (이미 있으면 건너뜀)
foreach ($ou in $ous) {
    $exists = Get-ADOrganizationalUnit -Filter "Name -eq '$ou'" -ErrorAction SilentlyContinue
    if (-not $exists) {
        New-ADOrganizationalUnit -Name $ou -Path $domainDN `
            -ProtectedFromAccidentalDeletion $false
        Write-Host "OU 생성: $ou"
    }
}

# 2. 도메인 사용자 생성 (OU별 배치)
$users = @(
    @{ Name = "Kim IT";   Sam = "kim.it";   OU = "IT"  },
    @{ Name = "Lee HR";   Sam = "lee.hr";   OU = "HR"  },
    @{ Name = "Park Dev"; Sam = "park.dev"; OU = "Dev" }
)
foreach ($u in $users) {
    $exists = Get-ADUser -Filter "SamAccountName -eq '$($u.Sam)'" -ErrorAction SilentlyContinue
    if (-not $exists) {
        New-ADUser -Name $u.Name -SamAccountName $u.Sam `
            -UserPrincipalName "$($u.Sam)@lab.local" `
            -Path "OU=$($u.OU),$domainDN" `
            -AccountPassword $password -Enabled $true
        Write-Host "사용자 생성: $($u.Sam) (OU=$($u.OU))"
    }
}

# 3. 보안 그룹 생성 + 멤버 추가
$exists = Get-ADGroup -Filter "Name -eq 'IT-Admins'" -ErrorAction SilentlyContinue
if (-not $exists) {
    New-ADGroup -Name "IT-Admins" -GroupScope Global -GroupCategory Security `
        -Path "OU=IT,$domainDN"
    Write-Host "그룹 생성: IT-Admins"
}
Add-ADGroupMember -Identity "IT-Admins" -Members "kim.it"
Write-Host "IT-Admins 멤버 추가: kim.it"

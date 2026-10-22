# 05 서비스와 소프트웨어 / 02 소프트웨어 설치

Windows Server의 소프트웨어 설치 두 갈래(역할/기능 vs 애플리케이션)를 다룬다. Linux `dnf` 하나가 하던 일을 `Install-WindowsFeature`(역할)와 `winget`(앱)으로 나눠 쓰며, GUI(Server Manager) 확인 → PowerShell 패턴으로 조회·설치한다.

## What you will learn

- 설치 두 갈래: 역할/기능(IIS·DNS 등 OS 구성요소) ↔ 애플리케이션(7zip·git 등)
- `Install-WindowsFeature`(=`Add-WindowsFeature` 대체), `-IncludeManagementTools`, `Get-WindowsFeature` (`dnf install httpd` 대응)
- `winget search/install/list/upgrade` (`dnf`/`apt` 대응)
- winget 가용성: **Server 2022 기본 미포함**(수동 설치), **Server 2025 기본 포함**

## Examples

- `lab01` → `Get-WindowsFeature -like Web*`로 역할 조회(IIS는 IIS 웹서버 섹션에서 설치) → Server Manager 역할 추가 마법사 확인 → `winget install 7zip.7zip`로 앱 설치 → `winget list`로 확인

## Reference

- Notion: [Notion document]()

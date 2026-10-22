# 01 설치와 관리 기초 / 04 관리 도구의 변화

Windows Server 관리 도구의 3세대 변화(GUI → WAC → PowerShell)를 다루고, 이 과목이 PowerShell을 주력으로 삼는 당위성을 세운다. 이후 모든 Lab의 접근 방식을 결정하는 핵심 맥락 섹션이다.

## What you will learn

- 관리 도구 3세대 변화: 1세대 GUI(Server Manager/MMC/RDP) → 2세대 Windows Admin Center → 3세대 PowerShell
- WAC도 내부적으로 PowerShell을 실행하며, Server Core는 PowerShell 없이 관리할 수 없다는 점
- RDP의 보안 위험(포트 3389)과 Azure의 대체 수단(Bastion, JIT)
- SSH on Windows Server (2022 선택 → 2025 기본)
- 이 과목의 Lab 접근 방식: "GUI 확인 → PowerShell" 균형 패턴

## Examples

- `lab01` → Server Manager(GUI)와 `Get-ComputerInfo`(PowerShell)로 같은 서버 정보를 확인하고, 이 과목의 기본 도구를 정한다

## Reference

- Notion: [Notion document]()

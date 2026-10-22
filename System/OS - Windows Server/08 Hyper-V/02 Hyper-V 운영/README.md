# 08 Hyper-V / 02 Hyper-V 운영

Hyper-V를 직접 운영한다. 역할 설치, 가상 스위치·VM 생성, 전원 제어, 체크포인트를 PowerShell과 Hyper-V Manager로 다룬다. Hyper-V 아키텍처 섹션의 개념(Type-1, Root Partition, 가상 스위치, 체크포인트)을 손으로 구현한다. 실습 환경 특성상 중첩 가상화가 필요하다.

## What you will learn

- `Install-WindowsFeature Hyper-V -Restart` (재부팅으로 하이퍼바이저 우선 로드), `virtmgmt.msc`
- `New-VMSwitch -SwitchType External/Internal/Private` (Hyper-V 아키텍처의 세 종류)
- `New-VM`(Generation 2/UEFI), `Get-VM`, `Start-VM`/`Stop-VM`
- `Checkpoint-VM`/`Restore-VMCheckpoint` (Hyper-V 아키텍처의 Standard/Production)
- 중첩 가상화: winserver-vm가 VirtualBox 게스트라 nested VT-x 활성 필요

## Examples

- `lab01` → VirtualBox 중첩 가상화 활성 → `Install-WindowsFeature Hyper-V` → `New-VMSwitch Internal` → `New-VM test-vm` → `Start-VM`/`Stop-VM` → `Checkpoint-VM`/`Restore-VMCheckpoint`

## Reference

- Notion: [Notion document]()

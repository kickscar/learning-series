# 07 Active Directory와 신원 관리 / 04 그룹 정책 (GPO)

GPO로 도메인 전체에 정책을 배포한다. 적용 순서(LSDOU)와 "비밀번호 정책은 도메인 루트에만 적용된다"는 핵심 함정을 짚고, 도메인 비밀번호 정책과 OU 레벨 가시적 정책을 각각 배포한다.

## What you will learn

- GPO = 사용자·컴퓨터 설정의 도메인/OU 단위 일괄 배포 (Windows 고유, 신원에 정책을 입힘)
- 적용 순서 LSDOU(Local→Site→Domain→OU), 나중(OU)이 우선. Enforced/Block Inheritance 예외
- **함정**: 비밀번호/계정잠금 정책 GPO는 도메인 루트 연결만 유효. 차등은 FGPP(`New-ADFineGrainedPasswordPolicy`)
- `Set-ADDefaultDomainPasswordPolicy`(도메인 정책), `New-GPO`/`New-GPLink`/`Set-GPRegistryValue`(OU 정책)
- `gpupdate /force`, `gpresult /r`, `gpmc.msc`

## Examples

- `lab01` → `gpmc.msc`로 Default Domain Policy 비밀번호 정책 위치 확인 → `Set-ADDefaultDomainPasswordPolicy`(길이 12·복잡성) → 약한 암호 `New-ADUser` 거부로 실증 → `New-GPO`+`New-GPLink`로 IT OU에 "Desktop Control" → `gpupdate /force`/`gpresult /r`

## Reference

- Notion: [Notion document]()

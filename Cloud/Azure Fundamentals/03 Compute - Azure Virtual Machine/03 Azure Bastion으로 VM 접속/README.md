# 03 Compute - Azure Virtual Machine / 03 Azure Bastion으로 VM 접속

Public IP와 포트 노출 없이 VM에 접속하는 Azure Bastion을 두 배포 방식(Developer SKU vs 전용)으로 다루고, 이 시리즈가 왜 무료 Developer SKU를 기본으로 삼는지 정리한다. (SSH 직접 접속 실습은 lab05에서 완료)

## What you will learn

- SSH 키 인증 환기 — 직접 SSH의 전제(Public IP + 22 오픈)가 노출을 만든다
- Azure Bastion — Public IP·포트 노출 없이 RBAC으로 통제되는 접속
- 두 배포 방식 — Developer SKU(공유 풀·무료·서브넷 불필요·1 VM) vs 전용(`AzureBastionSubnet`·과금·다중·네이티브·피어링)
- 시리즈 POV — immutable·VMSS(cattle) 지향이라 개별 SSH가 줄어듦 → Developer SKU가 기본

## Lab

- **lab06: Public IP 없는 VM + Developer Bastion 접속** (`rg-lab06`)
  - Public IP 없는 VM → 직접 SSH 불가 확인 → Developer SKU 브라우저 접속(서브넷·전용 리소스·비용 0)

## Reference

- Draft: `.claude/draft/03.03.claude.notion.md`
- Notion: [Notion 문서]()

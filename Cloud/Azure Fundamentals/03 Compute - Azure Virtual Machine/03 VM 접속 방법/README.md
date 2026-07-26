# 03 Compute - Azure Virtual Machine / 03 VM 접속 방법

VM에 접속하는 두 방법(직접 SSH와 Azure Bastion)을 다룬다. 접속 방법이 곧 VM의 인터넷 노출 표면을 결정한다는 것을 이해한다.

## What you will learn

- SSH 키 인증: 공개키(VM)/개인키(로컬)
- Azure Bastion: Public IP·포트 노출 없이 브라우저로 접속, AzureBastionSubnet(/26+)
- Bastion SKU (Developer / Basic / Standard / Premium)
- 접속 방법과 노출 표면: 직접 SSH(정문 오픈) vs Bastion(비노출)

## Examples

- `lab06` → 직접 SSH 접속, AzureBastionSubnet 생성·Bastion 배포, Bastion으로 접속

## Reference

- Draft: `.claude/draft/03.03.claude.notion.md`
- Notion: [Notion 문서]()

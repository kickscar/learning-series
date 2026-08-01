# 07 Azure Database / 03 VM에서 Database 연결

MySQL Flexible Server를 Private Access(VNet 통합)로 만들고, VM에서 Private DNS Zone을 통해 사설 IP로 연결하는 실습(lab21).

## What you will learn

- Private Access — VNet 위임 서브넷에 사설 IP 주입, 공용 엔드포인트 없음
- Private DNS Zone — 서버 FQDN을 VNet 내 사설 IP로 해석
- Public vs Private 보안 — IP 필터 vs 네트워크 격리

## Lab

- **lab21: VM → MySQL Private 연결** (`rg-lab21`)
  - `vnet-lab21`(VM 서브넷 + DB 위임 서브넷) → `mysql-lab21` Private → Private DNS Zone 확인 → VM `nslookup`·`mysql` 사설 연결

## Reference

- Draft: `.claude/draft/07.03.claude.notion.md`
- Notion: [Notion 문서]()

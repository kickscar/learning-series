# 07 Azure Database / 02 Azure Database for MySQL

MySQL Flexible Server를 Public Access로 만들고 방화벽·Cloud Shell 접속을 확인하는 실습(lab21).

## What you will learn

- 구성 옵션 — 버전, Compute 등급(Burstable `B1ms` / GP / BC), 스토리지, 관리자 계정
- 네트워크 접근 — Public(공용 + 방화벽) vs Private(VNet), **생성 시 택일**
- SSL 강제(TLS 1.2), 방화벽 secure by default

## Lab

- **lab21: MySQL Flexible Server 생성** (`rg-lab21`)
  - `mysql-lab21`(Burstable `B1ms`, 8.0) → Public + 방화벽(내 IP) → Cloud Shell `mysql` 접속

## Reference

- Draft: `.claude/draft/07.02.claude.notion.md`
- Notion: [Notion 문서]()

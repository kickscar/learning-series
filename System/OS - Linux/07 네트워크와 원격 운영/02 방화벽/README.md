# 07 네트워크와 원격 운영 / 02 방화벽

firewalld의 zone 기반 방화벽을 이해하고, firewall-cmd로 서비스·포트 허용 규칙을 관리한다.

## What you will learn

- firewalld: nftables 백엔드, zone 기반 규칙. 기본 존 public(ssh만 허용)
- firewall-cmd: --list-all, --add-service, --add-port, --permanent, --reload
- Runtime vs Permanent: --permanent 저장 → --reload 반영이 표준 절차
- 서비스(--add-service=http) vs 포트(--add-port=8080/tcp) 허용 방식
- 실전: 06.05 Nginx에 호스트 브라우저 접근을 허용하는 시나리오

## Reference

- Notion: [Notion document](https://app.notion.com/p/02-379dc703ccda807e8456fc654a476243?source=copy_link)

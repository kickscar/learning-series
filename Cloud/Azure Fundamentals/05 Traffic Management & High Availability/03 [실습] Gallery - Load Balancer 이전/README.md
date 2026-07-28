# 05 Traffic Management & High Availability / 03 [실습] Gallery: Load Balancer 이전

04.08에서 Private Subnet에 격리된 Gallery를 Public Load Balancer 뒤에 넣어, VM에 Public IP 없이 외부 노출을 여는 Gallery 실습.

## What you will learn

- Public IP 없는 Private Subnet VM을 Public LB로 노출 — VM 대신 서비스만 노출(진짜 private 패턴)
- LB Rule 포트 매핑 — 프런트 `80` → 백엔드 `8080`
- Health Probe로 앱의 `/actuator/health` 활용(앱 수준 건강 검사)
- Private Subnet 백엔드 NSG에 `Internet` 소스 `8080` 직접 허용

## Lab (Gallery)

- `rg-gallery` 누적. `lb-gallery`(Standard Public) 프런트엔드 `pip-gallery-lb` → 백엔드 `vm-gallery-web:8080`
- 04.08의 "외부 접속 불가"가 해소됨

## Reference

- Draft: `.claude/draft/05.03.claude.notion.md`
- Notion: [Notion 문서]()

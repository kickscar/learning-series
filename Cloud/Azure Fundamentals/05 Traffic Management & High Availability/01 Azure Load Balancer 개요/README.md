# 05 Traffic Management & High Availability / 01 Azure Load Balancer 개요

04.08에서 격리된 Gallery를 외부에 노출하는 실마리, Load Balancer를 잡는 이론 섹션. 앞단에서 받아 여러 VM에 분산하는 구조와 L4(LB)/L7(AGW) 구분, SKU를 이해한다.

## What you will learn

- Load Balancer — 프론트엔드 하나로 받아 백엔드 풀에 분산(VM은 Public IP 없이). Frontend IP·Backend Pool·Health Probe·LB Rule
- L4 vs L7 — Load Balancer(IP·포트, 저지연) vs Application Gateway(URL·헤더, SSL·WAF)
- Public vs Internal LB, SKU(Basic 은퇴 → Standard secure by default)
- AWS 대응 — LB↔NLB, AGW↔ALB

## Reference

- Draft: `.claude/draft/05.01.claude.notion.md`
- Notion: [Notion 문서]()

# 05 Traffic Management & High Availability / 03 프로비저닝 자동화 - bake vs provision

LB가 "여러 백엔드"를 부른다 — 그 인스턴스를 어떻게 재현하나. 두 방식 **bake**(이미지에 미리 구움)와 **provision**(부팅 때 설치)을 정면 비교하는 섹션. bake(골든 이미지)를 직접 구워 Gallery를 이미지로 만들고(다음 "Gallery Load Balancer 이전"이 이 이미지로 2대를 띄운다), provision(cloud-init)은 "Gallery VM Scale Set 적용"에서 몸으로 겪는다.

## What you will learn

- bake — 골든 이미지(Compute Gallery), generalize(`waagent -deprovision`)·capture, 즉시·불투명·재현 빠름
- provision — cloud-init(Custom Data), 부팅 때 설치, 투명·느림·유연·외부 의존(NAT)
- 정면 비교 — 안정 재현이면 bake, 설정 변화면 provision(속도↔유연성). 상황이 고른다
- generalized vs specialized, Managed Image vs Azure Compute Gallery

## Lab

- **lab12: 골든 이미지화 (Azure Compute Gallery)** — `vm-gallery-web` generalize·capture → `gal_gallery`/`img-gallery-web`/`1.0.0`, 테스트 VM으로 검증. 이미지는 다음 "Gallery Load Balancer 이전"이 **2대를 스핀업하는 배포 원천**으로 유지

## Reference

- Draft: `.claude/draft/05.03.claude.notion.md`
- Notion: [Notion 문서]()

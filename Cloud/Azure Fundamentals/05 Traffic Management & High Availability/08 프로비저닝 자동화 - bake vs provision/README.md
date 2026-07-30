# 05 Traffic Management & High Availability / 08 프로비저닝 자동화 - bake vs provision

VMSS가 인스턴스를 어떻게 앱 갖춘 채로 띄우나 — 두 방식 **bake**(이미지에 미리 구움)와 **provision**(부팅 때 설치)을 정면 비교하는 섹션. bake(골든 이미지)를 직접 구워 보고, provision(cloud-init)은 다음 Gallery VMSS에서 몸으로 겪는다.

## What you will learn

- bake — 골든 이미지(Compute Gallery), generalize(`waagent -deprovision`)·capture, 즉시·불투명·스케일 빠름
- provision — cloud-init(Custom Data), 부팅 때 설치, 투명·느림·외부 의존(NAT)
- 정면 비교 — 무거운 준비는 bake, 가벼운 설정은 provision. VMSS는 둘 다 지원
- generalized vs specialized, Managed Image vs Azure Compute Gallery

## Lab

- **lab08: 골든 이미지화 (Azure Compute Gallery)** — `vm-gallery-web` generalize·capture → `gal_gallery`/`img-gallery-web`/`1.0.0`, 테스트 VM으로 검증. 이미지는 다음 섹션 provision과 대조하는 **bake 기준**으로 유지

## Reference

- Draft: `.claude/draft/05.08.claude.notion.md`
- Notion: [Notion 문서]()

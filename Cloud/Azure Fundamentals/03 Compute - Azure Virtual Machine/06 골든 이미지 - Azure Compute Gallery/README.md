# 03 Compute - Azure Virtual Machine / 06 골든 이미지 (Azure Compute Gallery)

수동 배포한 Gallery VM을 재사용 가능한 골든 이미지로 굽는 섹션. generalize로 머신 고유값을 지우고 Azure Compute Gallery에 캡처한 뒤, 그 이미지에서 VM을 띄우면 앱이 이미 설치된 채 뜬다. 매뉴얼 배포(03.05)의 수고를 한 번으로 끝내는 bake 방식.

## What you will learn

- 골든 이미지(bake) 개념 — 구성 끝난 VM을 재사용 템플릿으로
- generalize(`waagent -deprovision`)와 generalized vs specialized
- Managed Image vs Azure Compute Gallery (버전·복제, 표준)
- bake vs provision(cloud-init) 대비 — Ch05 VMSS 복선

## Examples

- `lab08` → `vm-web` generalize·capture → Compute Gallery(`gal_gallery` / `img-web` / `1.0.0`), 이미지에서 `vm-test` 스핀업 확인

## Reference

- Draft: `.claude/draft/03.06.claude.notion.md`
- Notion: [Notion 문서]()

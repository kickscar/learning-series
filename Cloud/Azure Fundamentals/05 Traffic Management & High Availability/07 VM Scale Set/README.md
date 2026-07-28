# 05 Traffic Management & High Availability / 07 VM Scale Set

Flexible VMSS를 만들어 cloud-init으로 프로비저닝하고 CPU 기반 오토스케일을 거는 실습(lab16). bake(골든 이미지) vs provision(cloud-init) 선택이 이 챕터의 축으로 등장한다.

## What you will learn

- VMSS — 동일 인스턴스 묶음 자동 관리, LB 백엔드 자동 등록/해제, Flexible orchestration(기본)
- **bake**(골든 이미지, 빠름·불변) vs **provision**(cloud-init, 유연·느림) — VMSS는 둘 다 지원
- cloud-init / Custom Data — `packages`·`runcmd` 슬롯에 provision 정의
- CPU 기반 오토스케일(평균·평가시간), scale-out/scale-in 규칙, VMSS↔AWS ASG

## Lab

- **lab16: VM Scale Set 생성 및 자동 스케일링** (`rg-lab16`)
  - Flexible VMSS + cloud-init(nginx) + LB → 오토스케일(min 2 / max 5) → 부하 → scale-out 확인

## Reference

- Draft: `.claude/draft/05.07.claude.notion.md`
- Notion: [Notion 문서]()

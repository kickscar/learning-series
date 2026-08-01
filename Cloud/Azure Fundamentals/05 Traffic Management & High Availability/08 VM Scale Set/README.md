# 05 Traffic Management & High Availability / 08 VM Scale Set

Flexible VMSS를 만들어 cloud-init(provision)으로 인스턴스를 준비하고 CPU 기반 오토스케일을 거는 실습(lab15). 인스턴스 준비(bake vs provision)는 "프로비저닝 자동화"에서 봤고, 이 섹션은 개수를 자동화하는 VMSS 자체에 집중한다.

## What you will learn

- VMSS — 동일 인스턴스 묶음 자동 관리, LB 백엔드 자동 등록/해제, Flexible orchestration(기본)
- 인스턴스 준비 = provision(cloud-init) — bake와의 비교는 "프로비저닝 자동화"에서, VMSS는 둘 다 지원
- CPU 기반 오토스케일(평균·평가시간), scale-out/scale-in 규칙
- VMSS ↔ AWS ASG(+ VM 모델 = Launch Template)

## Lab

- **lab15: VM Scale Set 생성 및 자동 스케일링** (`rg-lab15`)
  - Flexible VMSS + cloud-init(nginx) + LB → 오토스케일(min 2 / max 5) → 부하 → scale-out 확인

## Reference

- Draft: `.claude/draft/05.08.claude.notion.md`
- Notion: [Notion 문서]()

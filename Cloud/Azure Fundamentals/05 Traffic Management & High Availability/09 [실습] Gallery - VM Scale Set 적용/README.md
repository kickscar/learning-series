# 05 Traffic Management & High Availability / 09 [실습] Gallery - VM Scale Set 적용

Gallery의 두 VM을 VMSS로 전환하며 인스턴스를 cloud-init(provision)으로 올리는 Ch05 대미. "프로비저닝 자동화"의 bake로 안정 구간을 굴렸고, 여기서 provision으로 전환하는 이유(곧 바뀔 설정)와 그 대가(빌드 무게)를 함께 겪는다.

## What you will learn

- 두 VM(`vm-gallery-web-1/-2`) → `vmss-gallery-web`(Flexible), AGW 백엔드 풀 교체(인스턴스 자동 등록)
- 왜 여기서 provision인가 — 곧 Ch06(Blob)·Ch07(MySQL)로 설정이 바뀔 참이라 재굽기 없는 유연성 선택(속도↔유연성, "프로비저닝 자동화"의 축)
- 그 대가 — `cloud-init.yaml`이 인스턴스마다 JDK 설치 + Maven 빌드(수 분), NAT Gateway 아웃바운드 필수
- VMSS 모델 변경 = rolling upgrade(AWS instance refresh 대응, Flex 이미지 자동교체는 preview)

## Lab (Gallery)

- `rg-gallery` 누적. `vmss-gallery-web`(Flexible, cloud-init) → `agw-gallery` 백엔드 연동 → 백엔드 상태 `Healthy` 대기 → 검증. 전환 후 두 정적 VM 삭제, `img-gallery-web`(bake 산출물)은 유지

## Examples

- `cloud-init.yaml` — Gallery Spring Boot provision 스크립트(packages·write_files·runcmd)

## Reference

- Draft: `.claude/draft/05.09.claude.notion.md`
- Notion: [Notion 문서]()

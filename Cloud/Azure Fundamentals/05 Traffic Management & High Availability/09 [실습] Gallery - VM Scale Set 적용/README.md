# 05 Traffic Management & High Availability / 09 [실습] Gallery - VM Scale Set 적용

Gallery의 단일 VM을 VMSS로 전환하며, 인스턴스를 cloud-init(provision)으로 올려 앞 섹션의 골든 이미지(bake)와 나란히 비교하는 Ch05 대미.

## What you will learn

- 단일 `vm-gallery-web` → `vmss-gallery-web`(Flexible), AGW 백엔드 풀 교체(인스턴스 자동 등록)
- 같은 Gallery 앱으로 **bake(프로비저닝 섹션) vs provision(이번 섹션)** 몸으로 비교
- `cloud-init.yaml` — 인스턴스마다 JDK 설치 + Maven 빌드(수 분), NAT Gateway 아웃바운드 필수
- provision의 대가(느린 스케일 아웃) → 무거운 준비는 bake로. **VMSS 모델 변경 = rolling upgrade**(AWS instance refresh 대응, Flex 이미지 자동교체는 preview)

## Lab (Gallery)

- `rg-gallery` 누적. `vmss-gallery-web`(Flexible, cloud-init) → `agw-gallery` 백엔드 연동 → 백엔드 상태 `Healthy` 대기 → 검증. `img-gallery-web`(bake 아티팩트)은 비교 근거로 유지

## Examples

- `cloud-init.yaml` — Gallery Spring Boot provision 스크립트(packages·write_files·runcmd)

## Reference

- Draft: `.claude/draft/05.09.claude.notion.md`
- Notion: [Notion 문서]()

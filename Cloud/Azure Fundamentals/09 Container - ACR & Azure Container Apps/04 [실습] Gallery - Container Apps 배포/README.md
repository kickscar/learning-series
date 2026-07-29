# 09 Container - ACR & Azure Container Apps / 04 [실습] Gallery: Container Apps 배포

Gallery를 컨테이너로 재플랫폼(ACR + Container Apps, Blob·MySQL 환경변수)해 VM 배포와 비교하는 **시리즈 대미**.

## What you will learn

- 재플랫폼이 쉬운 이유 — 상태(파일·DB)를 밖에 빼둬 앱이 stateless(06.06·07.04)
- Gallery 이미지 빌드 → ACR, Container Apps Environment(`vnet-gallery` 통합)
- Blob(Managed Identity)·MySQL(env) 연결, 외부 Ingress
- VM 스택 vs Container Apps 비교, 다음 여정(../Container)

## Lab (Gallery)

- `rg-gallery`. `crgallery`(이미지) → `cae-gallery`(VNet 통합) → `ca-gallery`(Blob·MySQL env, MI) → 외부 URL

## Examples

- 앱 소스: `Cloud/Workloads/gallery-spring-boot` — Dockerfile(`--build-arg application=gallery`)

## Reference

- Draft: `.claude/draft/09.04.claude.notion.md`
- Notion: [Notion 문서]()

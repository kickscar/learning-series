# 09 Container - ACR & Azure Container Apps / 02 ACR - 이미지 빌드와 푸시

Azure Container Registry를 만들고 ACR Tasks(클라우드 빌드)로 이미지를 빌드·푸시하는 실습(lab24).

## What you will learn

- ACR — 컨테이너 이미지 전용 레지스트리(`{name}.azurecr.io/{image}:{tag}`)
- SKU — Basic / Standard / Premium (데이터 플레인 동일, 고급 기능 차이)
- 인증 — Admin 계정(기본 비활성, 테스트만) vs Entra ID(기본·권장, AcrPush/AcrPull)
- 빌드 — 로컬 Docker vs **ACR Tasks**(`az acr build`, 클라우드 빌드)

## Lab

- **lab24: ACR 생성 및 이미지 빌드/푸시** (`rg-lab24`)
  - `crlab24`(Basic) → Cloud Shell `az acr build` → Repositories 확인

## Reference

- Draft: `.claude/draft/09.02.claude.notion.md`
- Notion: [Notion 문서]()

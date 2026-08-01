# 09 Container - ACR & Azure Container Apps / 03 Azure Container Apps 배포

ACR 이미지를 Azure Container Apps로 서버리스 배포하고, 외부 Ingress로 공개 URL 접근을 확인하는 실습(lab25).

## What you will learn

- 구조 — Environment(경계) → Container App → Revision(불변 스냅샷) → Replica
- Ingress — 외부(공개 HTTPS·자동 TLS) / 내부, target port
- 환경 변수·Secrets, ACR 풀 = Managed Identity(키 없이)
- 스케일 — HTTP 요청 기반, scale-to-zero / Revision(single·multiple)

## Lab

- **lab25: Azure Container Apps 배포** (`rg-lab25`)
  - `cae-lab25` Environment → `ca-lab25`(ACR 이미지, 외부 Ingress) → URL 접근

## Reference

- Draft: `.claude/draft/09.03.claude.notion.md`
- Notion: [Notion 문서]()

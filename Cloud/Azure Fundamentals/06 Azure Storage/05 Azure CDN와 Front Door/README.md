# 06 Azure Storage / 05 Azure CDN & Front Door

CDN(엣지 캐싱)의 개념과 Azure 현행 제품 Front Door를 이해하고, Blob을 origin으로 Front Door를 붙여 캐시 hit/miss를 확인하는 실습(lab20).

## What you will learn

- CDN — 엣지 캐싱으로 지연↓·origin 부하↓
- 현행 제품 — 클래식 CDN 은퇴(Edgio 2025-01-15) → **Azure Front Door Standard/Premium**(CDN + 글로벌 L7 + WAF)
- Front Door vs Application Gateway — 글로벌 엣지 L7 vs 리전 L7
- 캐싱 — origin·TTL·hit/miss (`X-Cache` 헤더)

## Lab

- **lab20: Front Door로 Blob 콘텐츠 전송** (`rg-lab20`)
  - `stlab20` 정적 웹사이트 origin → `afd-lab20`(Standard) → hit/miss 확인

## Reference

- Draft: `.claude/draft/06.05.claude.notion.md`
- Notion: [Notion 문서]()

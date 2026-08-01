# 05 Traffic Management & High Availability / 06 [실습] Gallery: Application Gateway 전환

Gallery 앞단을 L4 Load Balancer에서 L7 Application Gateway로 무중단 교체하고, L7 전환으로 백엔드 보안 규칙까지 조이는 Gallery 실습.

## What you will learn

- L4 → L7 진입 계층 교체 — `lb-gallery` 제거, `agw-gallery`(`snet-gallery-pub` 전용 서브넷)
- 두 VM(`vm-gallery-web-1/-2`)은 그대로, 앞단만 교체(포트 80 → 8080 매핑 유지)
- AGW도 두 백엔드에 분산 — 푸터 `Instance:` 교차로 확인(진입만 L7으로 바뀜)
- `/actuator/health` 사용자 지정 프로브 연결
- L7 보안 이점 — 리버스 프록시라 백엔드 NSG의 `Internet` 8080 규칙을 제거 가능

## Lab (Gallery)

- `rg-gallery` 누적. `agw-gallery`(`Standard_v2`) 생성 → 검증(분산) → `lb-gallery` 제거 → `nsg-gallery-web` 조이기
- 무중단 전환 순서(새 경로 세우고 옛 경로 제거)

## Reference

- Draft: `.claude/draft/05.06.claude.notion.md`
- Notion: [Notion 문서]()

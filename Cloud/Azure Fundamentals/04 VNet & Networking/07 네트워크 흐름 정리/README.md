# 04 VNet & Networking / 07 네트워크 흐름 정리

Ch04에서 쌓은 네트워크를 한 그림으로 모으고 트래픽 경로를 정리하는 종합 섹션. "보이는 게 네 설계, 안 보이는 자동 배관은 플랫폼 몫"이라는 인프라 읽기 감각을 짚고, Ch05(Load Balancer)로 브릿지한다.

## What you will learn

- Ch04 전체 네트워크 한 그림 — VNet/서브넷/NSG/Bastion/NAT GW/엔드포인트
- 트래픽 3경로 — 공개 인바운드(Public IP+NSG), 관리 인바운드(Bastion), 아웃바운드(NAT GW). 들어오기·나가기는 독립 조각
- 이름 붙인 게 내 설계, 안 보이는 배관은 플랫폼 몫 (Ch03 자동 → Ch04 직접 설계)
- 남은 질문 → Load Balancer(Ch05): 여러 VM 분산 + 노출 줄이기

## Reference

- Draft: `.claude/draft/04.07.claude.notion.md`
- Notion: [Notion 문서]()

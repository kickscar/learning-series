# 04 VNet & Networking / 06 네트워크 흐름 정리

Ch04에서 쌓은 네트워크를 한 그림으로 모아, **그 흐름을 만든 게 서브넷이 아니라 그 위에 얹은 자원·정책 리소스였음**을 되짚는 종합 섹션(이론). Ch05(Load Balancer)로 브릿지한다.

## What you will learn

- Ch04 전체 네트워크 한 그림 — Virtual Network/Subnet/NSG/Bastion/NAT Gateway (일반화, 트래픽 흐름 렌즈)
- 두 흐름 — 관리 인바운드(Bastion), 아웃바운드(NAT GW). NSG가 양방향 판정, 바깥→워크로드 **서비스 인바운드는 아직 없음**
- **흐름을 만든 건 서브넷이 아니다** — 격리=Public IP 없음, 접근제어=NSG, 접속=Bastion, 아웃바운드=NAT GW. 서브넷은 IP·정책 스코프였을 뿐(안 하는 것 하나 더: 가용성 → Ch05)
- 이름 붙인 게 내 설계, 안 보이는 배관은 플랫폼 몫 (Ch03 자동 → Ch04 직접 설계)
- 남은 질문 → Load Balancer(Ch05): **서비스 인바운드라는 빈 방향**을 연다(여러 VM 분산 + 노출 감소)

## Reference

- Draft: `.claude/draft/04.06.claude.notion.md`
- Notion: [Notion 문서]()

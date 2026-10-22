# 09 미니 데이터센터 완성 / 01 아키텍처 리뷰

Ch04~Ch07에서 점진적으로 구축한 미니 데이터센터의 전체 아키텍처를 정리한다. 09.02 완성 단계에서 추가할 것을 확인한다. 이론 전용.

## What you will learn

- 3종 네트워크 분리: NAT(인터넷) / Host-Only(관리) / Internal(서브넷)
- RFC 1918 세 대역(10.x, 172.16.x, 192.168.x) 활용 현황
- VM별 NIC·IP·설정 현황 (router-vm, web-vm, db-vm)
- 구축 타임라인: 04.03 네트워크 → 04.05 라우팅 → 07.02 방화벽 → 07.04 NAT
- 현재 통신 상태 점검과 09.02에서 완성할 것

## Reference

- Notion: [Notion document]()

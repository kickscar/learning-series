# 04 네트워크 계층 / 03 [실습] 미니 데이터센터: 네트워크 설계와 구현

미니 데이터센터의 첫 번째 단계. 전체 아키텍처와 네트워크 모드를 개괄하고, 두 서브넷을 ipcalc로 설계·검증한다.

## What you will learn

- 미니 데이터센터 전체 아키텍처와 3종 네트워크 모드 (NAT·Host-Only·Internal)
- 네트워크 분리: 인터넷 / 관리(management plane) / 데이터(data plane)
- VM별 NIC 구성 개괄 (router-vm 4 NIC, web-vm·db-vm 3 NIC)
- ipcalc로 서브넷 계산·검증 (`172.16.1.0/24`, `172.16.2.0/24`)
- 주소 계획 (router-vm `.1` 게이트웨이, web-vm·db-vm `.10`)
- Internal Network 개념 (완전 격리망, 실제 생성은 04.05)

> 이 섹션의 실제 실습은 서브넷 설계 + ipcalc 검증이다. VM 생성·NIC 설정·Internal Network 구성은 04.05에서 수행한다.

## 미니 데이터센터 진행

```
✓ 04.03 네트워크 설계와 구현 ← 현재
  04.05 라우팅
  07.02 방화벽
  07.04 NAT
  08.03 장애 진단
  09.02 완성
```

## Reference

- Notion: [Notion document]()

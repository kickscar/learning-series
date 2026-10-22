# 04 네트워크 계층 / 05 [실습] 미니 데이터센터: 라우팅

미니 데이터센터에 router-vm을 추가하여 서브넷 간 라우팅을 구성한다.

## What you will learn

- router-vm 생성 (Host-Only×2, NAT 없음, 순수 라우터)
- IP Forwarding 활성화
- web-vm/db-vm에 ip route add로 경로 추가
- 서브넷 간 통신 확인 (04.03의 "unreachable" 해결)
- TTL 감소 관찰 (1홉)
- tcpdump로 router-vm 포워딩 관찰

## 미니 데이터센터 진행

```
  ✓ 04.03 네트워크 설계와 구현
  ✓ 04.05 라우팅 ← 현재
    07.02 방화벽
    07.04 NAT
    08.03 장애 진단
    09.02 완성
```

## Reference

- Notion: [Notion document]()

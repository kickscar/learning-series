# 07 보안과 트래픽 관리 / 02 [실습] 미니 데이터센터: 방화벽

미니 데이터센터의 web-vm에 nftables 방화벽을 적용한다. drop/reject 차이를 tcpdump로 관찰.

## What you will learn

- nftables 규칙 적용 (policy drop + SSH/HTTP/ICMP accept)
- drop: SYN 반복, 응답 없음, 타임아웃
- reject: 즉시 Connection refused (ICMP 에러)
- ct state established,related accept (상태 기반)

## 미니 데이터센터 진행

```
  ✓ 04.03 네트워크 설계와 구현
  ✓ 04.05 라우팅
  ✓ 07.02 방화벽 ← 현재
    07.04 NAT
    08.03 장애 진단
    09.02 완성
```

## Reference

- Notion: [Notion document]()

# 07 보안과 트래픽 관리 / 04 [실습] 미니 데이터센터: NAT

미니 데이터센터의 router-vm에 MASQUERADE를 적용한다. 사설 서브넷의 db-vm이 인터넷에 접근하는 과정을 tcpdump로 관찰.

## What you will learn

- router-vm에 NAT NIC 추가, 인터넷 경로 확보
- nftables MASQUERADE 설정 (oifname masquerade)
- db-vm 기본 경로를 router-vm으로 변경 (사설 서브넷 → 외부)
- tcpdump 양쪽 캡처로 NAT 전후 Source IP 변환 관찰
  - enp0s9 (NAT 전): 172.16.2.10
  - enp0s10 (NAT 후): 10.0.2.15

## 미니 데이터센터 진행

```
  ✓ 04.03 네트워크 설계와 구현
  ✓ 04.05 라우팅
  ✓ 07.02 방화벽
  ✓ 07.04 NAT ← 현재
    08.03 장애 진단
    09.02 완성
```

## Reference

- Notion: [Notion document]()

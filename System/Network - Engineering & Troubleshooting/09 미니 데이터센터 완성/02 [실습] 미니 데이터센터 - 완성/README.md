# 09 미니 데이터센터 완성 / 02 [실습] 미니 데이터센터: 완성

미니 데이터센터의 마지막 단계. web-vm의 Nginx를 노출하고, /etc/hosts로 이름 해석을 설정하고, 전체 통신 경로를 tcpdump로 검증한다.

## What you will learn

- web-vm Nginx 동작 확인 (port 8080)
- /etc/hosts로 VM 간 이름 해석 설정
- 호스트에서 Host-Only 경유로 web-vm HTTP 접근
- 전체 통신 경로 최종 검증 (서브넷 간 라우팅 / NAT / 차단)
- tcpdump로 라우팅 포워딩과 NAT 변환 관찰

## 미니 데이터센터 진행

```
  ✓ 04.03 네트워크 설계와 구현
  ✓ 04.05 라우팅
  ✓ 07.02 방화벽
  ✓ 07.04 NAT
  ✓ 08.03 장애 진단
  ✓ 09.02 완성 ← 현재
```

미니 데이터센터 완성.

## Reference

- Notion: [Notion document]()

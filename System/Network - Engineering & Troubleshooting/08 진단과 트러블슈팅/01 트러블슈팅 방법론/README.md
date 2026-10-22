# 08 진단과 트러블슈팅 / 01 트러블슈팅 방법론

학습은 Top-Down, 진단은 Bottom-Up. 증상은 상위 계층에서 나타나지만 원인은 어느 계층에든 있다. 아래에서 위로 확인하며 근본 원인을 좁힌다. 이론 전용.

## What you will learn

- 왜 Bottom-Up인가: 하위 계층이 정상이어야 상위 계층이 동작
- Divide and Conquer: ping(L3)에서 시작해 방향 결정
- 계층별 체크리스트: L1(`ip link`) → L2(`ip neigh`) → L3(`ping`, `ip route`) → L4(`ss`, `nc`, `nft`) → L7(`systemctl`, `curl`, `dig`)
- 핵심 패턴: Connection refused(서비스 없음) vs timed out(방화벽 DROP)
- tcpdump = 궁극적 진실. 양쪽 동시 캡처로 패킷 소실 지점 특정
- 체계적 접근: 한 번에 하나만 변경, 기록, 롤백 전략

## Reference

- Notion: [Notion document]()

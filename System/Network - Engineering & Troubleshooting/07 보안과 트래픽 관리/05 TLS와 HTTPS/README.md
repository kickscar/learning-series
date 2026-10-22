# 07 보안과 트래픽 관리 / 05 TLS와 HTTPS

TLS가 통신을 암호화하는 원리(대칭/비대칭 암호화, 인증서/CA, handshake)를 다루고, HTTP와 HTTPS를 패킷 캡처로 비교한다. 02.01에서 본 HTTP 평문의 위험을 TLS가 어떻게 해결하는지 확인한다.

## What you will learn

- 대칭 암호화 vs 비대칭 암호화, TLS가 둘을 결합하는 방식 (비대칭으로 키 교환 → 대칭으로 데이터)
- 인증서와 CA, 신뢰 체인, 자체 서명 인증서 (암호화 O, 신원 검증 X)
- TLS handshake: TCP 연결(03.01) 위에서 동작, TLS 1.3은 1-RTT이며 ServerHello 이후 암호화
- TLS 1.2 vs 1.3 차이 (RTT, 인증서 암호화)
- HTTP(평문) vs HTTPS(암호화)의 패킷 관점 차이

## Examples

- `lab01` → `openssl` 자체 서명 인증서 생성, nginx HTTPS(443) 설정, HTTP(평문)와 HTTPS(암호화) 캡처 비교

## Reference

- Notion: [Notion document]()

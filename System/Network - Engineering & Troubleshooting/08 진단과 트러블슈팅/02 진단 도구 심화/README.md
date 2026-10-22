# 08 진단과 트러블슈팅 / 02 진단 도구 심화

시리즈 전반에서 만난 진단 도구(tcpdump/Wireshark, ss)를 심화하고, 새 도구 mtr·nc·nmap을 더한다. 같은 도구를 더 깊이 쓰면 진단 해상도가 올라간다.

## What you will learn

- tcpdump 고급 필터: `and`/`or`/`not` 복합, `src`/`dst` 방향, `-w`/`-r` 저장·읽기 (01.03 심화)
- Wireshark 워크플로우: Follow TCP Stream(연결 대화 재구성), Statistics
- ss 심화: `state established` 상태 필터, `-o` 타이머, `-s` 요약 (03.03 심화)
- mtr(신규): ping+traceroute 결합 실시간 경로 분석. report 모드(`-rwzbc`)로 홉별 손실률·지연 통계
- nc(신규): 특정 포트 연결 테스트(`nc -zv`). `Connected`/`refused`(서비스 없음)/`timeout`(방화벽) 해석 (08.01 연결)
- nmap: 네트워크 관점 포트 스캔(`-sT`/`-sS`), 서비스·버전 감지(`-sV`)

## Examples

- `lab01` → tcpdump 복합 필터로 .pcap 저장 → Wireshark Follow TCP Stream → ss·mtr 점검 → nc 포트 연결 테스트 → nmap 포트 스캔, `ss -tlnp`와 비교

## Reference

- Notion: [Notion document]()

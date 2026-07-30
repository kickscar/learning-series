# 03 Compute - Azure Virtual Machine / 04 [실습] Gallery - Azure VM 기본 배포

Gallery Spring Boot 앱을 Azure VM에 처음 배포하는 시리즈 실습(Ch03 캡스톤). Public IP 하나에 SSH(22)도 앱(8080)도 다 열어놓고 손으로 배포하는 **가장 순진한** 배포다. 앱·H2·업로드가 VM 하나에 얹힌 All-in-One에서 출발하며, 이 "다 노출한 상태"를 Ch04가 잠근다.

## What you will learn

- Gallery 공용 RG(`rg-gallery`): 삭제 없이 챕터 넘어 누적
- **PIP + SSH로 수동 배포**: JDK → 소스 sparse-checkout·빌드 → systemd 등록·시작
- SSH(22)·앱(8080) 둘 다 인터넷에 열린 순진 노출 — Ch04가 잠근다(Private·Bastion·NSG·NAT)
- 브라우저로 `http://{vm-gallery-web-ip}:8080` 접속 확인

## Examples

- 수동 배포 명령 (draft 내 bash 블록): `apt install openjdk-21-jdk`, sparse-checkout, `./mvnw` 빌드, systemd 유닛 등록

## Reference

- Draft: `.claude/draft/03.04.claude.notion.md`
- Notion: [Notion 문서]()

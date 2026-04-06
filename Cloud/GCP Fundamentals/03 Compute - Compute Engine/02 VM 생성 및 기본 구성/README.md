# 03 Compute - Compute Engine / 02 VM 생성 및 기본 구성

VM 생성 옵션(Region/Zone, Machine Type, Boot Disk)을 이해하고, Network Tag와 Firewall Rule을 연결해 외부에서 접근 가능한 기본 VM 환경을 직접 구성한다.

## What you will learn

- VM 생성 옵션 — Region/Zone 선택 기준, Machine Type(e2-medium), Boot Disk 이미지와 디스크 유형
- External IP 유형 — Ephemeral(임시)과 Static(고정)의 차이와 사용 시점
- Network Tag 기반 Firewall Rule 동작 방식 — AWS Security Group과의 차이
- VM 직렬 포트 출력(Serial Port Output)으로 부팅 로그 확인하는 방법

## Examples

- `[실습] lab05`: Ubuntu 22.04 VM 생성, Network Tag 부여, Firewall Rule 생성(TCP 22/8080), 상태 확인

## Reference

- Draft: `.claude/draft/03.02.claude.notion.md`
- Notion: [Notion 문서]()

# 03 Compute - Azure Virtual Machine / 02 VM 생성 및 기본 구성

Azure Portal에서 Ubuntu VM을 직접 생성하며 핵심 설정 옵션을 확인한다.
Public IP(Static), NSG 인바운드 규칙 구성까지 완성해 외부 접속 가능한 VM 환경을 만든다.

## What you will learn

- VM 생성 시 결정해야 하는 핵심 옵션 (Region, Size, 이미지, 인증 방식)
- Standard Public IP(Static) — Secure by default 원칙과 NSG 필수 이유
- NSG가 NIC에 연결되는 구조와 우선순위 기반 규칙 평가
- Boot Diagnostics — VM 접속 불가 시 첫 번째 확인 경로

## Examples

- `lab05` → Ubuntu VM 생성 (Standard_B2s_v2), Public IP Static 할당, NSG SSH 22 인바운드 설정

## Reference

- Draft: `.claude/draft/03.02.claude.notion.md`
- Notion: [Notion 문서]()

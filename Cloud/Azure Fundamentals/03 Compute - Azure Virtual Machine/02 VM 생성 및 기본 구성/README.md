# 03 Compute - Azure Virtual Machine / 02 VM 생성 및 기본 구성

Ubuntu VM을 직접 만들고, Public IP와 NSG로 외부 접속 경로를 여는 섹션. "Public IP가 있는데 왜 접속이 안 되나"의 구조를 이해한다.

## What you will learn

- VM 생성의 핵심 선택: 크기(Bsv2)·이미지(Ubuntu 24.04 Gen2)·SSH 키
- Public IP: Standard SKU·Static·Secure by default(인바운드 기본 차단)
- NSG와 접속: DenyAllInbound 기본 규칙과 SSH 22 명시 허용의 필요
- 부팅 진단(Boot Diagnostics)

## Examples

- `lab05` → vm 생성(Bsv2·Ubuntu 24.04), Public IP(Static), NSG SSH 규칙, 상태 확인

## Reference

- Draft: `.claude/draft/03.02.claude.notion.md`
- Notion: [Notion 문서]()

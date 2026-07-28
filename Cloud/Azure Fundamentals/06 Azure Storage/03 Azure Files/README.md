# 06 Azure Storage / 03 Azure Files

SMB/NFS로 마운트하는 공유 파일시스템 Azure Files를 이해하고, Ubuntu VM에 SMB 공유를 마운트해 파일을 읽고 쓰는 실습(lab18).

## What you will learn

- Files vs Blob — OS가 마운트하는 파일시스템 vs 앱이 API로 다루는 객체
- 프로토콜·성능 — SMB(Standard+Premium) / NFS(Premium 전용), HDD vs SSD
- Linux 마운트 — `cifs-utils`, TCP 445, 계정 키 인증, SMB 3.1.1
- 포털 연결(Connect) 스크립트

## Lab

- **lab18: Azure File Share 생성 및 VM 마운트** (`rg-lab18`)
  - `stlab18` → SMB 공유 `data`(5 GiB) → `vm-lab18` 마운트 → 파일 쓰기/읽기

## Reference

- Draft: `.claude/draft/06.03.claude.notion.md`
- Notion: [Notion 문서]()

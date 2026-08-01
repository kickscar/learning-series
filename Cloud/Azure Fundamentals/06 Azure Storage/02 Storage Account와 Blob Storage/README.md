# 06 Azure Storage / 02 Storage Account와 Blob Storage

Storage Account를 만들고 Private 컨테이너에 파일을 올리며, Blob URL 익명 접근이 왜 막히는지와 정적 웹사이트로는 어떻게 열리는지 확인하는 실습(lab16).

## What you will learn

- Blob 계층 — Storage Account > Container > Blob, 컨테이너 ↔ S3 버킷
- Blob 유형 — Block(파일) / Append(로그) / Page(디스크)
- 접근 이중 잠금 — 계정 익명 OFF(기본) + 컨테이너 Private(기본) = secure by default
- 정적 웹사이트 — `$web` 컨테이너, 전용 웹 엔드포인트 익명 서비스

## Lab

- **lab16: Storage Account 생성 및 Blob 업로드** (`rg-lab16`)
  - `stlab16`(Standard / LRS) → Private 컨테이너 → Blob URL 차단 확인 → 정적 웹사이트 호스팅

## Reference

- Draft: `.claude/draft/06.02.claude.notion.md`
- Notion: [Notion 문서]()

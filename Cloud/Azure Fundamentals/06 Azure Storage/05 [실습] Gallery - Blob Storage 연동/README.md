# 06 Azure Storage / 06 [실습] Gallery: Blob Storage 연동

VMSS Gallery의 업로드 저장소를 인스턴스 로컬에서 Azure Blob으로 옮겨, 인스턴스 간 공유·durable 저장을 확보하는 Ch06 대미.

## What you will learn

- VMSS 로컬 업로드의 문제 — 공유 안 됨·일시성·중복
- 앱 스토리지 추상화 — `app.storage.type=azure-blob` (`AzureBlobImageStorage`)
- Managed Identity + `Storage Blob Data Contributor` RBAC (키 없이, "Storage 접근 제어" 실천)
- 공유 Blob 저장 확인, (선택) Front Door 이미지 가속

## Lab (Gallery)

- `rg-gallery` 누적. `stgallery` + 컨테이너 `gallery`(익명 읽기) → VMSS 관리 ID + RBAC → 앱 config `azure-blob` → 업로드 Blob 확인

## Examples

- 앱 소스: `Cloud/Workloads/gallery-spring-boot` — `AzureBlobImageStorage`(`app.storage.type=azure-blob`)

## Reference

- Draft: `.claude/draft/06.06.claude.notion.md`
- Notion: [Notion 문서]()

# Ch04 State Management / 03 Remote Backend

Local State의 한계를 해결하는 S3 Remote Backend를 구성한다. S3 native locking, backend 마이그레이션, partial config 패턴을 학습한다.

## What you will learn

- S3 backend 구성: `bucket`, `key`, `region`, `encrypt`, `use_lockfile`
- S3 native locking 동작 원리 (`.tflock` 파일, 조건부 쓰기)와 DynamoDB locking deprecated 배경
- `backend` 블록의 변수 참조 제한과 partial config(`-backend-config`) 패턴
- `terraform init -migrate-state`로 Local State → S3 이전 (lineage 유지)
- `-migrate-state` vs `-reconfigure` 차이

## Lab

- **lab01**: State 백엔드용 S3 버킷 생성 (versioning, 퍼블릭 차단, prevent_destroy)
- **lab02**: `backend "s3"` 설정 후 `terraform init -migrate-state`로 로컬 State를 S3로 이전

## Reference

- Notion: [Notion 문서](https://www.notion.so/03-Remote-Backend-343dc703ccda8041bb88d94fcbb99ce3?source=copy_link)

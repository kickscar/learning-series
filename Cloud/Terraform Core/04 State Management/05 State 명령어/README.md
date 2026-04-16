# Ch04 State Management / 05 State 명령어

State를 직접 조작하는 CLI 명령어와 선언형 대안을 다룬다. 04.04 Gallery 인프라를 활용해 리소스 조회, 이름 변경, State 제거, import를 실습한다.

## What you will learn

- `terraform state list` / `state show`로 관리 리소스 조회 및 상세 속성 확인
- `terraform state mv`로 리소스 이름 변경·모듈 이동 시 삭제-재생성 방지 (`-dry-run` 사전 확인)
- `terraform state rm`으로 State에서 제거 (실제 인프라 유지) — 확인 프롬프트 없음 주의
- `terraform import`로 State에서 빠진 리소스를 다시 등록하고 복구
- 선언형 대안: `moved` 블록 (TF 1.1+), `removed` 블록 (TF 1.7+), `import` 블록 (TF 1.5+)

## Lab

- **lab01**: Gallery 인프라의 State를 `state list` / `state show`로 조회
- **lab02**: Gallery `aws_instance.web` 이름 변경(`state mv`) → `state rm`으로 제거 → plan에서 중복 생성 문제 확인
- **lab03**: `import`로 실행 중인 Gallery 인스턴스를 원래 이름으로 복구 → "No changes" 달성

## Reference

- Notion: [Notion 문서](https://www.notion.so/05-State-343dc703ccda80bf8c30cf73d672ffb8?source=copy_link)

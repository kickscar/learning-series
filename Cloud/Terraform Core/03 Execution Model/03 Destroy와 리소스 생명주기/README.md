# Ch03 Execution Model / 03 Destroy와 리소스 생명주기

리소스의 삭제와 교체를 제어하는 `lifecycle` 블록을 다룬다. `create_before_destroy`, `prevent_destroy`, `ignore_changes`, `replace_triggered_by` 네 가지 인수와 `terraform apply -replace` 명령을 학습한다.

## What you will learn

- `create_before_destroy`로 교체 시 다운타임 제거 (`+/-` plan 기호)와 고유 이름 제약
- `prevent_destroy`로 실수 삭제 방지 — 전체 destroy plan 거부 메커니즘
- `ignore_changes`로 외부 시스템이 변경한 인수를 Terraform이 무시하는 방법
- `replace_triggered_by`로 참조 리소스 변경 시 강제 교체 트리거
- `terraform apply -replace`로 deprecated된 `taint`를 대체하는 강제 교체 패턴

## Lab

- **lab01**: Security Group에 lifecycle 옵션을 단계별로 적용하며 `prevent_destroy` 차단, `ignore_changes` 태그 무시, `create_before_destroy` 교체 순서, `-replace` 강제 교체를 직접 확인

## Reference

- Notion: [Notion 문서](https://www.notion.so/03-Destroy-Resource-Lifecycle-343dc703ccda80b9b9a1cda909cada82?source=copy_link)

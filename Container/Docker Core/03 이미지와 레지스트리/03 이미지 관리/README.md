# 03 이미지와 레지스트리 / 03 이미지 관리

장비에 쌓인 로컬 이미지를 관리하는 방법을 정리한다. 이미지를 삭제할 때의 규칙과 이름 없이 남는 이미지를 정리하고, 디스크 사용량을 확인해 정리 명령의 범위를 판단한다. 이미지를 파일로 반출하고 반입하는 두 명령 쌍을 구분하고, `docker container commit` 의 한계와 이미지 저장소를 전환할 때의 동작을 다룬다.

## What you will learn

- `image ls` 의 필터(`-a`, `dangling`, `reference`, `-q`)와 `image rm` 에 이름과 이미지 ID를 지정할 때의 차이
- 컨테이너가 사용하는 이미지의 삭제 거부(`must be forced`, `cannot be forced`)와 이름 없는 이미지(`<untagged>`)
- `system df` 의 `TOTAL`, `ACTIVE`, `RECLAIMABLE` 과 `image prune`, `system prune` 의 삭제 범위
- `save` / `load` 와 `export` / `import` 의 차이(이름, 레이어 수, 기본 명령, 이력)
- `commit` 의 재현성 한계와 이미지 저장소 전환 시 보이지 않는 이미지

## Examples

- `lab01` → 정리와 용량 (사용 중인 이미지의 삭제 거부, 이름 없는 이미지, 정리 명령의 확인 프롬프트, 정리 전후의 `system df`)
- `lab02` → 이미지 반출과 반입 (`save` / `load`, `export` / `import`, 두 방식의 비교)

## Source

- `once-worker/` → `dkrcore/once-worker:1.0` 이미지 소스, lab02

## Reference

- Notion: [Notion 문서]()

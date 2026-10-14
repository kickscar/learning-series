# 02 컨테이너 실행과 생명주기 / 03 컨테이너 로그 · 파일 · 삭제 관리

실행 중이거나 종료된 컨테이너의 로그와 파일 변경을 조회하는 방법, 컨테이너와 호스트 사이에서 파일을 복사하는 방법을 정리한다. 컨테이너의 삭제 옵션과 일괄 정리 방법을 다루고, 컨테이너를 삭제할 때 함께 삭제되는 것을 정리한다.

## What you will learn

- 로그의 출처(표준 출력, 표준 오류)와 `logs` 의 조회 옵션(`--tail`, `--since`, `--until`, `-t`, `-f`)
- `cp` 의 복사 방향과 경로 규칙, 정지된 컨테이너에서의 복사
- `diff` 로 확인하는 파일 변경(`A`, `D`, `C`)과 변경의 수명
- `rm -f`, `rm -v`, `--rm` 과 익명 볼륨, 명명된 볼륨의 처리
- `prune` 과 `until`, `label` 필터, 삭제 시 함께 삭제되는 것

## Examples

- `lab01` → 로그 조회 (조회 범위, 표준 출력과 표준 오류, 정지와 삭제 후의 로그)
- `lab02` → 파일 복사와 변경 확인
- `lab03` → 삭제와 정리 (`rm -f`, `--rm` 과 볼륨, 레이블 필터 정리)

## Source

- `infinite-worker/` → `dkrcore/infinite-worker:1.0` 이미지 소스, lab01
- `dummy-worker/` → `dkrcore/dummy-worker:1.0` 이미지 소스, lab02, lab03

## Reference

- Notion: [Notion 문서]()

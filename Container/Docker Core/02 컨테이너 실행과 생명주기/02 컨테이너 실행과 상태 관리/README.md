# 02 컨테이너 실행과 생명주기 / 02 컨테이너 실행과 상태 관리

`docker container run` 의 형식과 옵션 범주를 정리하고, 실행 모드, 식별 옵션, 이미지 기본 명령의 재정의를 다룬다. 컨테이너의 종료 시퀀스와 종료 코드, 정지 설정, 상태 조회 방법을 정리한다.

## What you will learn

- `docker container run` 의 명령 형식과 옵션 8개 범주
- 포그라운드 실행과 백그라운드 실행(`-d`), `-i`, `-t` 조합, `run` 과 `create` · `start` 의 차이
- 컨테이너 이름 규칙과 이름 충돌, `--pull`, `--rm`
- `stop` 과 `kill` 의 종료 시퀀스, 종료 코드(`137`, `143`), `--stop-timeout`, `stop -t`, `--init`
- `--filter` 와 `--format` (`.State`, `.Status`) 으로 상태 조회

## Examples

- `lab01` → 컨테이너 포그라운드 실행 (`create` · `start` 와의 비교, `-i`, `-t` 조합)
- `lab02` → 명령어 재정의
- `lab03` → 컨테이너 백그라운드 실행 (로그 조회, 이름 충돌)
- `lab04` → 컨테이너 정지 동작과 상태 조회

## Source

- `once-worker/` → `dkrcore/once-worker:1.0` 이미지 소스, lab01, lab02
- `infinite-worker/` → `dkrcore/infinite-worker:1.0` 이미지 소스, lab03, lab04

## Reference

- Notion: [Notion 문서]()

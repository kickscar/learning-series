# 02 컨테이너 실행과 생명주기 / 01 컨테이너 개요와 생명주기

컨테이너가 생성부터 삭제까지 거치는 상태와 각 상태를 바꾸는 명령을 정리한다. 하나의 컨테이너를 명령으로 차례로 전환하며 상태 표시를 확인한다.

## What you will learn

- 컨테이너 상태 7가지와 명령으로 오가는 4가지 상태(`created`, `running`, `paused`, `exited`)
- `docker container ls` 의 `STATUS` 열 표시와 `-a` 옵션
- `create`, `start`, `pause`, `unpause`, `stop`, `restart`, `rm` 에 따른 상태 전이
- `docker container run` 과 `create` · `start` 의 관계

## Examples

- `lab01` → 컨테이너 상태 전환 (생성부터 삭제까지의 상태 전환, 삭제 거부 확인, 정지 소요 시간 관찰)

## Source

- `dummy-worker/` → `dkrcore/dummy-worker:1.0` 이미지 소스, lab01

## Reference

- Notion: [Notion 문서]()

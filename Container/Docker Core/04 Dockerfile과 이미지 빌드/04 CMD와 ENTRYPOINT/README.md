# 04 Dockerfile과 이미지 빌드 / 04 CMD와 ENTRYPOINT

컨테이너가 실행할 명령을 정하는 `CMD` 와 `ENTRYPOINT` 를 다룬다. 두 명령의 작성 형식에 따라 실행 방식이 달라지는 점과 두 명령을 함께 지정했을 때의 결과를 정리하고, 형식 차이로 발생하는 정지 지연과 변수 미치환을 실행으로 확인한다.

## What you will learn

- exec 형식과 셸 형식의 차이, exec 형식의 JSON 표기, 셸 형식의 `JSONArgsRecommended` 경고
- `CMD` 와 `ENTRYPOINT` 의 역할 구분, 실행 인자와 `--entrypoint` 로 바꾸는 방법
- 두 명령의 조합 결과(셸 형식 `ENTRYPOINT` 의 인자 무시, exec 형식 `ENTRYPOINT` 에 붙는 `CMD`, 베이스 이미지 `CMD` 의 초기화)
- 셸 형식에서 셸이 PID 1로 남아 `stop` 이 유예 기간 뒤 강제 종료로 끝나는 문제와 셸에 따른 차이
- exec 형식의 변수 미치환과 `sh -c`, `exec "$@"` 로 끝나는 엔트리포인트 스크립트

## Examples

- `lab01` → 조합 확인 (`CMD` 의 두 형식, 셸 형식 `ENTRYPOINT`, exec 형식 `ENTRYPOINT` 와 `CMD` 의 조합, `--entrypoint` 지정)
- `lab02` → PID 1과 변수 치환 (셸 형식과 exec 형식 `CMD` 의 PID 1과 정지 시간, exec 형식의 변수 미치환, 엔트리포인트 스크립트)

## Source

- `lab01-combination/` → lab01에서 작성하는 `Dockerfile.cmd.exec`(`lab01-cmd-exec`) · `Dockerfile.cmd.shell`(`lab01-cmd-shell`) · `Dockerfile.ep.shell`(`lab01-ep-shell`) · `Dockerfile.ep.exec`(`lab01-ep-exec`) · `Dockerfile.ep.exec.cmd.exec`(`lab01-ep-exec-cmd-exec`) · `Dockerfile.ep.exec.cmd.shell`(`lab01-ep-exec-cmd-shell`), lab01
- `lab02-pid1-var/` → lab02에서 작성하는 `Dockerfile.shell`(`lab02-shell`) · `Dockerfile.exec`(`lab02-exec`) · `Dockerfile.exec.var`(`lab02-exec-var`) · `Dockerfile.shell.var`(`lab02-shell-var`) · `Dockerfile.entrypoint`(`lab02-entrypoint`)와 `docker-entrypoint.sh`, lab02

## Reference

- Notion: [Notion 문서]()

# 02 컨테이너 실행과 생명주기 / 04 관찰과 디버깅

컨테이너에 문제가 생겼을 때 목록, 로그, 상세 정보, 내부 명령 실행, 프로세스와 자원 사용량 순으로 원인을 찾는 진단 절차를 정리한다. 실패 시점에 따라 원인이 기록되는 위치를 구분하고, 주 프로세스에 연결하는 `attach` 의 동작과 분리 방법을 다룬다.

## What you will learn

- 진단 순서(`ls -a`, `logs`, `inspect`, `exec`, `top`, `port`, `stats`)와 실패 시점에 따른 정보 위치(`Exited` 와 로그, `Created` 와 `.State.Error`)
- `inspect` 의 주요 항목과 `--format` 의 Go 템플릿
- `exec` 의 옵션(`-i`, `-t`, `-d`, `-u`, `-w`, `-e`)과 조건(실행 중인 컨테이너, 이미지에 있는 프로그램), 재시작 후 결과의 수명
- `top`, `port`, `stats` 로 확인하는 프로세스, 게시된 포트, 자원 사용량
- `attach` 의 연결 대상, Ctrl-C와 시그널 전달(`--sig-proxy`), 분리 키 Ctrl-P Ctrl-Q

## Examples

- `lab01` → 진단 절차 (실행 후 종료된 컨테이너, 시작하지 못한 컨테이너, 실행 중인 컨테이너의 확인, `exec` 결과의 수명)
- `lab02` → `attach` 의 연결과 분리 (Ctrl-C, SIGINT를 처리하지 않는 주 프로세스, 분리 키, `logs` 와 `exec` 의 비교)

## Source

- `infinite-worker/` → `dkrcore/infinite-worker:1.0` 이미지 소스, lab02
- `dummy-worker/` → `dkrcore/dummy-worker:1.0` 이미지 소스, lab02

## Reference

- Notion: [Notion 문서]()

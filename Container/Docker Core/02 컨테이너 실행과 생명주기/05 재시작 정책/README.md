# 02 컨테이너 실행과 생명주기 / 05 재시작 정책

컨테이너가 종료됐을 때 Engine이 컨테이너를 자동으로 다시 시작하는 조건인 재시작 정책을 정리한다. 정책별 재시작 조건과 수동 정지, Engine 재시작에 따른 차이를 다루고, 종료가 반복될 때의 재시작 지연과 정책을 적용할 수 없는 경우를 확인한다.

## What you will learn

- 재시작 정책과 `restart` 명령의 구분, `--restart` 의 정책 4종(`no`, `on-failure[:max-retries]`, `always`, `unless-stopped`)
- 종료 코드, 수동 정지(`stop`, `kill`), Engine 재시작에 따른 정책별 재시작 여부
- 재시작 지연(100ms부터 두 배씩, 최대 1분)과 10초 실행 후 초기화, `Restarting` 상태, `RestartCount`
- `docker container update --restart` 로 실행 중인 컨테이너의 정책 변경
- `--rm` 과 재시작 정책의 동시 지정 오류, 정책이 감지하는 범위

## Examples

- `lab01` → 정책별 동작 비교 (종료 코드에 따른 재시작, 수동 정지, Engine 재시작, 수동 시작과 정책 재개)
- `lab02` → 제약 확인 (재시작 지연의 증가와 초기화, 최대 재시작 횟수, 정책 변경, `--rm` 과 재시작 정책)

## Source

- `dummy-worker/` → `dkrcore/dummy-worker:1.0` 이미지 소스, lab02

## Reference

- Notion: [Notion 문서]()

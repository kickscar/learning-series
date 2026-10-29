# 06 워크로드 컨트롤러 / 05 Job과 CronJob

완료를 목표로 하는 Job과, Job을 주기적으로 생성하는 CronJob을 다룬다. 병렬 실행과 재시도, 동시 실행 정책을 확인하고, 재시도와 주기 실행이 있는 작업을 안전하게 만드는 멱등성을 정리한다.

## What you will learn

- 계속 실행되는 워크로드와 완료되는 워크로드, Job의 `restartPolicy`(`Never` · `OnFailure`)
- `completions` · `parallelism` 과 Job 완료
- 실패와 재시도: `backoffLimit`, 재시도 간격, `BackoffLimitExceeded`
- CronJob의 `schedule` 과 시간대, Job 이름 규칙
- `concurrencyPolicy`(`Allow` · `Forbid` · `Replace`)와 작업의 멱등성

## Lab

| Lab | 내용 | 디렉터리 |
|-----|------|---------|
| lab01: Job과 CronJob | 병렬 Job과 완료, 실패 Job의 재시도와 `Failed`, 매분 CronJob의 겹친 실행(`Allow`), 동시 실행 차단(`Forbid`) | `lab01/` |

`lab01/` 의 파일은 실습을 마친 상태다. `cronjob.yaml` 은 4단계에서 `concurrencyPolicy` 를 `Forbid` 로 바꾼 최종 내용이고, 실습은 `Allow` 로 시작한다.

`cp` 노드의 `~/k8s-core/06/05/lab01` 에서 실행한다. 3 ~ 4단계는 CronJob 실행을 기다리므로 단계마다 2 ~ 3분 걸린다.

## Reference

- Notion: [Notion 문서]()

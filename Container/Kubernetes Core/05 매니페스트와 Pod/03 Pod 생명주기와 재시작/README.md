# 05 매니페스트와 Pod / 03 Pod 생명주기와 재시작

Pod가 생성돼 삭제될 때까지 거치는 상태를 다룬다. kubectl이 표시하는 상태로 무엇을 진단하는지, 종료된 컨테이너를 누가 어디서 다시 실행하는지, Pod를 삭제하면 컨테이너가 어떤 순서로 종료되는지 확인한다.

## What you will learn

- Pod phase와 컨테이너 상태, kubectl `STATUS` 열과 Pod 상태 조건(Conditions)
- `Pending` 의 두 원인(노드 배정 대기, 이미지 다운로드 실패)과 Events를 이용한 구분
- `restartPolicy` 와 재시작 범위(같은 노드), 노드 재부팅 후 재실행
- `CrashLoopBackOff` 의 재시작 대기 시간
- 종료 시퀀스(`preStop` → 정지 신호 → 유예 기간 → `SIGKILL`)와 `terminationGracePeriodSeconds`

## Lab

| Lab | 내용 | 디렉터리 |
|-----|------|---------|
| lab01: 생명주기와 종료 동작 확인 | 재시작 정책별 상태, `CrashLoopBackOff`, `Pending` 원인 구분, 유예 기간과 삭제 시간, `preStop` 순서, 노드 재부팅 후 재실행 | `lab01/` |

`lab01/` 의 파일은 단계 순서대로 다음과 같다.

| 단계 | 파일 |
|------|------|
| 1. 종료되는 컨테이너와 재시작 정책 | `namespace.yaml`, `once.yaml`, `fail.yaml` |
| 2. CrashLoopBackOff | `crash.yaml` |
| 3. Pending의 원인 구분 | `image-nonexist.yaml`(존재하지 않는 태그), `unschedulable.yaml`(배치할 노드 없음) |
| 4. 종료 시퀀스와 유예 기간 | `web.yaml`, `sleep.yaml`, `sleep-grace-terminate.yaml` |
| 5. preStop의 실행 순서 | `prestop.yaml` |
| 6. 노드 재부팅 후 재실행 | `web.yaml` |

`cp` 노드의 `~/k8s-core/05/03/lab01` 에서 실행한다. 5단계는 `cp` 노드에서 터미널 두 개를 쓰고, 6단계의 재부팅은 Pod가 배치된 worker 노드에서 실행한다.

## Reference

- Notion: [Notion 문서]()

# 05 매니페스트와 Pod / 05 Init Container와 Sidecar

한 Pod에 컨테이너를 여러 개 두는 기준을 정리하고, 실무에서 쓰는 두 형태인 Init Container와 Native Sidecar의 시작 · 종료 순서를 확인한다. 이 장의 마지막 섹션으로, 끝에서 스냅샷 `ch05-done` 을 생성한다.

## What you will learn

- 컨테이너를 같은 Pod에 두는 기준과 앱 컨테이너 · Init Container · Native Sidecar의 차이
- Init Container의 실행 순서, `Init:N/M` · `PodInitializing` 표시, 쓰임(의존 대상 대기, 설정 · 데이터 준비)
- Native Sidecar의 정의(`initContainers` + `restartPolicy: Always`)와 시작 · 종료 순서
- `emptyDir` 볼륨을 이용한 컨테이너 간 파일 공유

## Lab

| Lab | 내용 | 디렉터리 |
|-----|------|---------|
| lab01: Init Container와 Sidecar | Init Container로 의존 대상 대기와 웹 페이지 준비, 로그 수집 sidecar의 시작 · 종료 순서 | `lab01/` |

| 파일 | 내용 |
|------|------|
| `namespace.yaml` | Namespace `lab01` |
| `init.yaml` | Init Container 2개(`wait-db` · `setup`)와 nginx |
| `service.yaml` | 의존 대상 역할의 Service `lab01-db-svc`. `init.yaml` 을 적용해 대기 상태를 확인한 뒤 적용한다 |
| `sidecar.yaml` | 로그 수집 Native Sidecar(`log-tailer`)와 nginx |

`cp` 노드의 `~/k8s-core/05/05/lab01` 에서 실행한다. lab은 자원 정리까지 하고, 스냅샷 `ch05-done` 생성은 본문의 절차를 따라 학습자 호스트에서 실행한다.

## Reference

- Notion: [Notion 문서]()

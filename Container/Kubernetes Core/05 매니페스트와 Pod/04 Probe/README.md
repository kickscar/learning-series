# 05 매니페스트와 Pod / 04 Probe

프로세스가 실행 중이지만 응답하지 않는 상태를 kubelet이 주기적으로 검사해 판정하는 Probe를 다룬다. Probe 세 종류의 판정 대상과 실패 시 동작을 확인하고, 그 차이로 설정 기준을 정한다.

## What you will learn

- `restartPolicy` 의 감지 범위와 Probe의 필요성, Docker `HEALTHCHECK` 와의 차이
- `livenessProbe` · `readinessProbe` · `startupProbe` 의 판정 대상과 실패 시 동작
- 검사 방식(`httpGet` 중심)과 판정 기준(`periodSeconds` · `timeoutSeconds` · `successThreshold` · `failureThreshold` · `initialDelaySeconds`)
- 자주 발생하는 설정 오류와 Probe별 설정 기준

## Lab

| Lab | 내용 | 디렉터리 |
|-----|------|---------|
| lab01: liveness와 자동 재시작 | liveness 실패에 따른 재시작, 재시작한 컨테이너의 파일 상태, `failureThreshold` 에 따른 재시작 시점 | `lab01/` |
| lab02: readiness와 startup | readiness 실패 시 `READY 0/1` 과 재시작 없음, 시작이 느린 애플리케이션의 재시작 반복, `startupProbe` 적용 | `lab02/` |

| Lab | 파일 |
|-----|------|
| lab01 | `namespace.yaml`, `liveness.yaml`(`failureThreshold: 3`), `liveness-tolerant.yaml`(`failureThreshold: 6`) |
| lab02 | `namespace.yaml`, `readiness.yaml`, `slow-start.yaml`(liveness만, 시작 중 재시작 재현), `startup.yaml`(`startupProbe` 추가) |

Probe 필드는 기본값도 모두 적었고, `kubectl describe pod` 의 표시 순서와 같다.

`cp` 노드의 `~/k8s-core/05/04/lab01` · `~/k8s-core/05/04/lab02` 에서 실행한다.

## Reference

- Notion: [Notion 문서]()

# 06 워크로드 컨트롤러 / 02 롤링 업데이트와 롤백

Deployment가 이미지를 교체하는 방식과 교체 범위 설정, 실패한 교체를 되돌리는 방법을 다룬다. 교체 중 요청이 실패하지 않으려면 애플리케이션과 매니페스트가 무엇을 갖춰야 하는지 확인한다.

## What you will learn

- 버전별 ReplicaSet과 롤링 업데이트, `RollingUpdate` · `Recreate`
- `maxUnavailable` · `maxSurge` 와 교체 중 사용 가능한 Pod 수
- `kubectl rollout status` · `history` · `undo`, `revisionHistoryLimit`
- 실패한 롤아웃과 롤백: `kubectl rollout undo` 와 매니페스트 되돌리기
- 무중단 배포의 조건: readinessProbe, 정지 신호 처리, preStop

## Lab

| Lab | 내용 | 디렉터리 |
|-----|------|---------|
| lab01: 롤링 업데이트 확인 | 기본 전략과 `maxSurge: 1` · `maxUnavailable: 0` 의 교체 비교, 롤아웃 이력 | `lab01/` |
| lab02: 실패와 롤백, 교체 중 응답 | 존재하지 않는 이미지로 멈춘 롤아웃, `kubectl rollout undo` 와 매니페스트 되돌리기, readinessProbe · preStop 유무에 따른 교체 중 실패 수 | `lab02/` |

`lab01/` · `lab02/` 의 파일은 실습을 마친 상태다.

| 파일 | 실습 시작 상태와의 차이 |
|------|------|
| `lab01/rolling-default.yaml`, `lab01/rolling-surge.yaml` | 이미지 `nginx:1.30`. 실습은 `nginx:1.29` 로 시작한다 |
| `lab02/nginx.yaml` | 이미지 `nginx:1.30`. 실습 중 `nginx:none` 으로 바꿨다가 되돌린다 |
| `lab02/web.yaml` | readinessProbe · preStop · 이미지 `nginx:1.30` 의 최종 상태. 실습은 Probe · preStop 없이 `nginx:1.29` 로 시작한다 |

`cp` 노드의 `~/k8s-core/06/02/lab01` · `~/k8s-core/06/02/lab02` 에서 실행한다. lab01은 교체를 관찰할 터미널이 하나 더 필요하다.

## Reference

- Notion: [Notion 문서]()

# 07 스케줄링 / 04 분산 배치와 PodDisruptionBudget

같은 애플리케이션의 복제본을 여러 노드에 균등하게 나누어 배치하는 `topologySpreadConstraints` 와, 노드를 비우는 동안 일정 수의 Pod를 유지하는 PodDisruptionBudget(PDB)을 확인한다.

## What you will learn

- 스케줄러의 기본 분산은 선호일 뿐 보장이 아니라는 점과 `topologySpreadConstraints` 의 `topologyKey` · `labelSelector` · `maxSkew` · `whenUnsatisfiable`
- taint가 있는 `cp` 노드가 분산 계산에 포함되어 Pod가 `Pending` 이 되는 경우와 `nodeTaintsPolicy: Honor`
- 롤링 업데이트 뒤 분포가 치우치지 않도록 같은 버전의 Pod끼리 개수를 산정하는 `matchLabelKeys: [pod-template-hash]`
- 자발적 중단과 비자발적 중단, PDB(`minAvailable` · `maxUnavailable`)와 Eviction API, `ALLOWED DISRUPTIONS`
- PDB가 제한하지 않는 중단(비자발적 중단, Pod 직접 삭제 · Deployment 삭제, 롤링 업데이트)

## Lab

| Lab | 내용 | 디렉터리 |
|-----|------|---------|
| lab01: 분산 배치 | 분산 제약 없는 배치, 제약 추가 후 `Pending`, `nodeTaintsPolicy` · `matchLabelKeys` 로 2:2, 복제본 5개에서 2:3 | `lab01/` |
| lab02: PDB와 축출 | PDB 없이 노드를 비울 때와 `minAvailable: 3` PDB를 지정하고 노드를 비울 때의 Ready Pod 수 비교 | `lab02/` |

| 파일 | 내용 |
|------|------|
| `lab01/namespace.yaml` | Namespace `lab01` |
| `lab01/deployment.yaml` | Deployment `lab01-spread` (`nginx:1.30`, 분산 제약) |
| `lab02/namespace.yaml` | Namespace `lab02` |
| `lab02/deployment.yaml` | Deployment `lab02-web` (복제본 4개, readinessProbe `initialDelaySeconds: 10`) |
| `lab02/pdb.yaml` | PodDisruptionBudget `lab02-web-pdb` (`minAvailable: 3`) |

`lab01/` 의 `deployment.yaml` 은 실습을 마친 최종 내용이다. 실습은 분산 제약 없이 `replicas: 4` 로 시작해 2단계에서 분산 제약을, 3단계에서 `nodeTaintsPolicy` 와 `matchLabelKeys` 를 추가하고 `replicas` 를 `5` 로 바꾼다.

`cp` 노드의 `~/k8s-core/07/04/lab01` · `~/k8s-core/07/04/lab02` 에서 실행한다. lab02는 노드를 비울 때 `--pod-selector=app=lab02-web` 으로 실습 Pod만 축출하고, 비운 노드는 `kubectl uncordon` 으로 되돌린다.

## Reference

- Notion: [Notion 문서]()

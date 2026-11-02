# 09 스토리지 / 01 Volume 기초

컨테이너 파일시스템의 수명과 Pod에 연결하는 저장 공간인 Volume을 다룬다. Pod에 종속된 `emptyDir` 와 노드에 종속된 `hostPath` 의 데이터 수명을 확인하고, Pod 교체와 노드 이동에서 데이터를 유지하려면 Pod와 분리된 스토리지가 필요한 이유를 정리한다.

## What you will learn

- 컨테이너 쓰기 계층의 수명(컨테이너 재시작 · Pod 재생성 시 초기화)과 Pod 수준 Volume(`spec.volumes` · `volumeMounts`)
- `emptyDir` 의 수명(컨테이너 재시작에는 유지, Pod가 노드에서 제거되면 삭제)과 용도(컨테이너 간 파일 공유, 작업 공간)
- `hostPath` 의 노드 종속성(다른 노드의 Pod는 다른 데이터, 같은 노드의 Pod는 같은 데이터)과 Pod 격리 우회, 노드 수준 구성 요소에 한정한 용도
- Docker 저장 방식과의 대응(볼륨 → PersistentVolume · PersistentVolumeClaim, 바인드 마운트 → `hostPath`, tmpfs → `emptyDir`)

## Lab

| Lab | 내용 | 디렉터리 |
|-----|------|---------|
| lab01: emptyDir와 hostPath | 두 컨테이너의 `emptyDir` 공유, 컨테이너 재시작과 Pod 재생성에 따른 데이터 수명, `hostPath` 를 마운트한 Pod를 같은 노드 · 다른 노드에 배치해 노드 종속성 확인 | `lab01/` |

| 파일 | 내용 |
|------|------|
| `namespace.yaml` | Namespace `lab01` |
| `emptydir.yaml` | Pod `lab01-shared` (`busybox:1.37`, `writer` · `reader` 컨테이너가 `emptyDir` 를 `/data-write` · `/data-read` 에 마운트) |
| `hostpath-worker1.yaml` | Pod `lab01-hostpath` (`nodeSelector` `worker1`, `hostPath` `/tmp/k8s-core/09/01/lab01` → `/data-write`) |
| `hostpath-worker2.yaml` | `hostpath-worker1.yaml` 에서 `nodeSelector` 만 `worker2` 로 변경한 파일 |

`cp` 노드의 `~/k8s-core/09/01/lab01` 에서 실행하고, 노드의 파일 확인과 자원 정리는 `worker1` · `worker2` 노드에 접속해 실행한다. `hostPath` 가 생성한 노드 경로는 Namespace를 삭제해도 남으므로 자원 정리에서 각 worker 노드의 `/tmp/k8s-core` 를 삭제한다. Pod 삭제와 Namespace 삭제는 `sleep` 의 종료 유예 시간 때문에 30 ~ 40초 정도 소요된다.

## Reference

- Notion: [Notion 문서]()

# 06 워크로드 컨트롤러 / 04 DaemonSet

Pod 개수가 아니라 노드를 기준으로 배치하는 DaemonSet을 다룬다. 클러스터를 구축할 때 설치한 `kube-proxy` 와 Calico가 같은 방식으로 실행되는 것을 확인하고, control plane 노드의 taint와 toleration, DaemonSet 컨트롤러가 자동으로 추가하는 toleration, 노드 단위 업데이트를 확인한다.

## What you will learn

- 노드 기준 배치: `replicas` 없이 대상 노드마다 Pod 하나, ReplicaSet 없음
- 사용 사례와 클러스터 구성 요소(`kube-proxy`, `calico-node`), static Pod와의 차이
- taint의 구성(`{key}={value}:{effect}`)과 toleration, `operator: Exists` · `Equal`
- DaemonSet 컨트롤러가 추가하는 toleration과 `kubectl drain --ignore-daemonsets` 의 관계
- 기본 업데이트 전략(`maxUnavailable: 1` · `maxSurge: 0`)과 노드 단위 교체

## Lab

| Lab | 내용 | 디렉터리 |
|-----|------|---------|
| lab01: DaemonSet 배치와 toleration | 시스템 DaemonSet과 toleration 조회, 노드 이름을 출력하는 에이전트 DaemonSet 배포, `cp` 노드 제외와 자동 toleration 확인, toleration 추가 후 `cp` 노드 배치와 교체 순서 | `lab01/` |

`lab01/` 의 파일은 실습을 마친 상태다. `daemonset.yaml` 은 3단계에서 `tolerations` 를 추가한 최종 내용이고, 실습은 `tolerations` 없이 시작한다.

`cp` 노드의 `~/k8s-core/06/04/lab01` 에서 실행한다. 노드 상태는 바꾸지 않으므로 자원 정리는 Namespace 삭제뿐이다.

## Reference

- Notion: [Notion 문서]()

# 03 노드 조인 / 02 worker 노드 조인

조인한 `worker1` 을 control plane 노드와 비교하고, 같은 절차로 `worker2` 를 조인해 3노드 클러스터를 완성한다. 노드가 재기동한 뒤 클러스터가 같은 상태로 돌아오는 범위와 정지 · 기동 순서를 확인하고 스냅샷 `ch03-done` 을 생성한다.

## What you will learn

- worker 노드 조인의 범위와 control plane 노드와의 구성 차이(manifest, 실행 중인 컨테이너, `/etc/kubernetes`)
- 노드 label(공통 label, `node-role.kubernetes.io/{역할}` 과 `ROLES` 열)과 control-plane · not-ready taint
- 토큰 확인 후 `worker2` 조인, 서빙 인증서 CSR의 개별 승인, 3노드의 `INTERNAL-IP`
- 클러스터 재기동 후 복구되는 것(etcd의 선언, kubelet의 컨테이너 재실행)과 복구되지 않는 것(컨테이너 메모리 상태)
- `cp` 를 마지막에 정지하고 먼저 기동하는 순서, Vagrant 정상 종료 대기 시간(`graceful_halt_timeout`), 스냅샷 `ch03-done`

## Source

예제 파일은 없다. 조인 명령은 앞 섹션에서 받은 명령을 쓴다. 정지 · 스냅샷 · 기동은 학습자 호스트의 Vagrant 작업 디렉터리(`Container/Vagrant`)에서 실행한다.

## Reference

- Notion: [Notion 문서]()

# 03 노드 조인 / 01 조인의 신뢰 수립과 kubelet 인증서

`kubeadm init` 이 출력한 조인 명령으로 `worker1` 을 클러스터에 조인하면서, 노드와 클러스터가 처음 접속할 때 서로를 확인하는 구조를 정리한다. 조인 과정에서 kubelet 인증서가 CSR로 발급되는 것을 관찰하고, 자동 승인되지 않는 서빙 인증서 CSR을 승인한다.

## What you will learn

- 조인의 양방향 신뢰: 토큰(노드 → 클러스터)과 CA 해시(클러스터 → 노드), CA 해시 검증을 생략하면 안 되는 이유
- 토큰 수명(기본 24시간)과 `kubeadm token create --print-join-command` 로 조인 명령 재발급, `openssl` 로 계산한 CA 해시
- kubelet 인증서의 CSR 생성 · 승인 · 발급과 클라이언트 · 서빙 인증서의 차이(`kubectl get csr --watch-only` 관찰)
- 서빙 인증서 승인 전 `kubectl logs` 의 `tls: internal error`, 요청 주체 확인 후 승인과 발급된 인증서의 SAN
- 노드 identity(`system:node:{노드 이름}` · `system:nodes`)

## Source

예제 파일은 없다. `cp` 노드와 `worker1` 노드에서 명령을 실행하고, CSR 관찰은 `cp` 노드의 별도 터미널에서 한다.

## Reference

- Notion: [Notion 문서]()

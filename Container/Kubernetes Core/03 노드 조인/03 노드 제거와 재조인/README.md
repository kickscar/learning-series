# 03 노드 조인 / 03 노드 제거와 재조인

`worker2` 를 클러스터에서 제거하고 다시 조인한다. `kubeadm reset` 없이 노드 객체만 삭제했을 때의 증상을 먼저 확인하고, 정해진 순서로 노드를 제거한 뒤 `kubeadm reset` 이 남기는 항목을 정리하고 재조인해 3노드 상태로 되돌린다.

## What you will learn

- 노드 제거 순서(`kubectl drain` → 노드에서 `kubeadm reset` → `kubectl delete node`)와 kubelet의 자동 재등록 때문에 순서가 필요한 이유
- reset을 생략한 제거의 증상: 남은 kubelet의 오류, 재조인 preflight 오류(`kubelet.conf` · `Port-10250` · `ca.crt`), kubelet 재시작 시 노드 재등록
- `kubeadm reset` 이 정리하는 것과 남기는 것(iptables 규칙, `/etc/cni/net.d`, 컨테이너 이미지, `$HOME/.kube/config`, 노드 준비 설정)
- 잔여 iptables 규칙의 확인과 정리, 다른 방화벽 규칙이 있는 노드에서의 주의
- 새 토큰으로 재조인하고 새로 발급되는 서빙 인증서 CSR 승인

## Source

예제 파일은 없다. `cp` 노드와 `worker2` 노드에서 명령을 실행한다. 시작 전에 학습자 호스트에서 스냅샷 `ch03-done` 을 확인한다.

## Reference

- Notion: [Notion 문서]()

# 04 Pod 네트워크와 CNI / 01 NotReady 상태의 원인

앞 장까지 관찰만 하고 넘긴 노드 `NotReady`, CoreDNS `Pending` 상태가 어디서 시작되는지 kubelet과 컨테이너 런타임을 따라가며 확인하고, 세 가지 관찰이 네트워크 플러그인이 없다는 하나의 원인에서 나온다는 것을 정리한다.

## What you will learn

- 구축 직후 클러스터의 세 가지 상태(노드 `NotReady`, CoreDNS `Pending`, `kube-proxy` · Control Plane `Running`)
- 노드 `Ready` 조건의 메시지와 containerd의 `NetworkReady=false`(`crictl info`), `lastCNILoadStatus`
- containerd의 CNI 설정 경로(`/etc/cni/net.d`)와 플러그인 실행 파일 경로(`/opt/cni/bin`)
- 네트워크 준비 판정의 흐름(containerd → kubelet → kube-apiserver, kube-controller-manager의 not-ready taint 제거, kube-scheduler의 배치)과 `hostNetwork`
- `kubeadm` 이 네트워크 플러그인을 설치하지 않는 이유

## Source

예제 파일은 없다. `cp` 노드와 `worker1` 노드에서 상태를 조회한다.

## Reference

- Notion: [Notion 문서]()

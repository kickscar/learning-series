# 04 Pod 네트워크와 CNI / 02 Pod 네트워크 모델

네트워크 플러그인이 구현해야 하는 것, 즉 Kubernetes가 Pod 네트워크에 요구하는 조건을 정리한다. 플러그인이 노드에 놓이는 위치, 클러스터 구축 때 지정한 Pod 대역이 연결되는 곳, 노드 사이의 전달 방식과 이 시리즈가 Calico를 쓰는 이유를 다룬다.

## What you will learn

- Kubernetes 네트워크 모델: Pod마다 고유한 IP, NAT 없는 Pod 간 통신, 노드와 Pod의 통신
- 노드 · Service · Pod 세 IP 대역과 할당 주체, 대역이 겹치면 안 되는 이유
- CNI의 역할과 `/etc/cni/net.d` · `/opt/cni/bin`
- Pod 대역의 연결(`podSubnet` → controller-manager `cluster-cidr` → 노드 `spec.podCIDR` → kube-proxy `clusterCIDR`)과 Calico IP pool이 지켜야 할 두 가지
- 오버레이(IP-in-IP · VXLAN)와 라우팅(BGP) 방식, Calico를 쓰는 이유

## Source

예제 파일은 없다. Pod 대역의 연결은 `cp` 노드에서 조회한다.

## Reference

- Notion: [Notion 문서]()

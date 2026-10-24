# 01 클러스터의 구성 요소 / 02 Control Plane과 Node

앞 섹션의 컨트롤러가 실행되는 위치와, 선언을 저장하고 컨테이너를 실제로 실행하는 구성 요소를 정리한다. 구성 요소가 API 서버를 중심으로 요청과 변화를 주고받는 구조와 각 구성 요소의 기동 방식을 함께 다룬다.

## What you will learn

- Control Plane 구성 요소(`kube-apiserver` · `etcd` · `kube-scheduler` · `kube-controller-manager`)와 노드 구성 요소(`kubelet` · `containerd` · `kube-proxy`)의 역할 분담
- Docker Engine을 거치던 이전 구성(dockershim)과 CRI 런타임에 직접 요청하는 현재 구성의 차이, Docker로 빌드한 이미지의 호환
- API 서버 중심 구조와 watch로 객체의 변화를 전달받는 방식, 인스턴스 선언부터 컨테이너 실행까지의 처리 순서
- systemd 서비스 · static Pod · 애드온으로 나뉘는 기동 방식과 Control Plane이 static Pod로 기동되는 이유

## Reference

- Notion: [Notion 문서]()

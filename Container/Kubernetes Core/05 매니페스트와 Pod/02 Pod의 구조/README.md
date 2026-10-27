# 05 매니페스트와 Pod / 02 Pod의 구조

Kubernetes의 배포 단위인 Pod가 무엇인지 정리한다. Pod 안의 컨테이너가 공유하는 것, Pod IP의 쓰임과 바뀌는 시점, Pod를 보통 누가 생성하는지를 다룬다.

## What you will learn

- Docker의 컨테이너와 Kubernetes의 Pod의 차이
- Pod 안의 컨테이너가 공유하는 것: 네트워크(IP · 포트 · 호스트 이름, `localhost` 통신), 저장소, 수명과 위치
- 네트워크를 보유하는 Pod 샌드박스(`pause` 컨테이너)
- Pod IP로 다른 노드의 Pod에 직접 접근하는 방법과 Pod를 다시 생성하면 IP가 바뀌는 이유
- Pod를 직접 생성하지 않고 워크로드 리소스로 생성하는 이유

## Lab

| Lab | 내용 | 디렉터리 |
|-----|------|---------|
| lab01: Pod 구조 확인 | Pod IP 통신, 멀티 컨테이너 Pod의 네트워크 공유, 노드의 Pod 샌드박스, 재생성과 IP 변경, Pod 상태 정보 | `lab01/` |

`lab01/` 의 파일은 `namespace.yaml`, 단일 컨테이너 Pod `web.yaml` · `client.yaml`, 컨테이너가 두 개인 Pod `multi.yaml` 이다.

`cp` 노드의 `~/k8s-core/05/02/lab01` 에서 실행한다. 샌드박스 확인 단계는 Pod가 배치된 worker 노드에서 실행한다.

## Reference

- Notion: [Notion 문서]()

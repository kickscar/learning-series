# 01 클러스터의 구성 요소 / 01 Orchestration과 선언적 모델

Docker와 Compose의 단일 호스트 운영이 여러 장비로 넘어갈 때 생기는 제약에서 출발해 Orchestration이 필요한 이유를 정리하고, Kubernetes가 클러스터를 관리하는 방식인 선언적 모델을 정의한다. 관리형 Kubernetes와 비교해 이 시리즈가 클러스터를 직접 구축하는 이유를 밝힌다.

## What you will learn

- 재시작 · 확장 · 이름 해석이 한 호스트 안에서만 동작하는 Docker 운영 방식의 제약과 Orchestration의 필요성
- 명령형과 선언형의 차이, 실행할 때 한 번 비교하는 Compose와 계속 비교하는 Kubernetes
- 객체의 `spec`(목표 상태)과 `status`(현재 상태), 그 차이를 조정하는 컨트롤러와 Reconciliation Loop
- 명령형 명령 · 명령형 객체 구성 · 선언형 객체 구성의 구분과 이 시리즈의 기본형(매니페스트 + `kubectl apply -f`)
- 관리형 Kubernetes가 추상화한 구성 요소와 클러스터를 직접 구축해 그 위에서 애플리케이션을 운영하는 이 시리즈의 접근

## Reference

- Notion: [Notion 문서]()

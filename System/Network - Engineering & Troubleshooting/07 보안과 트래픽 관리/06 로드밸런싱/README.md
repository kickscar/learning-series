# 07 보안과 트래픽 관리 / 06 로드밸런싱

요청을 여러 서버에 분산하는 로드밸런싱을 인식 수준으로 다룬다. L4/L7의 차이, 분배 알고리즘, 헬스 체크를 개념으로 짚는다. 이론 전용.

## What you will learn

- 로드밸런싱의 목적: 확장성(Scale-out)과 가용성(SPOF 제거)
- L4(전송 계층, IP+포트)와 L7(애플리케이션 계층, HTTP 내용) 로드밸런싱의 차이
- 분배 알고리즘: Round Robin, Least Connections, IP Hash(세션 고정), Weighted
- 헬스 체크(Active/Passive)로 비정상 서버를 풀에서 제외
- 클라우드의 관리형 로드밸런서(AWS NLB/ALB)와 원리의 동일성

## Reference

- Notion: [Notion document]()

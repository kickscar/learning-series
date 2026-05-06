# Ch09 코드 품질 & 테스트 / 03 [실습] Gallery: 검증 추가

Ch05 Gallery(ALB + ASG)에 check 블록을 추가해서 Gallery 앱의 HTTP 응답을 상시 점검한다. 모듈 코드 변경 없이 root main.tf에 check 블록만 추가한다.

## What you will learn

- `check` 블록 + `http` data source로 ALB endpoint 헬스 체크
- Spring Boot Actuator `/actuator/health` 응답 검증
- check 실패가 warning(비차단)임을 확인
- `terraform plan`에서도 check가 매번 실행됨을 확인

## Reference

- Notion: [Notion 문서]()

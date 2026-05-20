# Ch09 코드 품질 & 테스트 / 03 [실습] Gallery: 상시 헬스 체크

07.05 Gallery(단일코드 환경 분리)를 이어받아 check 블록을 추가한다. dev 환경에 배포하고 Gallery 앱의 HTTP 응답을 상시 점검한다.

## What you will learn

- `check` 블록 + `http` data source로 ALB endpoint 헬스 체크
- Spring Boot Actuator `/actuator/health` 응답 검증
- check 실패가 warning(비차단)임을 확인
- `terraform plan`에서도 check가 매번 실행됨을 확인
- 07.05의 단일코드 패턴(`-var-file` + `-backend-config`)으로 dev 환경 배포

## Reference

- Notion: [Notion 문서]()

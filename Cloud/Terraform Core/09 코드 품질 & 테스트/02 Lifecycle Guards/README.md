# Ch09 코드 품질 & 테스트 / 02 Lifecycle Guards

Terraform의 네 가지 검증 메커니즘(validation, precondition, postcondition, check)을 학습한다. 입력 단계부터 배포 후 상시 점검까지, 각 메커니즘의 실행 시점과 실패 동작 차이를 이해한다.

## What you will learn

- validation 고급 패턴: `can()` + `regex()`, CIDR 검증, 복수 validation 블록
- precondition으로 apply 전 교차 조건 검증 (TF 1.2+)
- postcondition으로 `self` 참조 기반 생성 결과 검증 (TF 1.2+)
- check 블록으로 상시 헬스 체크 (TF 1.5+). 실패 시 warning(비차단)
- 네 가지 메커니즘의 실행 순서와 실패 동작 비교

## Examples

- `lab01` → precondition(AMI 아키텍처 검증) + postcondition(public IP 확인)
- `lab02` → check 블록 + http data source로 헬스 체크, warning 동작 확인

## Reference

- Notion: [Notion 문서]()

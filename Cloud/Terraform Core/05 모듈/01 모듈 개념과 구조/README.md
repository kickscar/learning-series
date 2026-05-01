# Ch05 모듈 / 01 모듈 개념과 구조

모듈의 개념과 입출력을 이해하고, 점진적으로 모듈을 만들어 EC2 인스턴스를 배포한다. Console의 입력/결과와 module의 variable/output 관계를 매핑하고, 모듈 output의 map 패턴을 학습한다.

## What you will learn

- 디렉토리 = 모듈. root module vs child module
- Console → Module 매핑: Console 입력 = variable, 결과 = output
- `module` 블록: `source`(`./` 필수), variable 전달, output 참조
- 모듈 output 패턴: `{ (var.name) = { 정보 } }` — 입력한 이름으로 결과 참조
- Provider 자동 상속 — child module에 provider 정의 금지
- 독립 scope — 모듈 간 데이터 전달은 output → variable만 가능

## Lab

- **lab01**: VPC + Subnet 모듈 — vpc/, subnet/ 두 개 단일 리소스 모듈로 input/output과 모듈 간 참조 실습
- **lab02**: Network + IAM 모듈 — vpc+subnet을 network/로 합치고, iam/ 모듈 추가 (datasource.tf 분리)
- **lab03**: Network + IAM + Workload — workload/ 모듈 추가, 세 모듈 조합으로 EC2 인스턴스 배포

## Reference

- Notion: [Notion 문서](https://www.notion.so/01-345dc703ccda80bdba42c86576ce7372?source=copy_link)

# Day 08 — 코드 품질 & 프로젝트

> 시리즈 매핑: Ch09 (09.01~09.03 Gallery) + 프로젝트

---

## 시간 1: terraform fmt, validate, tflint
- **시리즈**: 09.01
- **실습**: fmt/validate/lint 실행
- **강의 포인트**: `terraform fmt` — 코드 정렬 자동화, `-check` 플래그(CI용). `terraform validate` — 구문 검증. `tflint` — 프로바이더 수준 린트(존재하지 않는 instance_type 감지 등). 세 도구의 역할 차이.
- **라이브 데모**: 의도적으로 포맷 깨진 코드 → fmt → validate → tflint 순차 실행

## 시간 2: precondition, postcondition, check 블록
- **시리즈**: 09.02
- **실습**: check 블록으로 HTTP 상시 검증
- **강의 포인트**: `precondition` — plan 시 사전 조건 검증. `postcondition` — apply 후 사후 조건 검증. `check` 블록 — 상시 검증(plan마다 실행). Ch02 Sec04의 variable validation과의 차이. TF 1.2+(precondition/postcondition), TF 1.5+(check).
- **라이브 데모**: check 블록으로 Gallery ALB endpoint HTTP 200 검증 → 의도적 실패 시 경고 확인

## 시간 3: Gallery — 검증 추가 + 전체 코드 리뷰
- **시리즈**: 09.03 Gallery
- **실습**: Gallery check 블록 추가
- **강의 포인트**: check 블록으로 Gallery 앱 HTTP 응답 상시 검증. plan마다 앱이 살아있는지 확인. "Day 2에서 수동 배포한 앱이 지금은 모듈화된 3-tier + 환경 분리 + 자동 검증."
- **전환**: "Gallery 최종 형태를 리뷰하자"

## 시간 4: Gallery 누적 결과물 점검
- **강의 포인트**: Day 2→Day 8 진화 리뷰.

| Day | Gallery | 핵심 변화 |
|-----|---------|----------|
| Day 2 | EC2 수동 배포 | SSM 접속, Local State |
| Day 3 | user_data + Remote | 자동 배포, S3 Remote |
| Day 5 | Custom VPC + ALB | Custom VPC, ALB endpoint |
| Day 6 | 모듈화 + 3-tier | 3-Layer, RDS + S3 |
| Day 7 | dev/prod 분리 | 환경별 독립 |
| Day 8 | 검증 추가 | check 블록 상시 검증 |

"같은 앱인데 인프라 코드가 6번 진화했다. 각 단계에서 무엇이 추가되었고 왜 필요했는지 되돌아보자."

## 시간 5: 프로젝트 구현 — 인프라
- **강의 포인트**: VPC, Subnet, IGW, NAT GW, Security Group. Day 4~5에서 배운 동적 구성 활용. 수강생 자율 구현 + 강사 순회 지원.
- **주의**: 기본 구조는 Gallery와 동일하되, 수강생 자신의 아키텍처로 변형

## 시간 6: 프로젝트 구현 — 컴퓨팅 & 네트워킹
- **강의 포인트**: EC2, ALB, Auto Scaling(선택). Day 5 ALB + Day 6 ASG 개요 활용.
- **주의**: Auto Scaling은 선택 과제 — 시간 내 완료가 어려울 수 있음

## 시간 7: 프로젝트 구현 — 스토리지 & 데이터베이스 + 모듈화
- **강의 포인트**: S3, RDS. Day 6 모듈 패턴 적용. network/platform/workload 3-Layer 분리.
- **주의**: 모듈화까지 완료하지 못해도 괜찮다 — 핵심은 "동작하는 인프라 코드"

## 시간 8: 발표 & 마무리
- **과제**: 프로젝트 최종 제출
- **강의 포인트**: 수강생 구현 결과 발표 (각 5~10분). 인사이트 교류. 향후 학습 로드맵 — CI/CD 과정 연결, Architecture & Design, Azure/GCP IaC.
- **마무리**: "Terraform으로 인프라를 코드로 설계하는 법을 배웠다. 다음은 이 코드를 팀에서 안전하게 배포하는 법이다."

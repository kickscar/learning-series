### Chapter 01 Terraform 소개
- Section 01 IaC와 Terraform
- Section 02 CloudFormation vs Terraform 비교
- Section 03 Terraform 설치 및 환경 구성
- Section 04 첫 번째 Terraform 프로젝트 (S3 버킷 생성)

### Chapter 02 HCL 기초
- Section 01 HCL 문법 개요 (블록, 인자, 표현식)
- Section 02 Resource와 Provider
- Section 03 Data Source 활용
- Section 04 변수(Variable)와 출력(Output)

### Chapter 03 Terraform 핵심 개념
- Section 01 State의 이해와 로컬 State
- Section 02 init, plan, apply 워크플로우
- Section 03 리소스 의존성과 실행 순서
- Section 04 destroy와 리소스 정리

### Chapter 04 변수와 출력 심화
- Section 01 변수 타입과 검증
- Section 02 tfvars와 환경별 설정
- Section 03 Output 활용 및 의존성 전달
- Section 04 Local Values와 Data 활용

### Chapter 05 State 관리
- Section 01 Remote State (S3 + DynamoDB)
- Section 02 State Locking과 동시 실행
- Section 03 State import와 migrate
- Section 04 State 보안과 접근 제어

### Chapter 06 조건문과 반복
- Section 01 count와 for_each
- Section 02 조건부 리소스 생성
- Section 03 for 표현식과 동적 블록
- Section 04 다중 AZ 서브넷/인스턴스 구성

### Chapter 7 모듈 기초
- Section 01 모듈의 개념과 구조
- Section 02 모듈 작성 (VPC 모듈 예제)
- Section 03 모듈 입력/출력 설계
- Section 04 Registry와 모듈 버전 관리

### Chapter 8 모듈 고급
- Section 01 모듈 조합과 계층화 패턴
- Section 02 재사용 가능한 EC2/ALB 모듈
- Section 03 환경별 root 모듈 구성 (dev/staging/prod)
- Section 04 3-tier 아키텍처 모듈화

### Chapter 9 Workspace와 환경 분리
- Section 01 Workspace 개념과 사용법
- Section 02 Workspace vs 디렉터리 분리
- Section 03 dev/prod Workspace 운영

### Chapter 10 코드 품질과 검증
- Section 01 terraform fmt, validate
- Section 02 tflint와 정적 분석
- Section 03 tfsec/checkov를 이용한 보안 스캔
- Section 04 pre-commit 훅 설정

### Chapter 11 Terraform 테스트
- Section 01 테스트 전략 개요
- Section 02 terratest 기초 (Go)
- Section 03 테스트 가능한 모듈 설계
- Section 04 VPC 모듈 테스트 작성

### Chapter 12 CI/CD 연동
- Section 01 Terraform CI/CD 패턴
- Section 02 GitHub Actions로 plan/apply 자동화
- Section 03 Atlantis 또는 Terraform Cloud (선택)
- Section 04 PR 기반 plan, merge 시 apply

### Chapter 13 Networking
- Section 01 VPC 모듈로 CIDR/서브넷 설계
- Section 02 NAT Gateway, Internet Gateway
- Section 03 Security Group과 NACL
- Section 04 퍼블릭/프라이빗 서브넷 구성

### Chapter 14 Computing과 스토리지
- Section 01 EC2 인스턴스 및 AMI
- Section 02 EBS 볼륨과 스냅샷
- Section 03 S3 버킷 정책과 버전 관리
- Section 04 EC2 + S3 연동

### Chapter 15 Database와 고가용성
- Section 01 RDS (MySQL/PostgreSQL) 구성
- Section 02 Multi-AZ와 파라미터 그룹
- Section 03 ALB/ELB와 타겟 그룹
- Section 04 고가용성 3-tier 구성
# Day 01 — 기본 개념 & Terraform 시작

> 시리즈 매핑: Ch01 (01.01~01.03) + Ch02 (02.01~02.03)

---

## 시간 1: 자동화와 Provisioning
- **시리즈**: 01.01
- **강의 포인트**: 수동 인프라 관리의 문제(재현 불가, 추적 불가, 확장 비용)를 현실 예시로 체감시키기. "콘솔에서 클릭해서 만든 서버를 다시 똑같이 만들 수 있나?"
- **전환**: "이 문제를 해결하는 것이 IaC"

## 시간 2: DevOps, 설정관리, 오케스트레이션
- **시리즈**: 01.01
- **강의 포인트**: Ansible(절차형) vs Terraform(선언형) 비교. "어떻게 만들지" vs "어떤 상태여야 하는지". 경쟁이 아니라 역할이 다르다.
- **전환**: "Terraform은 어디에 위치하는가"

## 시간 3: IaC 개요 — 선언형 vs 절차형, 멀티클라우드
- **시리즈**: 01.01
- **강의 포인트**: Terraform = 멀티클라우드 프로비저닝 도구. Provider 생태계(수천 개). CF 비교 테이블. OpenTofu 언급.
- **전환**: "직접 설치해보자"

## 시간 4: AWS 계정, AWS CLI 설치
- **시리즈**: 01.02 (전반)
- **강의 포인트**: AWS 계정 확인, AWS CLI v2 설치, `aws configure`, credentials 설정. `aws sts get-caller-identity`로 확인.
- **주의**: 수강생 환경 차이(macOS/Linux/Windows) 대응 준비

## 시간 5: Terraform 설치 (tfenv), credentials 설정
- **시리즈**: 01.02 (후반)
- **실습**: `terraform version`, `aws sts get-caller-identity`
- **강의 포인트**: tfenv로 버전 관리, `.terraform-version` 파일, 전역 플러그인 캐시 설정
- **전환**: "환경 준비 완료. HCL을 작성하자"

## 시간 6: 블록·인수·속성, 타입 시스템, terraform console
- **시리즈**: 02.01
- **실습**: terraform console 표현식 실험
- **강의 포인트**: 블록 유형별 레이블 개수, 인수 vs 속성 차이(`(known after apply)`), 기본 타입 + 컬렉션 타입
- **라이브 데모**: terraform console에서 조건식, 문자열 템플릿, 내장 함수 즉석 실험

## 시간 7: provider 블록, default_tags, version constraints
- **시리즈**: 02.02
- **실습**: terraform init, .terraform.lock.hcl 확인
- **강의 포인트**: terraform 블록 + required_providers, version constraint(`~> 6.0`), default_tags 패턴, lock 파일의 역할
- **라이브 데모**: init 실행 → .terraform/ 구조 → lock 파일 내용

## 시간 8: resource 블록, plan/apply/destroy 첫 경험
- **시리즈**: 02.03
- **실습**: SG 생성 → apply → destroy
- **과제**: SG + EC2 배포, SSH 접속 확인
- **강의 포인트**: resource 주소(`aws_security_group.instance`), plan 출력 읽기(`+`/`-`/`~`), apply 승인, destroy 역순 삭제
- **마무리**: "오늘 Terraform으로 첫 리소스를 만들고 부쉈다. 내일 변수, 출력, 그리고 Gallery 앱을 배포한다"

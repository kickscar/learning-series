# Day 06 — 모듈 & 3-tier 완성

> 시리즈 매핑: Ch06 (06.01~06.05 + Gallery)

---

## 시간 1: 모듈 개념 — root/child, variable/output, source
- **시리즈**: 06.01 (이론)
- **강의 포인트**: 모듈 = 디렉토리. root module = 작업 디렉토리, child module = module 블록으로 호출. source `./` 필수. flat composition 권장. "Day 5까지 작성한 모든 코드가 이미 root module이다"
- **전환**: "직접 모듈로 분리해보자"

## 시간 2: Lab — vpc/sg/ec2 단일 파일 모듈 분리
- **시리즈**: 06.01 lab01
- **실습**: vpc/sg/ec2 3개 단일 파일 모듈
- **강의 포인트**: variable = 입력 API, output = 출력 API. 독립 스코프 — 형제 모듈 직접 참조 불가. Provider 자동 상속 (child에 provider 정의 금지). `module.vpc.vpc_id` 참조 → 암묵적 의존성.
- **라이브 데모**: init에서 "Initializing modules..." 확인

## 시간 3: 모듈 경계와 인프라 계층 — 3-Layer, Cross-Cloud
- **시리즈**: 06.02 (이론)
- **강의 포인트**: 모듈화 경계 기본 원칙(재사용, 크기, 변경 빈도). 3-Layer(network/platform/workload). Cross-Cloud 테이블 — "현장에서 레이어 이름은 다를 수 있지만 이런 분리는 흔하다". 변경 빈도 차이, 단방향 의존.
- **전환**: "Day 5 locals의 network/platform/workload가 여기서 모듈이 된다"

## 시간 4: Lab — network 디렉토리 모듈 + NAT GW 확장
- **시리즈**: 06.02 lab01~02
- **실습**: main.tf → vpc.tf + subnet.tf 파일 분리, natgw.tf 추가
- **강의 포인트**: 파일 분리 = 코드 조직 ≠ 인프라 변경 (plan "No changes"). HashiCorp Style Guide. 조건부 NAT GW(count 패턴). "Day 5 locals 구조 → 모듈 variable 진입점" 환기.
- **라이브 데모**: main.tf를 vpc.tf/subnet.tf로 분리 → plan "No changes" 확인

## 시간 5: 모듈 조합 — output→input, graph
- **시리즈**: 06.03 (이론 + lab01)
- **실습**: network + workload 모듈 조합
- **강의 포인트**: `module.network.vpc_id` → workload input. graph에서 모듈 클러스터 시각화. `moved` 블록으로 기존 리소스 → 모듈 이동. module `depends_on` 부작용.
- **라이브 데모**: terraform graph → 모듈 클러스터 확인, apply 순서(network → workload)

## 시간 6: RDS & S3 — 주요 개념
- **시리즈**: 기존 강의 Day 6~7
- **강의 포인트**: RDS — 관리형 RDBMS, 서브넷 그룹, 파라미터 그룹. S3 — 오브젝트 스토리지, 버킷 정책, 버전 관리. Gallery 앱의 H2→MariaDB, 로컬→S3 전환 맥락.
- **전환**: "이제 Gallery에 RDS와 S3를 추가해 3-tier를 완성하자"

## 시간 7: Auto Scaling 개요
- **시리즈**: 기존 강의 Day 6
- **강의 포인트**: ASG 주요 개념, Launch Template, 스케일링 정책. 이 과정에서는 개념만 — 프로젝트에서 선택 구현.
- **전환**: "Gallery 3-tier 완성"

## 시간 8: Gallery — 모듈화 + RDS + S3 — 3-tier 완성
- **시리즈**: 06.04 Gallery
- **과제**: Gallery 3-tier 인프라 완성 확인
- **강의 포인트**: network/platform/workload 3개 모듈. platform에 S3, workload에 RDS 추가. user_data에 DB/S3 연결 정보 주입. "Day 2에서 수동 배포했던 앱이 이제 3-tier 모듈 인프라 위에서 동작한다."
- **마무리**: "모듈 완성. 내일 dev/prod로 환경을 분리한다"

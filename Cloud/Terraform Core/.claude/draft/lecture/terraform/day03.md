# Day 03 — State Management

> 시리즈 매핑: Ch04 (04.01~04.05 + Gallery)

---

## 시간 1: State 역할 — desired vs actual, drift 감지
- **시리즈**: 04.01 (전반)
- **강의 포인트**: State = 코드와 실제 인프라의 매핑. 3대 목적(매핑, 메타데이터, 성능). State 없이 TF 동작 불가.
- **전환**: "drift = 코드 밖에서 인프라가 변경되면?"

## 시간 2: State 파일 구조 — JSON, serial, lineage
- **시리즈**: 04.01 (후반) + 04.02
- **강의 포인트**: `terraform.tfstate` JSON 열어보기. serial(변경 횟수), lineage(이력 체인). `sensitive_attributes` = CLI 마스킹용, State에는 평문. drift 감지/해소 3가지 방법.
- **라이브 데모**: Day 2 Gallery의 tfstate 파일 직접 열어서 구조 확인

## 시간 3: Remote Backend — S3, native locking
- **시리즈**: 04.03 (이론)
- **강의 포인트**: Local State 한계 4가지. S3 backend 필수 인수(bucket, key, region). `use_lockfile = true` (DynamoDB deprecated). `encrypt = true`. backend 블록 변수 참조 불가 → partial config.
- **전환**: "직접 S3에 State를 저장해보자"

## 시간 4: Lab — S3 tfstate 버킷 생성, local→remote 이전
- **시리즈**: 04.03 (lab01 + lab02)
- **실습**: S3 tfstate 버킷 생성, migrate-state, .terraform/terraform.tfstate 확인
- **강의 포인트**: `local.org` / `local.project` / `local.namespace` 패턴 도입. migration 후 로컬 잔여 파일 주의. "처음부터 remote" vs "migration" 두 패턴.
- **라이브 데모**: S3 콘솔에서 State 파일 존재 확인

## 시간 5: State 명령어 — state list / show / mv / rm
- **시리즈**: 04.05 (이론 + lab01 전반)
- **강의 포인트**: `state list` (필터), `state show` (HCL 형식 출력). `state mv` — 이름 변경 시 삭제-재생성 방지, `-dry-run`. `state rm` — 프롬프트 없이 즉시 실행 주의. 선언형 대안(moved, removed 블록).
- **전환**: "import로 기존 인프라를 가져올 수 있다"

## 시간 6: Lab — Gallery state mv→rm→import 복구 시나리오
- **시리즈**: 04.05 (lab01~03, Gallery 활용)
- **실습**: Gallery state 조회 → mv(이름 변경) → rm(State 제거, 서비스 유지) → 콘솔에서 ID 확인 → import로 복구
- **강의 포인트**: "사고가 났다" 시나리오. rm 후 plan에서 "to be created" — 이미 있는데 또 만들려 한다. import로 복구 → "No changes". 현실적인 State 문제 해결 경험.
- **주의**: 반드시 Gallery 인프라가 떠있는 상태에서 진행

## 시간 7: Gallery — user_data + Remote Backend
- **시리즈**: 04.04 Gallery
- **실습**: 처음부터 Remote Backend, user_data + templatefile + systemd 자동화
- **강의 포인트**: Day 2 수동 설치 → 자동화 전환. templatefile 변수 주입(`${profile}`, `${server_port}`). 처음부터 remote = 실무 패턴. `$$` 이스케이프.
- **전환**: "같은 앱인데 배포 방식이 완전히 바뀌었다"

## 시간 8: var.web_port 변경 실험 — EC2 재생성 부수효과
- **시리즈**: 04.04 Gallery (실험 섹션)
- **실습**: plan으로 user_data 변경 → EC2 교체 확인
- **과제**: Gallery user_data 자동 배포 확인
- **강의 포인트**: user_data 변경 → EC2 재생성(`-/+`). SG + 앱 포트 동기화. 부수효과 완화(create_before_destroy, EIP, ALB). `-target`으로 EC2만 삭제해 비용 절감.
- **마무리**: "State 완료. 내일부터 동적 구성 — default VPC를 벗어나 custom VPC를 직접 만든다"

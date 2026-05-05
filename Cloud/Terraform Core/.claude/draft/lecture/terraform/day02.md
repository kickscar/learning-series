# Day 02 — HCL 심화 & Gallery 첫 배포

> 시리즈 매핑: Ch02 (02.04~02.06 Gallery) + Ch03 (03.01~03.03)

---

## 시간 1: variable — 타입, default, validation, -var 플래그
- **시리즈**: 02.04 (이론)
- **강의 포인트**: variable = 외부 입력, locals = 내부 계산. 필수(default 없음) vs 선택(default 있음). type 제약. 우선순위 체계 간단히.
- **전환**: "변수를 선언했으면 검증도 해야지"

## 시간 2: validation 실험, output 객체화, -json + jq
- **시리즈**: 02.04 (lab01~03)
- **실습**: validation 오류 확인, -var 재정의
- **강의 포인트**: `contains()`, 범위 비교, `length()` validation. output을 object로 묶는 이유. `-json` + `jq` 패턴.
- **라이브 데모**: 잘못된 값 → validation 오류 메시지 확인

## 시간 3: locals — 단일 출처, namespace 조립
- **시리즈**: 02.05 (이론 전반)
- **강의 포인트**: locals vs variable 차이. `local.project`가 태그와 리소스 이름의 단일 출처. `variable → local → resource` 흐름.
- **전환**: "고정값은 locals, 동적 조회는 data source"

## 시간 4: data source — AMI 동적 조회, aws_vpc, aws_subnets
- **시리즈**: 02.05 (lab01~02)
- **실습**: 5개 data source 활용 EC2 배포
- **강의 포인트**: data source = 읽기 전용 조회. plan 시점 확정. `aws_ami` filter, `aws_iam_policy_document` 구조화. default VPC를 명시적으로 참조.
- **라이브 데모**: plan 출력에서 data source 값이 확정되는 것 확인

## 시간 5: Execution Model — init/plan/apply 내부 동작
- **시리즈**: 03.01
- **강의 포인트**: plan 3단계(Refresh→Diff→Plan), `-refresh=false`, `-out=tfplan` CI/CD 패턴. State 역할 첫 소개.
- **전환**: "리소스 간 순서는 어떻게 결정하나"

## 시간 6: Dependency Graph, terraform graph, 병렬 실행
- **시리즈**: 03.02
- **실습**: terraform graph 시각화 (Graphviz)
- **강의 포인트**: DAG, 암묵적 의존성(참조), 명시적 의존성(depends_on), 독립 리소스 병렬 처리, `-parallelism`, `-target` 주의사항
- **라이브 데모**: terraform graph | dot -Tsvg → 브라우저에서 확인

## 시간 7: Gallery — EC2에 Gallery 앱 수동 배포
- **시리즈**: 02.06 Gallery
- **실습**: SSM 접속, JDK 설치, Maven 빌드, 앱 실행
- **강의 포인트**: IAM Role + SSM 패턴 (SSH 없이 접속). 수동 설치의 번거로움 체감 → Day 3에서 자동화. "지금 하는 이 작업을 내일 user_data로 자동화한다"
- **주의**: Maven 빌드 시간(3~5분) 동안 lifecycle 이론 진행 가능

## 시간 8: lifecycle — create_before_destroy, prevent_destroy
- **시리즈**: 03.03
- **실습**: lifecycle 블록 실험
- **과제**: Gallery 앱 브라우저 접속 확인
- **강의 포인트**: `create_before_destroy`(+/- 기호), `prevent_destroy`(전체 destroy 차단), `ignore_changes`, `-replace`
- **마무리**: "HCL 문법 완료. 내일은 State — Terraform이 인프라를 어떻게 추적하는지"

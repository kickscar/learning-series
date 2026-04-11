# write/gallery — Gallery 실습 작성

## 목적

plan 파일 기반으로 Gallery 실습 draft를 작성한다.
Gallery는 시리즈를 관통하는 누적 실습으로, gallery-spring-boot 앱 인프라를 점진적으로 확장한다.

## 입력

- `.claude/plan/{ch_no}-*.md` — Gallery 내용
- `.claude/plan/series-hierarchy.md` — Gallery 누적 흐름
- `.claude/research/{ch_no}.{sec_no}.md` — 조사 결과 (있으면)

## 출력

- `.claude/draft/{ch_no}.{sec_no}.claude.notion.md`

## 실행 단계

### 1. 누적 상태 파악

- series-hierarchy.md의 Gallery 진화 테이블 확인
- 이전 Gallery에서 무엇이 구성되었는지 파악
- 이번 Gallery에서 무엇이 추가/변경되는지 식별

### 2. 디렉토리 구조 결정

- Ch03~06: 기본 구조 (flat)
- Ch07~: 모듈화 구조 (modules/ 포함)

### 3. 작성

- `template.md` 구조에 따라 작성
- 이전 Gallery 코드 복사 지침 포함
- 이번 챕터에서 변경되는 부분 강조

### 4. 결과 확인

- `terraform output` — 필수
- `az CLI` 확인 — 필수
- Gallery 앱 브라우저 접근 — 해당 시 (Ch05 Gallery부터)

### 5. 규칙 검증

모든 rules/ 파일 대조

## Gallery 특성

| 항목 | 규칙 |
|------|------|
| 네이밍 | `azure-iac-gallery-{env}-{layer}-{capability}-{role}` |
| 누적 | 이전 Gallery 코드를 복사하고 확장 |
| 정리 | terraform destroy (다음 Gallery에서 다시 복사) |
| 워크로드 | gallery-spring-boot (Spring Boot 3.5.x, Java 21) |
| 앱 설명 | gallery-spring-boot 자체를 설명하지 않음 |

## Gallery 앱 관련 주의

- Gallery 앱(gallery-spring-boot)은 Azure Fundamentals에서 이미 사용
- 앱 자체 설명(Spring Boot, Thymeleaf 등)은 하지 않음
- 인프라 구성과 연결 방법만 다룸
- Azure 특화 사항 (Instance ID 환경변수, Blob Storage 연동 등)은 설명

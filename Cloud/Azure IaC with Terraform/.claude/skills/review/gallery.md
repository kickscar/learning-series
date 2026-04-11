# review/gallery — Gallery 검토

## 목적

Gallery 실습 draft의 구조·규칙·누적 흐름 준수 여부를 검토한다.

## 체크리스트

### 1. 파일명·위치

- [ ] 파일명: `{ch_no}.{sec_no}.claude.notion.md` (챕터 Gallery 섹션 번호)

### 2. 구조 준수

- [ ] 문서 시작: `# Gallery: {제목}` 없이 개요 문단으로 시작
- [ ] 필수 섹션: 개요, 실습 목표, 전체 아키텍처, 사전 준비, Gallery 실습, 결과 확인, 자원 정리

### 3. 누적 흐름 연속성

- [ ] 이전 Gallery 전제 조건 명시
- [ ] 이전 Gallery 코드 복사 지침 (`cp` 명령어)
- [ ] 이번 Gallery에서 변경되는 부분 명확히 구분
- [ ] Gallery 진화 테이블과 일치

### 4. Gallery 워크로드

- [ ] gallery-spring-boot 기반
- [ ] 앱 자체 설명 없음 (인프라 구성만)
- [ ] 네이밍: `azure-iac-gallery-{env}-{layer}-{capability}-{role}`

### 5. HCL 완성도

- [ ] 모든 .tf 파일 포함
- [ ] 파일 구조 다이어그램
- [ ] Ch07 이후: modules/ 구조 포함

### 6. 결과 확인

- [ ] **terraform output** — 필수
- [ ] **az CLI 확인** — 필수
- [ ] Gallery 앱 접근 확인 (Ch05 Gallery부터)

### 7. 자원 정리

- [ ] terraform destroy 포함
- [ ] 다음 Gallery 코드 복사 안내

### 8. 코드 블록 규칙

- [ ] 언어 지정: `hcl`, `bash`, `text`
- [ ] `### 참고` 블록으로 Terraform Registry 링크

### 9. 시리즈 원칙

- [ ] Azure 서비스 기초 설명 없음
- [ ] gallery-spring-boot 설명 없음

## 판정

- **OK**: 수정 불필요
- **수정 필요**: 위치 + 사유 명시
- **기술 오류**: 플래그 (사용자 확인 필요)

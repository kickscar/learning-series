# Skill: review/gallery

Gallery draft 검토 스킬.

---

## 체크리스트

### 1. 파일명 및 위치

- [ ] 파일명: `{ch_no}.gallery.claude.notion.md` (섹션 번호 없음)
- [ ] Gallery는 챕터 종속 — 섹션 번호 포함 시 오류

### 2. 구조 준수

- [ ] 최상위 헤딩: `# Gallery: {실습 제목}` (챕터명 포함 불필요)
- [ ] 필수 섹션: 개요, 전제 조건, 파일 구조, Gallery 실습, 결과 확인, 정리(destroy)

### 3. 누적 흐름 연속성

- [ ] 전제 조건: 이전 Gallery 또는 선행 Section Lab 명시
- [ ] 이전 Gallery에서 변경되는 내용 명시 (개요 또는 별도 섹션)
- [ ] 이전 Gallery 코드 복사 지침 있음 (Ch01 제외):
  - 복사 대상 디렉토리 명시
  - modules/ 포함 여부 명시 (모듈화된 Gallery의 경우)

### 4. Gallery 워크로드

- [ ] gallery-spring-boot 앱 기준 실습 (Spring Boot 3.5.x, Java 21)
- [ ] EC2 인프라 기준 실습
- [ ] 리소스명 규칙: `tf-core-gallery-{type}` (rules/style-guide.md)

### 5. HCL 코드 완결성

- [ ] 실습에 필요한 모든 `.tf` 파일 코드 포함
- [ ] 파일 구조 다이어그램 있음 (Gallery 디렉토리 기준)
- [ ] 모듈화 Gallery (Ch05+): `modules/` 하위 구조 포함

### 6. 샌드박스 종료

- [ ] Gallery 마지막에 `terraform destroy` 단계 있음
- [ ] destroy 범위 명시 (Gallery 인프라만 / Backend S3 제외 등)

### 7. 결과 확인

- [ ] C방식 (terraform output) 필수 포함
- [ ] A방식 (AWS CLI) 선택 포함 권장

### 8. 코드 블록 규칙 (rules/code-blocks.md)

- [ ] HCL 코드: ` ```hcl `
- [ ] CLI 명령어: ` ```bash `
- [ ] 출력 결과: ` ```text `

### 9. TF Core 원칙

- [ ] gallery-spring-boot 앱 자체 설명 없음 (배포 수단으로만 언급)
- [ ] AWS 서비스 동작 설명 없음

---

## 판정 기준

- **OK**: 모든 항목 통과 — README 작성 진행
- **수정 필요**: 위치 + 이유 명시 후 writer 재실행 요청
- **기술 오류 의심**: 별도 flagging, 수정은 사용자 판단

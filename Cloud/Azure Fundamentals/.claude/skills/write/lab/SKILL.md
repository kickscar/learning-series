# Skill: write/lab

섹션 실습 draft 작성 스킬.
이론(write/concept) 다음에 연속으로 하나의 draft 파일에 작성.

---

## 입력

- `plan/{ch_no}-*.md` — lab 번호, 실습 내용, 생성 리소스
- `.claude/research/{ch_no}.{sec_no}.md` — 콘솔 경로, 설정 필드, 용어

## 출력

`.claude/draft/{ch_no}.{sec_no}.claude.notion.md` (lab 파트 추가)

---

## 실행 절차

### 1. 정보 수집
- plan 파일에서 lab 번호, 목표, 생성 리소스 목록 확인
- research note에서 콘솔 경로 순서와 설정 필드 확인

### 2. 작성 구조 결정
- H1 단계명은 각 작업에 맞게 명명 (고정 이름 없음)
- `전체 아키텍처`, `사전 준비`는 고정
- 이후 단계: 리소스/작업 단위로 직접 H1 부여

### 3. 콘솔 스텝 작성 패턴
```
## 1. Azure Portal > {서비스} > **{최종 화면}**

[콘솔화면: Azure Portal > {서비스} > {화면} > {핵심 포인트}]

**설정:**

- {필드명}: **`{값}`**
```

- research note의 콘솔 경로를 그대로 반영
- 확인 스텝은 `**설정:**` 대신 `**확인:**` 사용

### 4. 규칙 준수 확인
참조: `.claude/rules/`

| 규칙 | 확인 항목 |
|------|----------|
| style-guide | H1 타이틀 없이 시작, 설정값 볼드+백틱, 콘솔 경로 형식 |
| korean-writing | ~다 체, 영문 용어 기준 |
| diagram-gen | 전체 아키텍처 다이어그램 + 해설 |
| code-blocks | bash 명령어 언어 지정 |

---

## 주의사항

- 이론 파트 끝(`# 참고 자료`) 다음에 `# [실습] lab{no}: {제목}` H1으로 실습 시작
  → 이론/실습 경계 구분 + Notion에서 Section / Lab 페이지 분리 기준
- 자원 정리: 섹션 lab은 리소스 삭제 목록 명시

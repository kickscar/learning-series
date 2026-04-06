# Skill: write/concept

이론/개념 섹션 draft 작성 스킬.

---

## 입력

- `plan/{ch_no}-*.md` — 섹션 내용, 학습 목표
- `.claude/research/{ch_no}.{sec_no}.md` — 콘솔 경로, 용어 매핑, 버전 정보

## 출력

`.claude/draft/{ch_no}.{sec_no}.claude.notion.md` (이론 파트)

---

## 실행 절차

### 1. 정보 수집
- plan 파일에서 섹션 목표와 다룰 개념 목록 확인
- research note에서 Azure 용어, 버전, 콘솔 경로 확인

### 2. 구조 선택
- **구조 1**: 범용 개념 (Cloud 기초, 네트워크 기본 등)
- **구조 2**: 서비스/리소스 중심 (연결 구조가 핵심인 경우)
- `template.md`의 구조 선택 기준 참조

### 3. 작성
- `template.md` 구조를 기반으로 본문 작성
- 템플릿의 메타 섹션(사용 규칙, 구조 선택 기준)은 draft에 포함하지 않음
- 첫 H1 전에 개요 단락 작성 (1~3줄)

### 4. 규칙 준수 확인
참조: `.claude/rules/`

| 규칙 | 확인 항목 |
|------|----------|
| style-guide | 헤딩 형식, 볼드 없는 헤딩, 이미지 플레이스홀더 |
| korean-writing | 영문 용어 기준, 첫 등장 한글 병기, ~다 체 |
| diagram-gen | mermaid 해설 2~4줄, 플레이스홀더 구체성 |
| code-blocks | 언어 지정, 인라인 코드 |

---

## 주의사항

- research note의 용어 매핑을 그대로 사용 (임의 번역 금지)
- 참고 자료 URL은 `CLAUDE.md > 플랫폼 상수`의 공식 문서 URL 기준

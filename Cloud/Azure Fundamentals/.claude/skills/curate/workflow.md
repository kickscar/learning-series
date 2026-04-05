# Skill: curate/workflow

## 목적

시리즈 구조 변경 시 모든 관련 파일과 디렉토리를 일관성 있게 업데이트한다.
범용 설계 — series-hierarchy.md를 Single Source of Truth로 사용한다.

---

## 실행 순서

### Phase 0 — 변경 유형 분류

아래 기준으로 변경 유형을 판단해 영향 범위를 결정한다.

```
섹션 내용 변경    → plan + 해당 draft + (Lab 재정렬 여부 판단)
섹션 추가/삭제/순서 → plan + 전역 draft + 디렉토리 + Lab 재정렬
챕터 추가/삭제/순서 → plan + 전역 draft + 디렉토리 + Lab 재정렬
Lab 내용만 변경   → plan + 해당 draft (번호 변경 없으면 재정렬 불필요)
```

---

### Phase 1 — 영향 분석 및 보고 (사용자 승인 전)

아래 형식으로 영향 범위를 보고한다.

```
## 변경 영향 분석

### 변경 내용
- {요청된 변경 사항}

### 영향받는 파일
- series-hierarchy.md
- plan/{파일명}
- draft/{파일명} (번호 업데이트)
- draft/{파일명} (내용 재작성 필요 — writer 대상)

### 디렉토리 변경
- {현재 경로} → {변경 후 경로}

### Lab 번호 재정렬
- lab{N} ~ lab{M} 전체 재정렬 필요
- (또는) 재정렬 불필요

진행할까요?
```

---

### Phase 2 — 사용자 승인 대기

사용자가 "응", "그렇게 해", "진행해" 등으로 확정하면 Phase 3 실행.
거절하거나 수정 요청 시 Phase 1로 돌아간다.

---

### Phase 3 — curator.lock 생성

```
.claude/memory/curator.lock 생성
내용: 변경 작업 시작 시각 + 변경 내용 요약
```

---

### Phase 4 — 일괄 변경 실행 (순서 엄수)

#### 4-1. series-hierarchy.md 수정
Single Source of Truth. 가장 먼저 반영.

#### 4-2. chapter plan 파일 수정
영향받는 plan 파일의 섹션 구성, Lab 번호 업데이트.

#### 4-3. Lab 전역 번호 재정렬
시리즈 전체에서 lab01부터 갭 없이 순차 재정렬.
모든 영향받는 plan 파일과 draft 파일에 번호 반영.

#### 4-4. draft 파일 업데이트
- 파일명 변경 필요 시 rename (섹션 번호 변경 등)
- 파일 내 Lab 번호 참조 업데이트
- 파일 내 섹션/챕터 번호 참조 업데이트
- **내용 재작성은 하지 않는다** — 해당 파일 writer 플래그로 표시

#### 4-5. 디렉토리 이름 변경
챕터·섹션 폴더명 변경 실행.
변경 후 plan/draft 내 경로 참조 업데이트.

---

### Phase 5 — curator.lock 삭제

변경 작업 완료 후 lock 파일 삭제.

---

### Phase 6 — 결과 보고 및 context_bridge.md 기록

보고 형식:
```
## curator 작업 완료

### 변경 실행 내역
- series-hierarchy.md 업데이트
- plan 파일 {N}개 수정
- draft 파일 {N}개 번호 업데이트
- 디렉토리 {N}개 변경
- Lab 재정렬: lab{N} ~ lab{M}

### writer 재작성 필요
- {파일명}: {이유}
```

context_bridge.md에 `[구조 변경]` 태그로 append.

---

## Lab 번호 재정렬 규칙

- Lab 번호는 시리즈 전체에서 **갭 없이** 순차 증가
- 삭제·삽입이 발생하면 **후순위 전체 재정렬**
- Gallery lab은 번호 없음 — 재정렬 대상 아님
- 재정렬 후 series-hierarchy.md의 Lab 번호 맵 먼저 업데이트, 이후 각 파일 반영

---

## 변경하면 안 되는 것

- draft 파일의 **내용** (번호·참조만 업데이트)
- 사용자가 작성한 실습 예제 파일
- context_bridge.md 기존 기록

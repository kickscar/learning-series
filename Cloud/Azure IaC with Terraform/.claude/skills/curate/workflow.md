# curate/workflow — 구조 변경 워크플로우

## 목적

시리즈 구조 변경(챕터/섹션 추가·삭제·재배치)을 체계적으로 처리한다.

## 실행 단계

### Phase 0: Lock

- `curator.lock` 파일 생성
- writer 에이전트 작업 차단

### Phase 1: 변경 범위 식별

| 변경 유형 | hierarchy | plan | draft | 디렉토리 |
|----------|-----------|------|-------|---------|
| 섹션 내용 수정 | — | ✓ | ✓ | — |
| 섹션 추가/삭제 | ✓ | ✓ | ✓ | ✓ |
| 섹션 이동/재배치 | ✓ | ✓ | ✓ | ✓ |
| 챕터 변경 | ✓ | ✓ | ✓ | ✓ |

### Phase 2: SSoT 업데이트

- `series-hierarchy.md` 수정 (Single Source of Truth)
- 챕터/섹션 테이블 업데이트
- Lab 번호 맵 업데이트
- Gallery 맵 업데이트
- 작업 상태 업데이트

### Phase 3: Plan 파일 업데이트

- 해당 챕터 plan 파일 수정
- 섹션 번호, Lab 번호, Draft 파일명 반영

### Phase 3.5: 동기화 검증

- `curate/sync` 스킬 실행
- SSoT와 파일시스템 일치 여부 확인

### Phase 4: 디렉토리 구조 업데이트

- 필요한 디렉토리 생성/삭제/이름 변경
- 사용자 승인 후 실행

### Phase 5: Draft 파일 처리

- 번호 변경 시 파일명 수정
- 내용 재작성 필요 시 플래그 (`[REWRITE NEEDED]`)
- 내용이 있는 파일 삭제 시 사용자 확인

### Phase 5.5: progress.md 업데이트

- 변경 사항 반영

### Phase 6: 완료

- `curator.lock` 삭제
- `context_bridge.md`에 변경 기록 (날짜 + 변경 내용)
- 사용자에게 결과 보고

## 규칙

- 사용자 승인 없이 파일 수정하지 않음
- curator.lock이 있는 동안 writer 작업 불가
- 내용이 있는 파일을 삭제할 때는 반드시 사용자 확인

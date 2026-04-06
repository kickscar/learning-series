# Skill: research/version-check

## 목적

섹션에서 다루는 서비스의 현재 버전, SKU, 지원 기능을 확인하고
draft에 기재할 버전 정보의 정확성을 보장한다.
범용 설계 — 어떤 서비스 섹션에도 적용 가능.

> 공식 릴리스 노트 URL과 공식 문서 URL은 `CLAUDE.md > 플랫폼 상수` 참조.

---

## 조사 항목

### 1. 서비스 버전 / SKU
- 현재 GA(Generally Available) 버전
- 지원 종료(Deprecated) 항목 (예: MySQL Single Server → Flexible Server)
- 권장 SKU / 비권장 SKU

### 2. 기능 변경사항
- 최근 Preview → GA 전환 기능
- 콘솔에서 제거되거나 이름이 바뀐 기능
- 지역(Region) 가용성 주의사항

### 3. 가격 / 무료 계층
- 실습에 사용할 SKU의 무료 계층 여부
- GCP 무료 계정 한도 내 실습 가능 여부

---

## 출력 형식

`console-flow.md` 결과와 동일한 research 파일의 **별도 섹션**으로 추가.

```markdown
## 버전 및 서비스 정보

| 항목 | 현재 기준 | 비고 |
|------|----------|------|
| MySQL 버전 | 8.0, 8.4 | Single Server deprecated |
| SKU | Burstable B1ms | 무료 계층 해당 없음 |
| ... | ... | |

## 주의사항
- {deprecated 항목, 변경 예정 사항 등}
```

---

## 조사 방법

> 공식 릴리스 노트 URL, 공식 문서 URL, 콘솔 이름은 `CLAUDE.md > 플랫폼 상수` 참조.

1. 공식 릴리스 노트 검색
2. 공식 문서 서비스별 "What's new" 섹션
3. 콘솔 직접 확인 (SKU 선택 화면 등)

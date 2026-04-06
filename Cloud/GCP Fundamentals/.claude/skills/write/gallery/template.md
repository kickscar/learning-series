# Template: write/gallery

Gallery 시리즈 실습 draft 작성 템플릿 (Azure Fundamentals)

---

## 사용 규칙

- 헤딩 없이 시작 (Notion 타이틀이 대신)
- ⚠️ 비용 주의 섹션 없음
- Gallery 인프라는 다음 Chapter에서 이어서 사용 — 자원 정리 시 삭제하지 않음
- 설정값 표기: `{값이름}` (예: azure-fund-gallery-rg) — 독자 환경에 따라 다를 수 있음
- 각 리소스 단계: `### 1. 설정값` + `### 2. 참고` 구조
- 스크린샷: `[콘솔화면: ...]` 플레이스홀더 명시 — 검증/실행 단계에서 사용
- Gallery 공용 Resource Group: `azure-fund-gallery-rg` (누적 관리)
- 리소스명 규칙: `{type}-gallery-{suffix}` (예: `vnet-gallery`, `snet-pri-gallery`)

---

## 템플릿

---

{실습 설명 1~2줄. Gallery 앱에 무엇이 바뀌는지, 어떤 인프라가 추가/변경되는지 요약.}

### 실습 목표

- {목표 1}
- {목표 2}
- {목표 3}

---

# 1. 전체 아키텍처

[이미지: 전체 아키텍처 - {구성 요소 강조 포인트} - {이번 Lab에서 추가/변경된 부분}]

```mermaid
{다이어그램 (선택)}
```

{아키텍처 해설 2~4줄. 이번 Chapter에서 달라진 점을 중심으로.}

---

# 2. 사전 준비

- Location: **`{location}`** (예: Korea Central)
- {이전 Gallery Lab 완료 여부}: `{lab 또는 섹션명}` 완료
- Gallery Resource Group: `azure-fund-gallery-rg` 유지 중

---

# 3. {리소스명 1}

{이 리소스를 왜 만드는지 1줄 설명}

### 1. 설정값

**{리소스 타입}**

- {필드명}: `{값이름}` (예: azure-fund-gallery-...)
- {필드명}: `{값이름}` (예: ...)

### 2. 참고

- [섹션 실습 lab{no}: {실습 제목}]({Notion 링크})

---

# 4. {리소스명 2}

{설명}

### 1. 설정값

**{리소스 타입}**

- {필드명}: `{값이름}` (예: ...)
- {필드명}: `{값이름}` (예: ...)

### 2. 참고

- [섹션 실습 lab{no}: {실습 제목}]({Notion 링크})

---

... 리소스 단계 반복 ...

---

# {n}. 리소스 확인

## 1. Azure Portal > Resource groups > **azure-fund-gallery-rg**

[콘솔화면: Azure Portal > Resource groups > azure-fund-gallery-rg > 리소스 목록]

**확인:**

- 이번 Lab에서 추가된 리소스가 목록에 있는지 확인한다.

---

# {n+1}. 애플리케이션 실행

## 1. {접속 방법 — SSH, Bastion, Serial Console 등}

{설명}

## 2. {실행 명령}

```bash
{명령어}
```

**확인:**

- {확인 항목}

---

# {n+2}. 실행 및 결과 검증

## 1. {검증 항목}

[콘솔화면: Azure Portal > {서비스} > {화면} > {정상 상태 설명}]

**확인:**

- {확인 항목}

---

# {n+3}. 자원 정리

Gallery 인프라는 다음 Chapter에서 이어서 사용한다. 기본적으로 유지한다.

비용 절감이 필요한 경우 다음을 중지한다 (삭제 아님):

- VM 중지: `{vm-gallery-...}`
- {기타 중지 가능 리소스}: `{리소스명}`

# 06 Azure Storage / 04 Storage 접근 제어

계정 키·SAS·Entra ID RBAC 세 접근 방식을 비교하고, 읽기 전용 SAS로 시간·권한 제한 접근을 확인하는 실습(lab18).

## What you will learn

- 세 방식 — 계정 키(계정 전체 full, 지양) vs SAS(제한 토큰) vs Entra ID RBAC(권장). 우선순위 Entra > SAS > 키
- SAS 유형 — Service/Account(계정 키 서명) vs User Delegation(Entra 서명, 권장)
- SAS 구성 — 권한·만료·범위·프로토콜
- Stored Access Policy — 서버 측 즉시 취소

## Lab

- **lab18: SAS Token 생성 및 접근 제어** (`rg-lab18`)
  - `stlab18` → 읽기 전용 SAS → SAS 성공 / SAS 없이·쓰기·만료 차단

## Reference

- Draft: `.claude/draft/06.04.claude.notion.md`
- Notion: [Notion 문서]()

# 02 Azure IAM & Microsoft Entra ID / 05 RBAC

Azure RBAC으로 리소스 권한을 부여하는 방법을 이해하고, Reader 역할을 직접 할당해 접근이 열리고 닫히는 것을 확인하는 섹션. Ch02 신원 아크의 마무리.

## What you will learn

- RBAC 역할 할당의 세 요소: Security Principal(누구) + Role Definition(무엇) + Scope(어디)
- Owner / Contributor / Reader의 차이와 Custom Role
- 범위와 상속(Subscription → RG → Resource), 누적 권한
- 최소 권한 원칙

## Examples

- `lab04` → rg-lab04에 Reader 역할 할당·접근 검증, 역할 제거 후 차단 확인

## Reference

- Draft: `.claude/draft/02.05.claude.notion.md`
- Notion: [Notion 문서]()

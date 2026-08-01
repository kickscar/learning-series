# 08 관측과 운영 - Azure Monitor / 01 Azure Monitor 개요와 메트릭·로그

Azure Monitor의 구조(Metrics/Logs)와 플랫폼 vs 게스트 메트릭을 이해하고, Log Analytics·Diagnostic settings·KQL을 구성하는 실습(lab23).

## What you will learn

- Azure Monitor 구조 — Metrics(시계열) + Logs(Log Analytics Workspace + KQL) 통합 우산
- **플랫폼 메트릭(호스트 CPU·네트워크) 자동·무료 vs 게스트(메모리·디스크) AMA 필요** — CloudWatch Agent 대칭("Azure 다 자동" 미신 깨기)
- Diagnostic settings 라우팅 + KQL 기초
- AWS 비교 — Monitor 통합 우산 vs CloudWatch+X-Ray 분산

## Lab

- **lab23: Azure Monitor 메트릭·로그 구성** (`rg-lab23`)
  - `vm-lab23` Metrics Explorer(플랫폼) → `log-lab23` Workspace + Diagnostic settings → KQL

## Reference

- Draft: `.claude/draft/08.01.claude.notion.md`
- Notion: [Notion 문서]()

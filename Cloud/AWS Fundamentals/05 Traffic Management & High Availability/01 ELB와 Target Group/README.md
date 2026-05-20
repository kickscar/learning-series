# 05 Traffic Management & High Availability / 01 ELB와 Target Group

ELB를 ALB/NLB/GLB 관점에서 개관하고, Target Group을 통해 "Public 엔드포인트는 ALB로, 애플리케이션 서버는 Private Subnet으로" 배치하는 실무 표준 패턴을 만든다.

## What you will learn

- Load balancing의 목적(분산, 고가용성, 장애 격리)
- ALB/NLB/GLB 개관과 차이점(사용 시점)
- Target Group과 Health check(특히 HTTP 앱에서 ALB가 선호되는 이유)
- Health check가 트래픽 제어에 미치는 영향
- ALB Public + EC2 Private 배치 패턴과 SG 설계 포인트

## Examples

- `Gallery: ALB와 Target Group 구성` -> 8080, `/actuator/health`, Private EC2 2대 등록, 분산 확인

## Reference

- Draft: `.cursor/draft/05.01.notion.cursor.md`
- Notion: [Notion 문서]()

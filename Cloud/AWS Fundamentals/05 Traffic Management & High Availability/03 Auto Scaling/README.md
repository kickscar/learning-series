# 05 Traffic Management & High Availability / 02 Auto Scaling

Launch Template과 Auto Scaling Group을 구성해 서버 용량을 자동으로 늘리고 줄이는 구조를 만든다. ALB Target Group과 연동해 인스턴스 등록/해제가 자동으로 이루어지는 흐름을 확인한다.

## What you will learn

- Auto Scaling이 해결하는 문제(수요 변화, 장애 대응)
- Launch Template이 표준화하는 것(AMI, SG, user data)
- ASG의 Min/Desired/Max와 Multi-AZ 배치
- ASG와 Target Group 연동 구조

## Examples

- `Gallery: Auto Scaling Group` -> Golden AMI + user-data, AZ-a/AZ-c 분산 배치, Target Group 자동 등록/해제 및 증감 검증

## Reference

- Draft: `.cursor/draft/05.02.notion.cursor.md`
- Notion: [Notion 문서]()

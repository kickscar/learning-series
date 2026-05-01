# Ch05 모듈 / [실습] Gallery: 인프라 모듈화

Ch04 Gallery의 단일 EC2 구조를 05.02 lab04의 3-Layer 모듈(network/platform/workload) 기반으로 전환하고, Launch Template + ASG로 Gallery 앱을 고가용성으로 배포한다.

## What you will learn

- 3-Layer 모듈(network/platform/workload)을 Gallery에 적용 — 모듈 코드 재사용, 입력값만 변경
- workload 모듈을 EC2 단일 인스턴스에서 Launch Template + ASG로 전환
- `aws_launch_template`의 `user_data`는 `base64encode()` 필수 — `aws_instance`와의 핵심 차이
- ASG `target_group_arns`로 인스턴스를 Target Group에 자동 등록
- `health_check_type = "ELB"` + `health_check_grace_period`로 앱 시작 시간 보호

## Reference

- Notion: [Notion 문서]()

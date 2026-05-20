# Ch07 환경 분리 / [실습] Gallery: 단일코드 환경 분리

07.04 Gallery에서 체감한 코드 이중화를 단일 코드 + `-var-file` + Partial Backend Configuration으로 해결한다. 07.01의 변수 입력 방식이 환경 분리의 문제까지 해결하는 것을 확인한다.

## What you will learn

- 단일 코드에서 `-var-file`로 환경별 설정 주입 (코드 이중화 없음)
- Partial Backend Configuration: `-backend-config`로 환경별 State 경로 분리
- 단일코드 방식의 주의점 (`-reconfigure` 필수)과 CI/CD에서의 해결
- 디렉토리 분리(07.04)와의 비교: 대부분의 인프라 프로젝트에서 단일코드 방식이 무난

## Reference

- Notion: [Notion 문서](https://www.notion.so/05-Gallery-362dc703ccda80c593aadce3be2b7746?source=copy_link)

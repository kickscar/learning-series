# Ch10 배포 자동화 / [실습] Gallery: 멀티환경 배포

09.03 Gallery(상시 헬스 체크)를 CI/CD 멀티환경 배포로 연결한다. 07.05의 단일코드 패턴(-var-file + -backend-config)을 GitHub Actions deploy.yml로 자동화하고, dev 자동 배포 → prod 수동 승인 순차 전략을 구현한다.

## What you will learn

- 07.05 단일코드 패턴을 CI/CD에 그대로 연결 (로컬 명령 = CI step)
- GitHub Environments + Required reviewers로 prod 승인 게이트
- `needs:` 의존성으로 dev → prod 순차 배포
- 환경별 concurrency group으로 동시 배포 방지
- Gallery 인프라의 시리즈 최종 완성 형태

## Reference

- Notion: [Notion 문서](https://www.notion.so/05-Gallery-364dc703ccda80f59efcdb5f127cce2f?source=copy_link)

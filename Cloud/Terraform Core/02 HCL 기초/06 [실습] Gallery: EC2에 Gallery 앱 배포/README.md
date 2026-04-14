# Ch02 HCL & 핵심 블록 / [실습] Gallery: EC2에 Gallery 앱 배포

Ch02에서 학습한 HCL 블록 전체를 조합해 EC2에 Gallery 앱을 배포한다. SSM으로 접속해 JDK 설치, 소스 빌드, 앱 실행을 직접 수행한다. 시리즈 Gallery 실습의 첫 번째 단계.

## What you will learn

- Ch02 블록 전체(provider, resource, variable, output, locals, data source) 조합
- `local.namespace`로 환경 인식 리소스 네이밍
- data source 5개로 AMI, VPC, subnet, AZ, IAM 정책을 동적 조회
- IAM Role + SSM 패턴으로 SSH 없이 인스턴스 접속
- SSM Session Manager로 Gallery 앱을 수동 설치·실행
- Gallery 시리즈 실습의 기준 인프라 구성 (이후 Ch04→Ch06→Ch07→Ch09으로 누적 발전)

## Gallery Project

- `Gallery: EC2에 Gallery 앱 배포` → EC2 + SG + IAM/SSM 프로비저닝, SSM 접속 후 수동 설치. 최초 배포

## Reference

- Notion: [Notion 문서](https://www.notion.so/06-Gallery-EC2-Gallery-33ddc703ccda8074b3f1eed70204a7f4?source=copy_link)

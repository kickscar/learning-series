# 06 S3와 CloudFront - Storage & Content Delivery / 03 정적 웹 호스팅과 CloudFront

S3 정적 웹 호스팅을 구성한 뒤, CloudFront Distribution과 OAC로 운영형 배포(CloudFront만 S3 Origin 접근)를 완성한다. Chapter 마지막 Section으로 Gallery 업로드 저장소를 S3로 전환하는 프로젝트 Lab을 포함한다.

## What you will learn

- S3 정적 웹 호스팅의 구성 요소(Index/Error, Website endpoint)
- CloudFront가 CDN으로서 하는 일(Edge cache, Origin 보호)
- OAC로 S3 direct access를 차단하고 CloudFront만 허용하는 패턴
- 캐시 무효화(invalidation)의 위치와 의미

## Examples

- `lab19` -> S3 정적 호스팅 구성, CloudFront Distribution 생성, OAC 적용, CloudFront 도메인 접근 검증
- `lab19/` 디렉터리: **Hello S3 Web** 정적 예제(`index.html`, `error.html`, `css/style.css`, `images/…`) — Bucket 업로드 시 폴더 구조 유지. `error.html`은 외부 CSS·이미지 없이 단독 파일로 두어 Error document(응답 본문 대체, 리다이렉트 아님) 동작을 가정

## Gallery Project

- `Gallery: S3 연동` -> Gallery 업로드 저장소를 S3로 전환(EC2 IAM Role 권한 추가, `app.storage.type=s3`)

## Reference

- Draft: `.cursor/draft/06.03.notion.cursor.md`
- Notion: [Notion 문서]()

# 05 Traffic Management & High Availability / 04 [실습] Gallery: Load Balancer 이전

"프로비저닝 자동화"에서 구운 골든이미지 `img-gallery-web`에서 `vm-gallery-web`을 두 대 찍어 Public Load Balancer 뒤에 넣는 Gallery 실습. VM에 Public IP 없이 외부 노출을 열고, "Gallery Custom VNet 이전"의 "외부 접속 불가"를 해소한다.

## What you will learn

- 골든이미지에서 동일 인스턴스 2대를 손 배포 없이 스핀업 — bake 다중성(LB가 부른 "여러 백엔드"를 이미지가 채움)
- Public IP 없는 Private Subnet 2 VM을 Public LB로 노출 — VM 대신 서비스만 노출(진짜 private 패턴)
- LB Rule 포트 매핑 — 프런트 `80` → 백엔드 `8080`
- LB 분산을 페이지 푸터 `Instance:` 로 확인(요청 처리 인스턴스 = hostname)
- 백엔드 NSG에 `Internet` 소스 `8080`(secure by default), Health Probe로 `/actuator/health` 활용

## Lab (Gallery)

- `rg-gallery` 누적. `img-gallery-web`에서 `vm-gallery-web-1/-2` 스핀업(Public IP 없음, `snet-gallery-priv`)
- `lb-gallery`(Standard Public) 프런트엔드 `pip-gallery-lb` → 백엔드 `vm-gallery-web-1/-2:8080`
- 새로고침 시 푸터 `Instance` 가 두 VM 사이 교차 → 분산 확인

## Reference

- Draft: `.claude/draft/05.04.claude.notion.md`
- Notion: [Notion 문서]()

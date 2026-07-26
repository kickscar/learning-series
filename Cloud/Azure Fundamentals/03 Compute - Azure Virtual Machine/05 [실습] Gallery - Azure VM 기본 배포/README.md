# 03 Compute - Azure Virtual Machine / 05 [실습] Gallery - Azure VM 기본 배포

Gallery Spring Boot 앱을 Azure VM에 처음 배포하는 시리즈 실습(Ch03 캡스톤). Bastion으로 접속해 JDK 설치·소스 빌드·systemd 등록을 손으로 수행하고, Public IP `:8080`으로 접속을 확인한다. 앱·DB·업로드가 VM 하나에 얹힌 All-in-One에서 출발하며, 이 수동 배포의 수고가 다음 섹션(골든 이미지)의 동기가 된다.

## What you will learn

- Gallery 공용 RG(`rg-gallery`): 삭제 없이 챕터 넘어 누적
- Bastion 접속으로 **수동 배포**: JDK → 소스 sparse-checkout·빌드 → systemd 등록·시작
- 앱용 Public IP `:8080`만 열고 SSH는 미노출 (Bastion으로 접속)
- 브라우저로 `http://{vm-web-ip}:8080` 접속 확인

## Examples

- 수동 배포 명령 (draft 내 bash 블록): `apt install openjdk-21-jdk`, sparse-checkout, `./mvnw` 빌드, systemd 유닛 등록

## Reference

- Draft: `.claude/draft/03.05.claude.notion.md`
- Notion: [Notion 문서]()

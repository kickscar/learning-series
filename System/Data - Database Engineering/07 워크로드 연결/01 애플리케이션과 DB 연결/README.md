# 07 워크로드 연결 / 01 애플리케이션과 DB 연결

앱이 DB에 어떻게 붙는지의 기초를 다룬다. 드라이버·접속 문자열·`user@host` 인증을 보고, CLI로 원격 접속하며 연결의 세 계층을 진단한다. 실제 gallery 앱 연결은 다음 절들(Java·.NET 워크로드)에서 다룬다.

## What you will learn

- 드라이버(통역사): JDBC(`mariadb-java-client`) / ADO.NET(`MySqlConnector`), MariaDB↔MySQL wire 호환
- 접속 문자열 두 형식 대조(JDBC URL vs .NET 연결 문자열) — 같은 다섯 정보, 다른 표기
- `user@host` 인증 모델: `'gallery'@'172.16.%'`, host 매칭, 최소 권한
- 연결의 세 계층: 방화벽(3306) · `bind-address`(≠127.0.0.1) · 인증. 실패 진단(`2003`/`1045`/`1044`)
- 실습: gallery DB·계정 준비 → 서버 원격 수신 열기 → web-vm에서 원격 CLI 접속 → `CURRENT_USER()` 확인

## Reference

- Notion: [Notion document]()

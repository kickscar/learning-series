# 07 워크로드 연결 / 03 Java 워크로드 연결

실제 Spring Boot gallery 앱을 MariaDB에 붙여 처음으로 띄운다. MyBatis raw SQL을 구경하고, 접속처를 실행 파라미터로 정해 연결하고, 앱이 만든 테이블·HikariCP 풀·앱이 날린 SQL을 DB에서 관찰한다. 미니 데이터센터 결선의 시작이다.

## What you will learn

- 앱 구조: Controller→Service→Repository→MyBatis, `item.xml`에 raw SQL 노출
- 접속처 = 실행 파라미터: yaml 기본 H2 → 명령줄 인자로 MariaDB(소스·리빌드 없음), 내장 Tomcat 8080
- 앱이 스키마를 심는다: `spring.sql.init` + `schema.sql` → `item` 테이블
- HikariCP 풀 실물: `Threads_connected` 1→11, `SHOW PROCESSLIST`에 gallery 커넥션 여러 줄(Sleep)
- ⭐ general_log로 앱이 날린 SQL 드러내기: `item.xml`의 SQL이 `mysql.general_log`에 그대로 (관통선 실증)
- 실습: 코드 구경 → 실행(기동 로그 driver 확인) → 테이블·풀·SQL 관찰

## Reference

- Notion: [Notion document]()

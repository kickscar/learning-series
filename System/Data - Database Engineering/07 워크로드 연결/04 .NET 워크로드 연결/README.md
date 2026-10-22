# 07 워크로드 연결 / 04 .NET 워크로드 연결

.NET gallery 앱을 winserver-vm에서 IIS로 MariaDB에 붙여 미니 데이터센터를 완성한다. Dapper raw SQL(MyBatis 대칭)을 구경하고, 접속처를 실행 파라미터·web.config 환경변수로 주입하고, 두 워크로드가 같은 `item` 테이블을 공유하는 것을 확인한다. Ch07의 피날레다.

## What you will learn

- 앱 구조: ASP.NET Core + Dapper(raw SQL을 C# 코드에 인라인, MyBatis `item.xml`과 대칭)
- 접속처 = 실행 파라미터: appsettings 기본 SQLite → 2-파라미터(`Database:Provider`·`ConnectionStrings:Default`) MariaDB
- ⭐ IIS/ANCM 배포: web.config `<environmentVariables>`로 `Database__Provider`·`ConnectionStrings__Default` 주입(키 `:`→`__`), "config, not source"
- 두 앱이 `item` 테이블 공유(`CREATE TABLE IF NOT EXISTS`), 미니 데이터센터 완성(`SHOW PROCESSLIST`에 Java+.NET)
- 풀 비대칭(MySqlConnector 최소 0 → 첫 요청 후 커넥션), general_log로 Dapper SQL 실증
- ORM 각주: 실무 EF Core도 그 SQL은 결국 관찰·튜닝된다 (관통선 봉인)

## Reference

- Notion: [Notion document]()

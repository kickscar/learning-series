# 06 .NET 워크로드와 마이그레이션 / 01 .NET 워크로드

기업이 Windows Server를 쓰는 실질적 이유 중 하나인 .NET 워크로드를 다룬다. 모던 .NET과 .NET Framework의 차이를 짚고, gallery(ASP.NET Core) 앱을 IIS에 배포한다. Spring Boot(내장 Tomcat)를 systemd 서비스로 올리는 것과 같은 뼈대임을 비교한다.

## What you will learn

- 왜 Windows Server에서 .NET인가: IIS 통합(프로세스 관리·SSL), Windows 인증(도메인 계정, 후반부), 레거시 .NET Framework 자산
- 모던 .NET(8+, 크로스 플랫폼) vs .NET Framework(4.x, Windows 전용·유지보수만)
- Hosting Bundle = .NET Runtime + ANCM — **SDK가 아니라 런타임**. 서버는 앱을 빌드하지 않고 게시 산출물을 실행만 한다
- 호스팅 모델: in-process(w3wp.exe 내부, 기본) vs out-of-process(Kestrel 리버스 프록시). in-process는 Spring Boot 내장 웹서버 모델에 가깝다
- ASP.NET Core 앱풀은 "No Managed Code"(자체 런타임), 앱풀 ID에 NTFS 권한(전용 서비스 계정)

## Examples

- `lab01` → Hosting Bundle 설치(런타임+ANCM) → 게시 산출물 배치(`C:\inetpub\gallery`) → **수동 실행 검증**(`dotnet gallery.dll` → Kestrel :5000, 200) → `New-WebAppPool`(No Managed Code)+`icacls`(앱풀 ID) → `New-Website`(8080) → 이벤트 뷰어로 로그 확인. Linux의 systemd 서비스 배포 흐름과 같은 뼈대

## Reference

- Notion: [Notion document]()

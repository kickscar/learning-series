# 03 Compute - Compute Engine / [실습] Gallery: Compute Engine 기본 배포

Gallery Spring Boot 앱을 Compute Engine VM에 최초 배포한다. Startup Script로 JDK 설치와 앱 실행을 자동화하고, GCE Metadata Server에서 인스턴스 이름을 조회해 앱에 주입한다.

## 구성

| 항목 | 내용 |
|------|------|
| VM | `gcp-fund-gallery-vm` (e2-medium, us-central1-a) |
| 스토리지 | 로컬 파일시스템 (`/app/uploads/`) |
| DB | H2 인메모리 |
| 접근 | External IP:8080 |

## 예제 파일

- `startup-script.sh` — VM 생성 시 Startup Script 입력값

## 전제 조건

- lab05: Firewall Rule `allow-ssh`, `allow-http` 생성 완료
- lab06: IAP Tunnel 접속 확인 완료
- lab07: Persistent Disk 구성 완료

## Reference

- Draft: `.claude/draft/03.05.claude.notion.md`
- Notion: [Notion 문서]()

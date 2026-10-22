# 02 MariaDB 설치와 구성 / 02 사용자와 권한

데이터베이스 사용자와 권한 계층을 보고, employees에만 접근하는 애플리케이션 전용 계정을 만들어 최소 권한 원칙을 적용한다.

## What you will learn

- 데이터베이스 사용자(OS 사용자와 별개)와 `사용자@호스트` 형식
- 권한 계층(글로벌·데이터베이스·테이블·컬럼)과 `GRANT`/`REVOKE`
- 최소 권한 원칙: 앱이 root가 아니라 전용 계정으로 접속해야 하는 이유
- `hr` 계정 생성·권한 부여·범위 확인(employees 밖 접근 거부)

## Reference

- Notion: [Notion document]()

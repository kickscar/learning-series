# 01 운영체제의 이해 / 04 파일시스템

"모든 것은 파일이다"라는 UNIX 설계 원칙, 파일 디스크립터와 VFS, FHS 디렉토리 구조, 블록 디바이스에서 파일시스템까지의 경로를 다룬다.

## What you will learn

- "Everything is a file" 원칙과 통일된 I/O 인터페이스 (open/read/write/close)
- 파일 디스크립터(fd)가 모든 I/O의 핵심인 이유. stdin/stdout/stderr도 fd다
- VFS가 파일, 디바이스, 소켓, /proc를 하나의 인터페이스로 묶는 구조
- /dev(디바이스 파일), /proc(프로세스 정보), /sys(커널 정보)의 역할
- 물리 디스크 → 파티션 → 파일시스템 → 마운트의 전체 경로

## Reference

- Notion: [Notion document](https://app.notion.com/p/04-377dc703ccda801da878f3224d902fa8?source=copy_link)

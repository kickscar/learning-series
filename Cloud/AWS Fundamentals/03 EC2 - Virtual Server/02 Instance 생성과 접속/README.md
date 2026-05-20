# 03 EC2 - Virtual Server / 02 Instance 생성과 접속

EC2 Instance를 Console에서 생성하고, SSH로 접속하는 흐름을 다룬다. 접속 가능 여부가 AMI/Key Pair/Network/Public IP/Security Group 연결 구조로 결정된다는 점을 기준으로, Instance Lifecycle(Stop/Start/Terminate)까지 확인한다.

## What you will learn

- Launch Instance 마법사에서 결정하는 핵심 설정(AMI/Type/Key Pair/Network/SG)
- SSH 접속 방식과 실패 시 점검 순서
- Instance Lifecycle과 비용/운영 관점의 차이
- Security Group 기초(SSH 22, HTTP 80, HTTPS 443)와 다음 Chapter 연결

## Examples

- `lab06` → EC2 Instance 생성, SSH 접속, Stop/Start/Terminate로 Lifecycle 확인

## Reference

- Draft: `.cursor/draft/03.02.notion.cursor.md`
- Notion: [Notion 문서]()

# 03 EC2 - Virtual Server / 04 Elastic IP

Elastic IP(EIP)의 목적과 운영 관점을 정리하고, `lab10`에서 EIP를 Allocate/Associate/Release하는 흐름을 실습한다. 또한 Ch03의 프로젝트 Lab로 Gallery(기본 구성: local storage + H2)를 EC2에 배포해, 고정 주소(EIP)로 접근 가능한 엔드포인트를 만든다.

## What you will learn

- Elastic IP(EIP)와 Public IP 자동 할당의 차이
- EIP 수명 관리(Allocate/Associate/Disassociate/Release)와 비용 리스크
- Stop/Start 이후에도 IP가 유지되는 조건과 확인 포인트
- Gallery(기본 구성: local storage + H2)를 EC2에 배포하고 EIP로 접근하는 최소 배포 흐름

## Examples

- `lab10` → Elastic IP Allocate/Associate, Stop/Start 후 IP 유지 확인, Release

## Gallery Project

- `Lab: Gallery - EC2 기본 배포` → EC2에 Gallery 배포(기본 구성), EIP로 접근 가능한 엔드포인트 구성

## Reference

- Draft: `.cursor/draft/03.04.notion.cursor.md`
- Notion: [Notion 문서]()

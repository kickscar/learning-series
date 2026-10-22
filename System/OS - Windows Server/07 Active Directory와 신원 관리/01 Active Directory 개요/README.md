# 07 Active Directory와 신원 관리 / 01 Active Directory 개요

후반부의 개념 토대. Active Directory Domain Services(AD DS)의 구조와 작동 원리를 다룬다. 이론 전용 섹션으로, 로컬 계정(02장)을 넘어 도메인 전체 신원 관리로 전환하는 지점이다.

## What you will learn

- AD DS = 사용자·컴퓨터·그룹을 중앙 관리하는 디렉토리 서비스 (Windows Server 고유 가치의 중심)
- 세 기둥: LDAP(쿼리) · Kerberos(인증) · DNS(DC 위치)
- 논리 구조: Domain ⊂ Tree ⊂ Forest, 내부를 OU로 분할. DC는 AD DB 호스팅, Forest는 보안 경계, OU는 GPO·위임 최소 단위
- Kerberos 티켓 기반 인증(TGT → 서비스 티켓)
- AD의 DNS 의존(도메인 이름 = DNS 이름), Linux OpenLDAP과의 비교

## Examples

- 이론 전용 (실습 없음). DC 구축(도메인 컨트롤러 구성), 사용자·OU·그룹, 그룹 정책(GPO)은 뒤 섹션에서 다룬다.

## Reference

- Notion: [Notion document]()

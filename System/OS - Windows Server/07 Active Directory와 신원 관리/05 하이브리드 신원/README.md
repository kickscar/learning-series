# 07 Active Directory와 신원 관리 / 05 하이브리드 신원

온프레미스 AD와 클라우드 Entra ID를 하나의 신원으로 잇는 하이브리드 신원을 다룬다. 이론 전용·인식 수준 섹션으로, AD가 Azure와 만나는 지점이자 이 시리즈가 가리키는 종착점이다. 실제 설정 실습은 Azure 시리즈에서 다룬다.

## What you will learn

- Microsoft Entra ID = 클라우드 신원 서비스(M365·SaaS), AD DS와 별개 제품
- **Entra ID는 "클라우드 AD"가 아니다**: LDAP·Kerberos·GPO·도메인 조인 없음, OAuth·OIDC·SAML 기반
- 하이브리드 신원: AD를 원천으로 Entra에 동기화 → 단일 계정 SSO
- 동기화: Entra Connect / Cloud Sync(신규 권장)
- 인증 방식: PHS(권장)/PTA/Federation(AD FS)

## Examples

- 이론 전용 (실습 없음). 실제 Entra Connect 설정·조건부 액세스는 Azure 시리즈에서.

## Reference

- Notion: [Notion document]()

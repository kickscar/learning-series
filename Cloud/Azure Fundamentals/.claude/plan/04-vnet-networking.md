# Chapter 04 — VNet & Networking

## 목표

Azure 네트워킹의 핵심 구조를 이해하고 직접 구성한다.
VNet/Subnet 설계부터 NSG 트래픽 제어, Private Subnet 격리, NAT Gateway까지 쌓은 후
Gallery 앱을 Custom VNet으로 이전해 외부 접속이 막히는 구조를 만든다.
이 상태가 Ch05 Traffic Management의 출발점이 된다.

---

## AWS 대응 관계

| Azure | AWS |
|-------|-----|
| VNet | VPC |
| Subnet | Subnet |
| NSG (Subnet/NIC 레벨 통합) | Security Group + Network ACL |
| Route Table / UDR | Route Table |
| Public IP | Elastic IP / Public IP |
| NAT Gateway | NAT Gateway |
| Service / Private Endpoint | VPC Endpoint |
| (별도 리소스 없음) | Internet Gateway ← Azure는 암묵적 처리 |

---

## Section 구성

### Section 01 — VNet과 Subnet - 주소 공간 설계
- **유형**: 이론 + 실습
- **내용**:
  - VNet 개념, 주소 공간(Address Space) 설계
  - Subnet 종류 (일반, GatewaySubnet, AzureBastionSubnet 등)
  - CIDR 표기법과 범위 계획
  - 시스템 라우팅(System Routes) 동작 원리
  - UDR(User Defined Routes) 개요
- **Lab**:
  - `[실습] lab08: VNet & Subnet 생성`
    - VNet 생성 (10.10.0.0/16)
    - Public Subnet (10.10.1.0/24), Private Subnet (10.10.2.0/24) 생성
    - Route Table 자동 생성 확인

### Section 02 — 인터넷 연결 구조 - Public IP와 라우팅
- **유형**: 이론
- **내용**:
  - Azure에 Internet Gateway 리소스가 없는 이유
  - Public IP가 있는 VM의 암묵적 인터넷 연결 구조
  - Public IP 유형 (Static / Dynamic, Basic / Standard SKU)
  - 기본 아웃바운드 접근(Default Outbound Access) 폐지 흐름
- **Lab**: 없음

### Section 03 — NSG - 트래픽 제어
- **유형**: 이론 + 실습
- **내용**:
  - NSG 개념: Stateful 트래픽 필터링
  - Inbound / Outbound 규칙 구조 (우선순위, 프로토콜, 포트, 소스/대상)
  - NSG 적용 대상: Subnet 레벨 vs NIC 레벨 (이중 레이어)
  - AWS Security Group / Network ACL과의 비교
- **Lab**:
  - `[실습] lab09: NSG 생성 및 트래픽 제어`
    - NSG 생성
    - Inbound 규칙 추가 (SSH 22, HTTP 8080)
    - Subnet 연결 및 트래픽 차단/허용 확인

### Section 04 — Private Subnet 격리
- **유형**: 이론 + 실습
- **내용**:
  - Private Subnet 개념 (Public IP 없음)
  - 인터넷 인바운드/아웃바운드 모두 차단 상태 이해
  - Bastion을 통한 안전한 접속 경로
- **Lab**:
  - `[실습] lab10: Private Subnet VM 격리 확인`
    - Private Subnet에 VM 생성 (Public IP 없음)
    - Bastion으로 접속 확인
    - 외부 인터넷 아웃바운드 불가 확인 (ping 8.8.8.8 실패)

### Section 05 — NAT Gateway
- **유형**: 이론 + 실습
- **내용**:
  - NAT Gateway 개념: Private VM의 아웃바운드 전용 인터넷 연결
  - Public IP / Public IP Prefix 연결
  - Subnet 연결 방식
  - 인바운드 연결 불가 원칙
- **Lab**:
  - `[실습] lab11: NAT Gateway 설정`
    - NAT Gateway 생성, Public IP 연결
    - Private Subnet에 NAT Gateway 연결
    - Private VM에서 아웃바운드 확인 (패키지 설치)
    - 인바운드 접속 여전히 불가 확인

### Section 06 — Service Endpoint & Private Endpoint
- **유형**: 이론
- **내용**:
  - Service Endpoint: VNet에서 Azure PaaS로의 최적화 경로
  - Private Endpoint: PaaS 서비스를 VNet 내 Private IP로 노출
  - 두 방식 비교 (보안 수준, 사용 시나리오)
  - 실습은 Ch06(Storage), Ch07(Database)에서 수행
- **Lab**: 없음

### Section 07 — 네트워크 흐름 정리
- **유형**: 이론
- **내용**:
  - Ch04에서 구성한 전체 네트워크 구조 시각화
  - 트래픽 경로별 흐름 정리 (인바운드 Public, Private, 아웃바운드)
  - Ch05로 이어지는 맥락: "외부 인바운드 해결 = Load Balancer"
- **Lab**: 없음

### Section 08 — [실습] Gallery: Custom VNet 이전
- **유형**: 시리즈 실습 (Gallery)
- **전제 조건**: lab08~11 완료 (VNet + NSG + Private Subnet + NAT GW)
- **내용**:
  - Ch03 Gallery에서 Public IP 직접 노출 VM을 Custom VNet으로 이전
  - Gallery 전용 VNet / Public + Private Subnet 구성
  - Gallery VM → Private Subnet 배치
  - NAT Gateway로 아웃바운드 열어 Gallery 설치 및 실행
  - localhost 접속 확인 / 외부 접속 불가 상태로 마무리
  - **브릿지 포인트**: "외부에서 어떻게 접근하지?" → Ch05 Load Balancer
- **예제 파일**: `04 VNet & Networking/08 [실습] Gallery - Custom VNet 이전/` 하위

---

## Draft 파일

| Section | Draft 파일 |
|---------|-----------|
| 01 | `.claude/draft/04.01.claude.notion.md` |
| 02 | `.claude/draft/04.02.claude.notion.md` |
| 03 | `.claude/draft/04.03.claude.notion.md` |
| 04 | `.claude/draft/04.04.claude.notion.md` |
| 05 | `.claude/draft/04.05.claude.notion.md` |
| 06 | `.claude/draft/04.06.claude.notion.md` |
| 07 | `.claude/draft/04.07.claude.notion.md` |
| 08 Gallery | `.claude/draft/04.08.claude.notion.md` |

## 상태

| Section | 상태 |
|---------|------|
| 01 | 계획확정 |
| 02 | 계획확정 |
| 03 | 계획확정 |
| 04 | 계획확정 |
| 05 | 계획확정 |
| 06 | 계획확정 |
| 07 | 계획확정 |
| 08 Gallery | 계획확정 |

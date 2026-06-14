# System 시리즈 — 전체 기획 문서
### 멀티클라우드 엔지니어 양성 과정 · Cloud 시리즈 선행 과정

---

## 1. 이 시리즈가 만들어진 배경

클라우드 서비스는 결국 컴퓨트(가상화), 운영체제, 네트워크, 서버 운영, 데이터를 자동화하고 서비스로 포장한 것이다. System 시리즈는 그 **아래의 실체를 직접 구축하고 운영해보는** 과정이다.

학습자는 빈 VirtualBox에서 시작하여 VM을 만들고, OS를 올리고, 네트워크로 연결하고, 서비스를 띄우고, 데이터베이스까지 연결하여 **동작하는 미니 데이터센터**를 완성한다. 이 과정을 마치면 Cloud 시리즈의 서비스들을 블랙박스가 아니라 **"자신이 손으로 해본 작업의 자동화"**로 이해하게 된다.

---

## 2. 시리즈 철학

**손으로 해봐야 자동화의 의미를 안다.**

5개 과목이 각각 독립적이면서도 하나의 인프라를 점진적으로 완성하는 구조다. 기존 교재들이 각 과목을 섬처럼 다루는 것과 달리, 이 시리즈는 빈 하이퍼바이저에서 출발하여 완성된 워크로드까지 하나의 관통 스토리로 연결한다.

```
빈 VirtualBox
    ↓ Compute: Virtualization — VM을 만든다
    ↓ OS: Linux — OS를 올리고 서비스를 띄운다
    ↓ Network: Engineering & Troubleshooting — 연결하고 진단한다
    ↓ OS: Windows Server — 다른 OS도 올리고 고유 가치를 경험한다
    ↓ Data: Database Engineering — 데이터를 담고 워크로드를 완성한다
    ↓
미니 데이터센터 완성
    VM1 [Spring Boot Gallery + Rocky Linux] ──┐
                                               ├──→ VM2 [MariaDB + Rocky Linux]
    VM3 [ASP.NET Gallery + Windows Server] ───┘
    + 서브넷 분리 + NAT + 방화벽 + DNS
    ↓
Cloud 시리즈 — "이걸 AWS/Azure/GCP로 옮기면 클라우드다"
```

---

## 3. System → Cloud 연결

| System 시리즈에서 손으로 | Cloud 시리즈에서 다시 만남 |
|----------------------|----------------------|
| VirtualBox VM 생성, 자원 할당 | EC2 / Compute Engine 인스턴스 |
| Internal Network로 서브넷 분리 | VPC Subnet |
| Router VM + IP Forwarding | Route Table + Internet Gateway |
| iptables NAT MASQUERADE | NAT Gateway |
| firewall-cmd / nftables inbound/outbound | Security Group |
| bind DNS 서버 구축 | Route 53 / Cloud DNS |
| Active Directory + Entra ID | Azure Entra + 하이브리드 신원 |
| .NET on IIS + Hyper-V | Azure App Service + Azure Migrate |
| MariaDB 설치·백업·복제·모니터링 | RDS / Cloud SQL / Azure SQL |
| 커넥션 풀·슬로우 쿼리·EXPLAIN | **클라우드에서도 여전히 고객 책임** |

---

## 4. 각 과목의 고유한 교육적 무기

| 시리즈 | 고유 무기 | 학습자에게 남는 것 |
|--------|---------|-----------------|
| Compute: Virtualization | OS별 하이퍼바이저 통합 비교 (KVM/Hyper-V/HV.framework) → 클라우드 연결 | "클라우드 컴퓨트는 이것의 자동화" |
| OS: Linux | CLI = OS와 대화하는 가장 직접적 방법 | "명령어가 두렵지 않다" |
| Network: E&T | 패킷 캡처로 보이지 않는 것을 눈으로 | "네트워크가 마법이 아니다" |
| OS: Windows Server | "OS는 같다. 하지만 고유 가치가 있다" (AD, .NET, Hyper-V) | "Linux와 Windows를 같은 눈으로 본다" |
| Data: Database Engineering | 비즈니스 → 구조화 → JOIN → 부하 → 엔지니어링 | "DB 문제의 맥락을 안다" |

---

## 5. 구성 시리즈 목록

| 인덱스 | 시리즈 타이틀 | 핵심 컨셉 | 규모 |
|--------|------------|----------|------|
| 01 | Compute: Virtualization | 가상화 개념 + VirtualBox 실습 환경 구축 + 현대 OS의 하이퍼바이저 통합 + 클라우드 연결 | 3 Ch / 10 Sec / 6 Lab |
| 02 | OS: Linux | OS 이론 다이제스트 + UNIX 계보 → Linux CLI 운영. "CLI는 OS와의 대화" | 9 Ch / 35 Sec / 27 Lab |
| 03 | Network: Engineering & Troubleshooting | Top-Down(App→Link) + 패킷 캡처로 모든 프로토콜 관찰. 미니 데이터센터 네트워크 완성 | 9 Ch / 27 Sec / 20 Lab |
| 04 | OS: Windows Server | 전반부 "OS는 같다"(Linux 대응) + 후반부 "고유 가치"(AD/Entra ID, .NET, Hyper-V). PowerShell 주력 | 7 Ch / 25 Sec / 20 Lab |
| 05 | Data: Database Engineering | DB 이론을 엔지니어링 관점으로. DA/DBA/AppDev 세 역할의 맥락을 이해. employees DB(390만 행)로 실습 | 8 Ch / 26 Sec / 20 Lab |
| | **합계** | | **36 Ch / 123 Sec / 93 Lab** |

---

## 6. 문서 규약

- **계층:** 각 구성 시리즈는 `Chapter > Section > Lab(실습)` 으로 구성한다
- **번호:** 챕터는 01부터, 섹션은 각 챕터 안에서 01부터 매긴다
- **제목:** 챕터·섹션 제목은 명사로 짓고, 설명은 챕터 개요와 섹션의 구체 항목으로 옮긴다
- **실습 환경 연속성:** 미니 데이터센터(VM 환경)는 01에서 구축해 시리즈마다 자란다
- **과목 독립 원칙:** 각 과목은 문서상 독립적으로 존재한다. 다른 과목에 대한 명시적 참조를 넣지 않는다. 연결은 강의에서 구두로 수행한다

---

## 7. 실습 도구

| 도구 | 역할 | 사용 시리즈 |
|------|------|-----------|
| VirtualBox 7.2.x | 실습 환경 (Type-2 하이퍼바이저) | 전 시리즈 |
| Rocky Linux 9.x | 실습 OS (Fedora/RHEL 계열) | 02, 03, 05 |
| Windows Server 2022 | 실습 OS | 04 |
| MariaDB | 실습 DBMS | 05 |
| tcpdump / Wireshark | 패킷 캡처·분석 | 03 |
| MySQL Workbench | Visual EXPLAIN, ER 다이어그램 | 05 |
| VSCode | 코드 구경 + 앱 실행 (Java, C#) | 05 |
| employees sample DB | SQL 실습 데이터 (30만+284만 행) | 05 |

---

# 01. Compute: Virtualization

**컨셉:** 가상화가 무엇이며 왜 필요한지 이해하고, VirtualBox로 실습 환경을 구축한다. x86과 ARM의 하드웨어 가상화, 현대 3대 OS의 하이퍼바이저 통합(KVM/Hyper-V/HV.framework), 가상화가 클라우드 컴퓨트의 토대라는 연결까지 다룬다.

| Ch | 챕터 | Sec | Lab | 핵심 |
|----|------|-----|-----|------|
| 01 | 가상화 개념 | 4 | 0 | 정의·목적, 하이퍼바이저 유형, **하드웨어 가상화(x86+ARM)**, **현대 OS 하이퍼바이저 통합**, 가상화와 클라우드 |
| 02 | 하이퍼바이저와 가상 머신 | 4 | 4 | VirtualBox 설치, VM 생성, 가상 스토리지, 스냅샷·클론 |
| 03 | 가상 네트워크 | 2 | 2 | 5종 네트워크 모드, **Router VM 멀티 서브넷 토폴로지** |

---

# 02. OS: Linux

**컨셉:** OS 이론의 다이제스트를 UNIX 계보(AT&T → BSD → System V → Linux)와 함께 다루고, Linux CLI 운영을 체득한다. "CLI는 OS와 대화하는 가장 직접적 방법"이라는 인식을 심는다. OS 일반 개념은 이 시리즈가 단독 책임을 진다.

| Ch | 챕터 | Sec | Lab | 핵심 |
|----|------|-----|-----|------|
| 01 | 운영체제의 이해 | 5 | 0 | OS 보편 이론 + **UNIX 계보(System V 포함)** + Linux 산업 주류화 |
| 02 | 설치와 첫 로그인 | 3 | 2 | **수동 파티셔닝** 설치, 초기 설정 |
| 03 | 셸과 CLI | 6 | 5 | 파일, 텍스트, 리다이렉션, **vi/vim**, 링크·찾기 |
| 04 | 사용자와 권한 | 3 | 3 | 사용자/그룹, rwx, sudo/특수 권한 |
| 05 | 프로세스와 시스템 자원 | 3 | 3 | ps/top, 시그널, 메모리/스왑 |
| 06 | 서비스와 소프트웨어 | 5 | 5 | systemd, 패키지, 로그, **웹서버(종합 실습)** |
| 07 | 네트워크와 원격 운영 | 3 | 3 | IP 설정·**조회 수준**, 방화벽, SSH |
| 08 | 스토리지 | 3 | 3 | 디스크/파티션, LVM(인식), NFS(인식) |
| 09 | 자동화와 운영 심화 | 4 | 3 | 스크립팅, cron, SELinux(인식), 부팅 트러블슈팅(인식) |

---

# 03. Network: Engineering & Troubleshooting

**컨셉:** Top-Down 접근(Application → Link)으로 인터넷 통신 원리를 이해하고, "보이지 않는 것을 눈으로 보게 한다." 모든 프로토콜을 패킷 캡처(tcpdump/Wireshark)로 직접 관찰한다. 최종적으로 공개/사설 서브넷에 서비스를 노출하는 미니 데이터센터 네트워크를 완성한다.

| Ch | 챕터 | Sec | Lab | 핵심 |
|----|------|-----|-----|------|
| 01 | 네트워킹 개요와 도구 | 3 | 1 | 계층 모델 + **tcpdump 조기 도입** |
| 02 | 애플리케이션 계층 | 3 | 3 | HTTP, DNS, DHCP 패킷 캡처 |
| 03 | 전송 계층 | 3 | 3 | **TCP handshake 캡처**, UDP, 포트/소켓 |
| 04 | 네트워크 계층 | 4 | 4 | IP(**IPv6 포함**), 서브넷/CIDR, **Router VM 라우팅**, ICMP |
| 05 | 링크 계층 | 3 | 1 | 이더넷, **ARP 패킷 캡처**, VLAN(인식) |
| 06 | 네트워크 서비스 구축 | 2 | 2 | DNS 서버(bind), DHCP 서버(dhcpd) 직접 구축 |
| 07 | 보안과 트래픽 관리 | 4 | 3 | 방화벽, NAT, **TLS/HTTPS 암호화 비교**, LB(인식) |
| 08 | 진단과 트러블슈팅 | 3 | 2 | **계층별 진단 방법론** + 시나리오 트러블슈팅 |
| 09 | 종합 구성 | 2 | 1 | **미니 데이터센터 네트워크 완성** (전 챕터 기술 총동원) |

---

# 04. OS: Windows Server

**컨셉:** "OS는 같다. 하지만 Windows Server만의 가치가 있다." 전반부(Ch01~04)에서 Linux 운영 과제를 Windows 방식으로 재현하여 동질성을 확인하고, 후반부(Ch05~07)에서 Linux가 대체하기 어려운 Windows 고유 가치를 다룬다. PowerShell이 주력이고 GUI는 확인·보조 도구다.

| Ch | 챕터 | Sec | Lab | 핵심 |
|----|------|-----|-----|------|
| 01 | 설치와 시스템 운영 | 5 | 4 | 에디션, 설치, **관리 도구의 변화(3세대)**, **PowerShell 시작**, 초기 설정 |
| 02 | 사용자와 권한 | 3 | 3 | 로컬 사용자 → **NTFS ACL**(chmod보다 세분화), **SMB 공유** |
| 03 | 네트워크와 원격 운영 | 3 | 3 | NetIP, Windows Firewall, **RDP + PSRemoting + SSH** |
| 04 | 서비스와 소프트웨어 | 5 | 5 | Services, winget, **IIS**(전반부 종합), Event Viewer, Task Scheduler |
| 05 | Active Directory와 신원 관리 | 5 | 3 | **AD DS** (DC 승격, OU, GPO), **Entra ID 하이브리드**(인식) |
| 06 | .NET 워크로드와 마이그레이션 | 2 | 1 | **.NET on IIS**, Azure Migrate/Arc/Hybrid Benefit(인식) |
| 07 | Hyper-V | 2 | 1 | **Type-1 하이퍼바이저**, Root Partition, **Azure 기반 기술** 연결 |

---

# 05. Data: Database Engineering

**컨셉:** DB 이론을 가르치는 것이 아니라, "DB 기술들이 왜 엔지니어링 지원을 필요로 하는가"의 맥락을 잡는다. DA(설계 → 성능 영향), DBA(운영 → 인프라 자동화), App Dev(쿼리 → 부하 대응) 세 역할의 맥락을 이해하여, 시스템 엔지니어로서 적절한 지원을 할 수 있게 한다. employees 샘플 DB(390만 행)로 전 챕터를 일관되게 실습한다.

| Ch | 챕터 | Sec | Lab | 핵심 |
|----|------|-----|-----|------|
| 01 | 데이터와 DB 엔지니어링 | 3 | 0 | 왜 DB인가, **엔지니어링 파이프라인**, DB 종류 |
| 02 | MariaDB 설치와 구성 | 4 | 4 | 설치, 사용자/권한, **employees DB 로드(390만 행)**, 설정 튜닝 |
| 03 | 관계형 모델과 SQL | 3 | 2 | 관계형 모델, SQL 기초, **JOIN과 집계 (부하의 시작점)** |
| 04 | 데이터 설계 | 2 | 2 | ER 모델링, **정규화 → JOIN 증가 → 성능 영향 → 반정규화** |
| 05 | 성능 엔지니어링 | 3 | 3 | **핵심.** 인덱스(B-tree), **EXPLAIN ("왜 CPU 100%?")**, 슬로우 쿼리 |
| 06 | 트랜잭션과 동시성 | 3 | 2 | ACID, 격리 수준/락, **락 → 풀 고갈 → 장애 캐스케이드**, WAL |
| 07 | 워크로드 연결 | 4 | 4 | 드라이버, **커넥션 풀 엔지니어링**, **Java(Spring Boot) + .NET(ASP.NET) 두 워크로드 통합** |
| 08 | 운영 엔지니어링 | 4 | 3 | 백업/복구, 복제, 모니터링, **클라우드 관리형 DB (자동화 vs 고객 책임)** |

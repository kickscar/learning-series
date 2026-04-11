# Chapter 05 — 컴퓨트

## 목표

Azure VM을 Terraform으로 프로비저닝한다.
Custom Data(cloud-init)를 활용한 부트스트랩 자동화와 Availability Zone 배치를 구현한다.
Ch04에서 구성한 VNet 위에 Gallery 앱 VM을 배포한다.

---

## Azure Fundamentals 대응

| 이 시리즈 (Terraform) | Azure Fundamentals (콘솔) |
|-----------------------|--------------------------|
| Sec 01: VM 프로비저닝 | Ch03 Sec02: VM 생성 및 기본 구성 |
| Sec 02: Custom Data | Ch03 Sec02: (콘솔에서 User Data 설정) |
| Sec 03: Availability Zone | Ch05 Sec06: 고가용성 구성 |
| Gallery | Ch03 Sec05: Gallery Azure VM 기본 배포 |

---

## Section 구성

### Section 01 — Azure VM 프로비저닝
- **유형**: 이론 + 실습
- **내용**:
  - `azurerm_linux_virtual_machine` — 전체 구조
  - `azurerm_network_interface` — VM과 Subnet 연결
  - OS 디스크 설정: `os_disk` 블록, `storage_account_type`
  - 이미지 참조: `source_image_reference` (publisher, offer, sku, version)
  - SSH 키 설정: `admin_ssh_key` 블록
  - VM 크기(size) 선택 가이드
  - 네이밍 규칙 적용: `{project}-{env}-workload-vm-{role}`
- **Lab**:
  - `[실습] lab14: Linux VM 생성`
    - NIC 생성 → Private Subnet 연결
    - Linux VM 생성 (Ubuntu 22.04, Standard_B1s)
    - SSH 키 설정
    - `az vm show`, `az vm list-ip-addresses`로 확인

### Section 02 — Custom Data와 부트스트랩
- **유형**: 이론 + 실습
- **내용**:
  - `custom_data` 파라미터: base64 인코딩된 cloud-init 스크립트
  - cloud-init YAML 작성: 패키지 설치, 파일 생성, 명령 실행
  - `filebase64()` / `base64encode()` 함수 활용
  - Gallery 앱 배포 시나리오: JDK 설치 → JAR 다운로드 → 서비스 실행
  - Terraform Core에서 배운 `file()`, `templatefile()` 함수 복습
- **Lab**:
  - `[실습] lab15: cloud-init Custom Data`
    - cloud-init 스크립트 작성 (패키지 설치 + 웹서버 구동)
    - `custom_data`로 VM에 주입
    - VM 접속 후 부트스트랩 결과 확인

### Section 03 — Availability Zone 배치
- **유형**: 이론 + 실습
- **내용**:
  - Azure Availability Zone 개념 (1, 2, 3)
  - `zone` 파라미터로 VM 배치
  - Zone 분산 배포와 고가용성
  - 단일 VM Zone 배치 vs 다중 VM Zone 분산 (Ch06 VMSS와 연계)
- **Lab**:
  - `[실습] lab16: Availability Zone 배포`
    - VM을 특정 Zone에 배치
    - `az vm show --query zones`로 Zone 확인
    - Zone 변경 시 Terraform plan 결과 관찰 (replace 동작)

### Section 04 — [실습] Gallery: Gallery VM 배포
- **유형**: 시리즈 실습 (Gallery)
- **전제 조건**: lab14~16 완료, Ch04 Gallery VNet 구성 완료
- **내용**:
  - Ch04 Gallery VNet의 Private Subnet에 Gallery VM 배포
  - Custom Data로 JDK 설치 + Gallery Spring Boot JAR 부트스트랩
  - Ch03 Gallery에서 생성한 Managed Identity 할당
  - Bastion 또는 NAT Gateway 경유로 SSH 접속 확인
  - Gallery 앱 실행 확인 (Private Subnet → 외부 접속 불가)
  - **브릿지 포인트**: "외부에서 어떻게 접근하지?" → Ch06 Load Balancer
- **예제 파일**: `05 컴퓨트/04 [실습] Gallery - Gallery VM 배포/` 하위

---

## Draft 파일

| Section | Draft 파일 |
|---------|-----------|
| 01 | `.claude/draft/05.01.claude.notion.md` |
| 02 | `.claude/draft/05.02.claude.notion.md` |
| 03 | `.claude/draft/05.03.claude.notion.md` |
| 04 Gallery | `.claude/draft/05.04.claude.notion.md` |

## 상태

| Section | 상태 |
|---------|------|
| 01 | 계획수립 |
| 02 | 계획수립 |
| 03 | 계획수립 |
| 04 Gallery | 계획수립 |

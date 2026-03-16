# 개요

이번 실습 에서는 Network ACL(NACL) 을 사용해 Subnet 경계에서 트래픽을 차단/허용하는 방식을 다룬다. 앞선 실습에서 Private Subnet의 Isolation(격리) 은 Route Table(L3) 설계로 구현했다. 이번 실습은 동일한 VPC 구성으로 특히, Public Subnet의 IGW 경로를 그대로 유지하고 Public Subnet 으로 유입되는 트래픽을 NACL로 제어한다.

### **핵심 포인트**

- Security Group 은 **Instance/ENI 레벨**에서 동작하는 **Stateful** 방화벽이다.
- Network ACL(NACL)은 **Subnet 레벨**에서 동작하는 **Stateless** 패킷 필터다.
- 즉, SG가 열려 있어도 **Subnet 문턱(NACL)에서 패킷이 드랍되면 인스턴스까지 도달하지 못한다.**

이번 실습에서는 **AWS가 자동 생성하는 Default NACL(Default ALLOW)**을 사용하지 않고, **직접 NACL을 생성하고 Public Subnet에 연결(Association)** 하여 트래픽을 제어한다. 즉, 모든 트래픽이 차단된 상태에서 필요한 규칙을 직접 정의함으로써 **Stateless(상태 비저장)** 특성과 **Rule Precedence(규칙 우선순위**) 가 통신 세션에 미치는 영향을 기술적으로 검증한다.

이 전의 실습의 아키텍처(dual subnet + 2-layer)에서 Private Subnet를 빼고 Public Subnet 경로 위에서 “Subnet 레벨 제어 장치” 를 추가하는 확장 실습이다.

# 실습 목표

- Network ACL의 위치와 역할 이해 (Subnet Boundary)
- **Stateless** 특성 이해: Inbound/Outbound 규칙을 **쌍으로 설계**해야 하는 이유
- Default NACL (자동) vs Custom NACL(직접 생성) 차이 이해
- Rule Precedence (규칙 우선순위) 이해: 낮은 번호의 규칙이 우선 적용되는 결정론적 알고리즘 확인
- Ephemeral Ports (임시 포트) 설계: 응답 패킷(Return Traffic)을 위한 Outbound 경로 확보의 기술적 필요성 이해
- Public Subnet의 유입 트래픽 (예: SSH/ICMP)을 NACL로 차단/허용하는 End-to-End 검증
- Defense in Depth (다층 방어) 구조 확인: Security Group (Stateful)와 NACL (Stateless) 의 역할 분리 및 우선순위 감각 확보
- 이후 Bastion/NAT 실습에서 “Subnet 레벨 보안 계층” 을 이해한 상태로 진입

# 실습 아키텍처 개요

### 1) Network Layer

- VPC
- IGW + Route Table (Public Subnet은 0.0.0.0/0 → IGW 유지)
- Subnet, Route Table
- (신규) **Custom Network ACL :** Public Subnet에 연결될 독립형 NACL 컨테이너
- (신규) **Subnet ↔ Custom NACL Association:** 생성된 NACL을 Public Subnet에 명시적으로 바인딩 (기본 ACL 대체)
- (신규) **NACL Rules**
    - **Inbound: 특정 포트(SSH, ICMP) 및 특정 IP 대역에 대한 허용/거부 규칙**
    - **Outbound: Stateless 환경 대응을 위한 응답 트래픽 경로 정의**

### 2) Application Layer

- Public Instance (Public Subnet)
- Security Group (SSH/ICMP 허용 상태 유지)
- 이전 실습의 Public 환경을 그대로 유지하며, NACL 설정 변경에 따른 통신 가용성 변화 측정

> Security Group 은 열어둔 상태로 유지하고, Public Subnet에서 NACL로 먼저 끊어버리는 것이 이번 실습의 핵심이다.
> 

# 인프라 정의 및 구성 리소스

### 1. 계층 설계 및 역할

| Layer | Template 파일 | 주요 리소스 | 기술적 역할 |
| --- | --- | --- | --- |
| Network | `lab11-network-vpc.yaml` | VPC, IGW | 인테넷 개방 |
| Network | `lab11-network-subnet.yaml` | Public/Private Subnet, Route Tables | 공용 서브넷 및 전용 라우팅 테이블(No IGW) 추가 |
| Network | `lab11-network-nacl.yaml` | Network ACL | Stateless Packet Filtering |
| Application | `lab11-application-service.yaml` | EC2, Security Group | 고용 서브넷 ID를 참조하여 격리된 EC2 인스턴스 배포 |

### 2. NACL 구성 리소스

| **리소스 유형** | **기술적 역할** |
| --- | --- |
| **`AWS::EC2::NetworkAcl`** | 서브넷 유입/유출 패킷을 검사하는 논리적 방화벽 본체 |
| **`AWS::EC2::NetworkAclEntry`** | 개별 필터링 규칙. 규칙 번호, 프로토콜, Action(Allow/Deny)을 정의 |
| **`SubnetNetworkAclAssociation`** | 특정 서브넷을 생성된 NACL의 영향권 아래로 편입시키는 물리적 연결 |
- **Stateless Filtering:** Security Group (보안 그룹)과 달리 유입된 패킷의 상태를 기억하지 않는다. 따라서 요청이 허용되어 들어왔더라도, 나가는 규칙이 없으면 패킷은 서브넷 경계에서 폐기된다.
- **Ephemeral Ports:** 클라이언트가 서버에 접속한 후 응답을 받을 때 사용하는 임시 포트 대역(보통 1024-65535)이다. Stateless 방화벽인 NACL에서는 이 대역의 Outbound를 반드시 열어주어야 통신이 가능하다.

### 3. NACL의 위치 (Subnet Boundary)

- Security Group: **ENI(인스턴스 네트워크 인터페이스)** 에서 평가
- NACL: **Subnet 경계**에서 평가 (서브넷 “입구/출구”에서 패킷 필터링)

따라서 패킷 흐름은 다음 순서로 이해하는 것이 안전하다.

- Inbound(외부 → 인스턴스): **NACL → Security Group → OS**
- Outbound(인스턴스 → 외부): **Security Group → NACL → Route**

# Network ACL 개념 정리

### 1. Stateless Packet Filtering

NACL은 **Stateless** 이다. 즉, Inbound를 허용했다고 해서 Outbound 응답이 자동 허용되지 않는다. 예를 들어 **ssh 접속 허용** 을 만들려면 다음과 같은 설정이 필요하다.

- Inbound: TCP 22 허용
- Outbound: **ephemeral port(응답 포트)** 허용이 필요

Security Group(Stateful)와 가장 큰 차이점이 여기서 발생한다.

### 2. Allow + Deny 지원

Security Group은 Allow-only지만, NACL은 Allow/Deny 모두 가능하다. 또한 **Rule Number(우선순위)** 기반으로 매칭된다.

- 작은 번호가 먼저 평가됨
- 매칭되면 그 즉시 Allow/Deny 결정 (더 아래 규칙은 보지 않음)
- 마지막은 보통 (모든 트래픽) Deny로 종결

### 3. Default NACL vs Custom NACL

- Default NACL: VPC 생성 시 자동 생성, 기본적으로 “대부분 허용” 형태
- Custom NACL: 실습에서 직접 생성, Subnet과 명시적으로 연결하여 통제

이번 실습은 “기본 NACL이 있기 때문에 별도 설정이 없어도 되는 상태”를 일부러 깨고, Subnet 레벨 통제를 직접 구성하는 경험을 목표로 한다.

# CloudFormation Template

## 1. 추가 Network Layer: `lab11-network-nacl.yaml`

```yaml
AWSTemplateFormatVersion: 2010-09-09
Description: Network / Subnet

Parameters:
  AZ:
    Type: String
    Description: the Logical AZ Number for the Main Subnet.
    Default: AZ1
    AllowedValues: [ AZ1, AZ2, AZ3, AZ4 ]

  EnvType:
    Type: String
    Default: lab
    AllowedValues: [development, production, lab]
    Description: Deployment Environment

Mappings:
  RegionMap:
    ap-northeast-1:
      AZ1: ap-northeast-1a
      AZ2: ap-northeast-1b
      AZ3: ap-northeast-1c
      AZ4: ap-northeast-1d
    ap-northeast-2:
      AZ1: ap-northeast-2a
      AZ2: ap-northeast-2b
      AZ3: ap-northeast-2c
      AZ4: ap-northeast-2d

Resources:
  # --- Public Subnet --- #
  Subnet:
    Type: AWS::EC2::Subnet
    Properties:
      VpcId: !Sub
        - "{{resolve:ssm:/config/${Project}/${EnvType}/network/vpc/id}}"
        - Project: !Select [ 0, !Split [ "-", !Ref "AWS::StackName" ] ]
      CidrBlock: !Select
        - 0
        - !Cidr
          - !ImportValue
            Fn::Sub:
              - "${Project}-${EnvType}-network-vpc-cidr"
              - Project: !Select [ 0, !Split [ "-", !Ref "AWS::StackName" ] ]
          - 100
          - 8
      AvailabilityZone: !FindInMap [ RegionMap, !Ref AWS::Region, !Ref AZ ]
      MapPublicIpOnLaunch: true
      Tags:
        - Key: Project
          Value: !Select [ 0, !Split [ "-", !Ref "AWS::StackName" ] ]
        - Key: Environment
          Value: !Ref EnvType
        - Key: Layer
          Value: !Select [ 1, !Split [ "-", !Ref "AWS::StackName" ] ]
        - Key: Capability
          Value: "Subnet"

  RouteTable:
    Type: AWS::EC2::RouteTable
    Properties:
      VpcId: !Sub
        - "{{resolve:ssm:/config/${Project}/${EnvType}/network/vpc/id}}"
        - Project: !Select [ 0, !Split [ "-", !Ref "AWS::StackName" ] ]
      Tags:
        - Key: Project
          Value: !Select [ 0, !Split [ "-", !Ref "AWS::StackName" ] ]
        - Key: Environment
          Value: !Ref EnvType
        - Key: Layer
          Value: !Select [ 1, !Split [ "-", !Ref "AWS::StackName" ] ]
        - Key: Capability
          Value: "RouteTable"
  Route:
    Type: AWS::EC2::Route
    Properties:
      RouteTableId: !Ref RouteTable
      DestinationCidrBlock: 0.0.0.0/0
      GatewayId: !Sub
        - "{{resolve:ssm:/config/${Project}/${EnvType}/network/internetgateway/id}}"
        - Project: !Select [ 0, !Split [ "-", !Ref "AWS::StackName" ] ]

  SubnetRouteTableAssociation:
    Type: AWS::EC2::SubnetRouteTableAssociation
    Properties:
      SubnetId: !Ref Subnet
      RouteTableId: !Ref RouteTable

  # --- SSM Parameters --- #
  SsmSubnetId:
    Type: AWS::SSM::Parameter
    Properties:
      Name: !Sub
        - "/config/${Project}/${EnvType}/${Layer}/subnet/id"
        - Project: !Select [ 0, !Split [ "-", !Ref "AWS::StackName" ] ]
          Layer: !Select [ 1, !Split [ "-", !Ref "AWS::StackName" ] ]
      Type: String
      Value: !Ref Subnet

Outputs:
  SubnetId:
    Description: The ID of the Subnet
    Value: !Ref Subnet
```

## 1. Parameters 섹션

네트워크 구성의 기본 정보와 특히 **NACL의 Stateless 검증 규칙**을 활성화/비활성화할 수 있는 제어 스위치들이 정의되어 있다.

| **파라미터명** | **타입** | **설명** |
| --- | --- | --- |
| **EnableOutboundTcpResponse** | String | Outbound 방향의 **Ephemeral Port(1024-65535)** 허용 여부를 결정 (기본값: true) |
| **EnableOutboundIcmpResponse** | String | Ping 테스트에 대한 응답(**Echo Reply**) 허용 여부를 결정 (기본값: true) |
| **DenySourceCidr** | String | **(선택 사항)** 인바운드에서 명시적으로 차단하고 싶은 특정 IP 대역(CIDR)을 입력 |

NACL은 Security Group과 달리 응답 트래픽을 자동으로 허용하지 않는다. 따라서 `EnableOutbound...` 파라미터들을 통해 응답 규칙을 명시적으로 생성할지 선택할 수 있다.

## 2. Conditions 섹션

사용자가 입력한 파라미터 값을 평가하여, 실제 리소스(NACL Entry)를 생성할지 말지 결정하는 논리 필터들을 정의한다.

- **IsOutboundTcpResponseEnabled**: `EnableOutboundTcpResponse`가 "true"일 경우에만 TCP 응답 규칙을 생성
- **IsOutboundIcmpResponseEnabled**: `EnableOutboundIcmpResponse`가 "true"일 경우에만 ICMP 응답 규칙을 생성
- **HasDenySourceCidr**: `DenySourceCidr` 파라미터에 값이 입력되었을 때만(빈 문자열이 아닐 때) 차단 규칙을 생성

## 3. Resources 섹션: Custom NACL

Public 서브넷의 보안을 담당하는 `PublicNacl` 리소스와 그 세부 규칙(Rule)들을 정의한다.

### ① PublicNacl (네트워크 ACL 본체)

- Public 서브넷의 입구와 출구에서 트래픽 필터
- `ConfigMap`을 참조하여 `lab11-Public-NACL`이라는 이름이 자동으로 부여

### ② Inbound Rules (들어오는 트래픽)

| **논리적 ID** | **규칙 번호** | **프로토콜** | **역할** |
| --- | --- | --- | --- |
| **InboundDenyRule** | 50 | ALL | **[조건부]** 사용자가 지정한 특정 IP를 최우선적으로 차단 |
| **InboundSSH** | 100 | TCP (22) | 외부에서의 SSH 접속을 허용 |
| **InboundICMP** | 110 | ICMP | 외부에서의 Ping 요청(Echo Request)을 허용 |

### ③ Outbound Rules (나가는 트래픽 - Stateless 응답)

NACL은 요청이 들어왔어도 나가는 길을 열어주지 않으면 통신이 불가능하다. 이를 해결하기 위한 규칙들이다.

| **논리적 ID** | **규칙 번호** | **포트 범위** | **설명** |
| --- | --- | --- | --- |
| **OutboundTcpResponse** | 100 | 1024-65535 | **[조건부]** TCP 요청에 대한 응답이 나갈 수 있는 통로(에페메럴 포트) 개방 |
| **OutboundIcmpResponse** | 110 | N/A | **[조건부]** Ping 요청에 대한 응답(Echo Response, Type 0) 허용 |

### ④ Association (연결)

**PublicSubnetNaclAssociation**: 위에서 정의한 모든 규칙(`PublicNacl`)을 실제 `PublicSubnet`에 바인딩하여 활성화 한다.

# Stack 배포 및 검증

## Step1: 초기 배포 (정상 통신)

먼저 모든 통로가 열린 상태로 배포하여 Public Instance로 SSH 접속 및 Ping 테스트가 정상인지 확인한다.

1. **스택 생성**
    1. lab11-network-vpc stack
        
        ```bash
        $ aws cloudformation create-stack --stack-name lab11-network-vpc --template-body file://lab11-network-vpc.yaml
        ```
        
    2. lab11-network-subnet stack
        
        ```bash
        $ aws cloudformation create-stack --stack-name lab11-network-subnet --template-body file://lab11-network-subnet.yaml
        ```
        
    3. lab11-network-nacl stack
        
        ```bash
        $ aws cloudformation create-stack --stack-name lab11-network-nacl --template-body file://lab11-network-nacl.yaml
        ```
        
    4. lab11-application-service stack
        
        ```bash
        $ aws cloudformation create-stack --stack-name lab11-application-service --template-body file://lab11-application-service.yaml --parameters ParameterKey=KeyName,ParameterValue=mykey-aws-admin ParameterKey=SshSourceCidr,ParameterValue=$(curl -s ifconfig.me***)***/32
        ```
        
2. **검증**
    
    ```bash
    # ICMP
    $ ping xx.xxx.xxx.xx
    
    # SSH
    $ ssh -i mykey.pem ec2-user@xx.xxx.xxx.xx
    ```
    

## Step2: NACL Rule 우선순위 검증

가장 우선순위가 높은 50번 규칙을 생성하여 `DenySourceCidr` 에 지정한 IP Block의 접속을 강제로 차단한다.

1. **스택 업데이트**
    
    ```bash
    $ aws cloudformation update-stack --stack-name lab11-network-nacl --use-previous-template --parameters ParameterKey=EnableOutboundTcpResponse,ParameterValue=true ParameterKey=EnableOutboundIcmpResponse,ParameterValue=true ParameterKey=DenySourceCidr,ParameterValue=$(curl -s ifconfig.me***)***/32
    ```
    
    - **`EnableTcpOutboundResponse: true`**
    - **`EnableIcmpOutboundResponse: true`**
    - **`DenySourceCidr: 본인의 공인 IP(예: 1.2.3.4/32)`**
2. **검증**
    
    ```bash
    # ICMP
    $ ping xx.xxx.xxx.xx
    
    # SSH
    $ ssh -i mykey.pem ec2-user@xx.xxx.xxx.xx
    ```
    
    기존 SSH 세션이 끊기거나, 신규 접속 시 응답 없이 타임아웃이 발생한다. 이는 NACL 단계에서 패킷이 Drop 되었기 때문이다.
    

## Step3: Stateless 특성 검증

1. **스택 업데이트**
    
    ```bash
    $ aws cloudformation update-stack --stack-name lab11-network-nacl --use-previous-template --parameters ParameterKey=EnableOutboundTcpResponse,ParameterValue=false ParameterKey=EnableOutboundIcmpResponse,ParameterValue=false ParameterKey=DenySourceCidr,ParameterValue=""
    ```
    
    - **`EnableTcpOutboundResponse: false`**
    - **`EnableIcmpOutboundResponse: false`**
    - **`DenySourceCidr: ""`**
2. **검증**
    
    ```bash
    # ICMP
    $ ping xx.xxx.xxx.xx
    
    # SSH
    $ ssh -i mykey.pem ec2-user@xx.xxx.xxx.xx
    ```
    
    접속 시도 시 한참을 기다리다 **Connection Timeout**이 발생한다. 나가는 규칙(`OutboundResponse`)이 조건부 로직에 의해 삭제되었으므로 서버의 응답 패킷이 NACL Outbound 단계에서 Drop 된다.
    

## Step4: 초기 배포 상태 복구

먼저 모든 통로가 열린 상태로 다시 복구한다. Public Instance로 SSH 접속 및 Ping 테스트가 정상인지 확인한다.

1. **스택 업데이트**
    
    ```bash
    $ aws cloudformation update-stack --stack-name lab11-network-nacl --use-previous-template --parameters ParameterKey=EnableOutboundTcpResponse,ParameterValue=true ParameterKey=EnableOutboundIcmpResponse,ParameterValue=true ParameterKey=DenySourceCidr,ParameterValue=""
    ```
    
    - **`EnableTcpOutboundResponse: true`**
    - **`EnableIcmpOutboundResponse: true`**
    - **`DenySourceCidr: ""`**
2. **검증**
    
    ```bash
    # ICMP
    $ ping xx.xxx.xxx.xx
    
    # SSH
    $ ssh -i mykey.pem ec2-user@xx.xxx.xxx.xx
    ```
    

# Stack 삭제

```bash
# lab11-application-service 삭제
$ aws cloudformation delete-stack --stack-name lab11-application-service

# lab11-network-nacl 삭제
$ aws cloudformation delete-stack --stack-name lab11-network-nacl

# lab11-network-subnet 삭제
$ aws cloudformation delete-stack --stack-name lab11-network-subnet

# lab11-network-vpc 삭제
$ aws cloudformation delete-stack --stack-name lab11-network-vpc
```
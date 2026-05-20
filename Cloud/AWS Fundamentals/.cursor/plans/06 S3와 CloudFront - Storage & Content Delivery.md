# Chapter 06: S3와 CloudFront - Storage & Content Delivery

## 챕터 목표

AWS의 객체 스토리지 서비스 S3의 핵심 개념과 접근 제어를 학습하고, 정적 웹 호스팅과 CloudFront CDN을 통한 콘텐츠 배포를 구성한다. EC2에서 IAM Role을 통해 S3에 접근하는 방법을 다룬다.

## 챕터 성격

이론 + 실습. 스토리지 개념부터 CDN 배포까지 점진적으로 확장한다.

---

## Section 구성

### 01 S3 개요와 Bucket 관리

**주요 내용:**

- S3(Simple Storage Service)란
  - 객체 스토리지 서비스: 파일을 Object로 저장
  - Block Storage(EBS)와 Object Storage(S3)의 차이
  - 무제한 저장 용량, 높은 내구성(99.999999999%)
- 핵심 개념
  - Bucket: Object를 담는 컨테이너 (글로벌 고유 이름)
  - Object: 파일 + 메타데이터
  - Key: Object의 고유 식별자 (경로 형태)
  - S3 URI: s3://bucket-name/key
- Storage Class
  - Standard: 자주 접근하는 데이터
  - Standard-IA: 비빈번한 접근
  - Glacier: 아카이브
  - 선택 기준과 비용 비교
- Versioning
  - Bucket Versioning 활성화
  - Object 버전 관리
  - 삭제 마커와 복원

**실습:**

- lab17: S3 Bucket 생성과 Object 관리
  - Bucket 생성, Object 업로드/다운로드, Versioning 활성화, 버전 관리 확인

---

### 02 Bucket Policy와 접근 제어

**주요 내용:**

- S3 접근 제어 메커니즘
  - Bucket Policy: Bucket 수준의 리소스 기반 정책
  - ACL(Access Control List): 레거시 방식 (간략 소개)
  - Block Public Access: 공개 접근 차단 설정
- Bucket Policy 구조
  - JSON 형식: Effect, Principal, Action, Resource, Condition
  - IAM Policy와의 차이: Principal 지정 가능
- EC2에서 S3 접근
  - IAM Role(Instance Profile)을 통한 접근
  - Access Key 사용의 문제점과 Role 사용의 장점
  - AWS SDK에서 자동 자격 증명 획득
- 실전 접근 제어 패턴
  - 특정 IAM Role에서만 Bucket 접근 허용
  - 특정 VPC Endpoint에서만 접근 허용 (개념 소개)

**실습:**

- lab18: Bucket Policy와 EC2-S3 연동
  - Bucket Policy 작성, EC2에 IAM Role 연결, EC2에서 S3 Object 업로드/다운로드

---

### 03 정적 웹 호스팅과 CloudFront

**주요 내용:**

- S3 정적 웹 호스팅
  - 정적 웹사이트 호스팅 설정
  - Index Document, Error Document 설정
  - Bucket Policy로 공개 접근 허용
  - S3 Website Endpoint
- CloudFront 개요
  - CDN(Content Delivery Network)이란
  - Edge Location을 통한 글로벌 콘텐츠 배포
  - 낮은 지연 시간과 높은 전송 속도
- CloudFront Distribution
  - Distribution 생성
  - Origin: S3 Bucket 또는 ALB
  - Behavior: 캐시 동작 설정
  - Domain Name: CloudFront 기본 도메인
- OAC(Origin Access Control)
  - S3에 직접 접근을 차단하고 CloudFront를 통해서만 접근
  - OAC 설정과 Bucket Policy 연동
- CloudFront + S3 통합 패턴
  - 정적 파일은 CloudFront + S3
  - 동적 API는 CloudFront + ALB (개념 소개)

**실습:**

- lab19: S3 정적 웹 호스팅과 CloudFront Distribution
  - S3 정적 웹사이트 구성, CloudFront Distribution 생성, OAC 설정, CloudFront 도메인으로 접근 확인

---

## 프로젝트 Lab

- [실습] Gallery: S3 연동
  - Gallery 업로드 저장소를 S3로 전환한다 (`app.storage.type=s3`)
  - EC2의 IAM Role에 S3 접근 권한을 추가한다
  - 애플리케이션 요청을 수행한 뒤 S3 Bucket에 Object가 생성/삭제되는지 확인한다

---

## 선행 조건

- Ch02 학습 완료 (IAM Role, Policy 이해)
- Ch03 학습 완료 (EC2 Instance 운영)
- Ch04 학습 완료 (VPC, 보안 설정)

---

## 상태

- 작성일: 2026-03-19
- 상태: 확정

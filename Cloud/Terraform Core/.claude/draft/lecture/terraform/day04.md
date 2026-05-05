# Day 04 — Custom VPC 구축 (동적 구성 I)

> 시리즈 매핑: Ch05.01

---

## 시간 1: 조건식, count 정수 반복, count.index
- **시리즈**: 05.01 (이론 — 조건식 + count)
- **강의 포인트**: `condition ? true_val : false_val`. count 정수 반복, `count.index` 0부터. count 리소스 주소 `[0]`, `[1]`. reindexing 문제 예고.
- **전환**: "Custom VPC를 만들어보자 — 이 챕터 끝까지 이 VPC 위에서 작업한다"

## 시간 2: Lab — Custom VPC + IGW 기반 생성
- **시리즈**: 05.01 lab01
- **실습**: VPC + IGW 생성
- **강의 포인트**: `local.network` map 구조 도입. 이 lab은 count/for_each 아님 — base infrastructure. Ch05 전체 아키텍처 다이어그램 보여주기.
- **주의**: "이 VPC는 Day 5 끝까지 확장된다" 강조

## 시간 3: Lab — count로 EIP 복수 생성
- **시리즈**: 05.01 lab02
- **실습**: count = eip_count로 EIP 생성
- **강의 포인트**: `count.index`로 Name 차별화. output에서 `[0]`, `[1]` 인덱스 접근. output 하드코딩 문제 인식.
- **라이브 데모**: eip_count 변경 → plan 변화 확인

## 시간 4: Lab — count 조건부 NAT Gateway (plan only)
- **시리즈**: 05.01 lab03
- **실습**: count 조건부 NAT GW — plan만
- **강의 포인트**: `count = natgw_enabled ? 1 : 0`. 조건부 리소스 `[0]` 접근 주의 — `false`면 `[0]` 오류. output도 조건부 처리 필요. **apply 안 함** — 서브넷이 아직 없다.
- **전환**: "서브넷을 만들려면 for_each가 필요하다"

## 시간 5: for_each — map/set 기반 반복
- **시리즈**: 05.01 (이론 — for_each)
- **강의 포인트**: map 기반 `each.key`/`each.value`. set 기반 `toset()`. 키 기반 리소스 주소 `["public-a"]`. count vs for_each 비교 테이블 — reindexing 문제.
- **전환**: "서브넷 4개를 for_each로 만들자"

## 시간 6: Lab — for_each map으로 Subnet ×4 + Route Table
- **시리즈**: 05.01 lab04
- **실습**: Subnet ×4, Route Table ×4, Association ×4
- **강의 포인트**: `local.network.subnets` map 구조. `each.key`로 Name 태그. Route Table에 아직 route 없음 — 기본 local route만. output 하드코딩 (4개 서브넷 일일이). "output이 서브넷 수에 종속되면 안 된다 → Day 5 for expression"
- **라이브 데모**: apply 후 AWS 콘솔에서 Route Table의 route 확인 — local만 있음

## 시간 7: Lab — for_each set으로 NAT Gateway 재구현
- **시리즈**: 05.01 lab05
- **실습**: for_each = toset(natgw_subnets)로 NAT GW + EIP
- **강의 포인트**: lab03(count, 전체 on/off) vs lab05(for_each, 서브넷 선택) 비교 테이블. `subnet_id = aws_subnet.main[each.value].id` — 서브넷 참조. route 아직 미설정 → Day 5 dynamic.
- **라이브 데모**: natgw_subnets 리스트에서 항목 제거 → 해당 NAT GW만 삭제 (count와 다름)

## 시간 8: count vs for_each 정리
- **과제**: Subnet ×4 + NAT GW 배포 결과 확인
- **강의 포인트**: 비교 정리. 선택 기준: 동일 N개 = count, 각각 다른 설정 = for_each, 조건부 = count 0/1. "아직 미완성: route 설정, output 하드코딩 → 내일 해결"
- **마무리**: "Custom VPC의 뼈대가 완성됐다. 내일 SG, route, ALB를 추가하고 Gallery를 이전한다"

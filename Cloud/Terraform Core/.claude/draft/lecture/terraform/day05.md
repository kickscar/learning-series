# Day 05 — SG, ALB & Custom VPC 완성 (동적 구성 II)

> 시리즈 매핑: Ch05.02 + Ch05.03 + Ch05.04 Gallery

---

## 시간 1: for expression — list/map 변환, if 필터
- **시리즈**: 05.02 (이론 전반)
- **강의 포인트**: `[for s in list : upper(s)]` list 생성. `{for k, v in map : k => v}` map 생성. `if` 필터. map 입력 → list 출력. for_each와 조합.
- **전환**: "for expression으로 데이터를 전처리하고 dynamic 블록에 넣는다"

## 시간 2: Lab — for expression + dynamic ingress — 단일 SG
- **시리즈**: 05.02 lab01
- **실습**: for expression(map→list + if 필터) + dynamic ingress SG
- **강의 포인트**: `local.sg_config` — locals에서 전처리. `dynamic "ingress"` — iterator 생략 시 블록 이름이 기본값. output에서 for expression으로 동적 출력.
- **라이브 데모**: workload.instance에 항목 추가 → plan에서 ingress 규칙 자동 추가 확인

## 시간 3: Lab — 복수 SG (platform/workload Layer별 분리)
- **시리즈**: 05.02 lab02
- **실습**: for_each + merge + dynamic — Layer별 SG
- **강의 포인트**: `merge()`로 platform/workload sg_config 조합. for_each로 SG 복수 생성. 이중 for expression output. "설정을 바꾸면 리소스와 output이 즉시 반영" 체험. validation 부재 → 시간 4에서 해결.
- **라이브 데모**: platform.lb.listener 주석 처리 → plan에서 SG 삭제 + output 자동 반영

## 시간 4: 내장 함수 — cidrsubnet, lookup, try/can, startswith
- **시리즈**: 05.03 (이론)
- **강의 포인트**: 카테고리별 핵심 함수. `cidrsubnet` — VPC CIDR에서 서브넷 자동 계산. `lookup` — 키 누락 방어. `try`/`can` — 설정 유효성 검증. `startswith` — 서브넷 유형 판별. terraform console로 즉석 실험.
- **전환**: "이 함수들로 Day 4의 미완성 코드를 완성하자"

## 시간 5: Lab — Custom VPC 완성 — 내장 함수로 검증 강화
- **시리즈**: 05.03 lab01
- **실습**: 전체 통합 + dynamic route + 동적 output
- **강의 포인트**: Day 4의 route 미설정 → `dynamic "route"` + `startswith` + `contains(keys(...))`. Day 4의 output 하드코딩 → for expression. `cidrsubnet`으로 하드코딩 CIDR 제거. `lookup`/`try`/`can`으로 설정 방어. **Ch05의 결정판.**
- **라이브 데모**: `natgw_subnets = []` → plan에서 NAT GW 삭제 + private route 소멸 + output 자동 반영

## 시간 6: ALB 아키텍처 — ALB + Target Group + Listener
- **시리즈**: 05.04 Gallery (이론)
- **강의 포인트**: ALB = L7 로드밸런서. TG = 대상 그룹. Listener = 포트/프로토콜 매핑. ALB DNS = 안정적 endpoint (EC2 IP 불변성 해결). health check.
- **전환**: "VPC 완성 + SG 완성 → ALB를 올리자"

## 시간 7: Lab — ALB + TG + EC2 ×2 배포
- **시리즈**: 05.04 Gallery (실습)
- **실습**: ALB + TG + Listener, for_each EC2 ×2, TG attachment
- **강의 포인트**: `for_each = toset(workload.instance.subnets)` EC2 배치. TG attachment 자동 등록. EC2 SG cidrs = VPC CIDR만 허용 (ALB를 통해서만 접근).
- **라이브 데모**: apply 후 ALB DNS로 접속 → 새로고침 시 두 EC2에 번갈아 분배

## 시간 8: Gallery — Custom VPC 이전 + "코드가 커졌다"
- **시리즈**: 05.04 Gallery (정리)
- **과제**: Gallery ALB endpoint 접속 확인
- **강의 포인트**: Gallery가 default VPC → custom VPC + ALB로 이전 완료. **코드 점검**: main.tf 200줄+, locals 100줄+. "한 명이면 괜찮다. 팀이면? 네트워크 담당이 수정하고 싶은데 같은 파일에서 충돌." → **Ch05까지 = TF 도구 학습 완료. Day 6부터 = 팀/실무 운용.**
- **마무리**: "내일 이 코드를 모듈로 쪼갠다"

# Rule: korean-writing

한국어 문서 작성 규칙.

---

## 기본 원칙

- 문서는 **한국어**로 작성
- 기술 용어는 **영문 유지** — 번역하지 않음
- 문체: **~다 체** (서술형)

---

## 영문 용어 표기

### 첫 등장 시
영문과 한글을 함께 표기: `Virtual Network (가상 네트워크)`

### 이후
영문만 사용: `Virtual Network`

### Google Cloud Console 메뉴
Console UI 경로에서는 한글 메뉴명 그대로 사용 가능.
```
Google Cloud Console > Compute Engine > **VM 인스턴스**
```

---

## 번역하지 않는 용어 목록

아래 용어는 한글 번역 없이 영문 그대로 사용한다.

- 서비스명: Compute Engine, VPC, Cloud Storage, Cloud Run, Artifact Registry, Cloud SQL, Cloud NAT, Firewall Rule, Managed Instance Group 등
- 개념어: Subnet, Load Balancer, SKU, Ingress, Revision 등
- 동작어: Deploy, Scale, Provision, Mount 등
- 상태어: Running, Stopped, Available, Healthy 등

---

## 금지 표현

- ~~"~하십시오"~~ → `~한다`
- ~~"~해주세요"~~ → `~한다`
- ~~"~할 수 있습니다"~~ → `~할 수 있다`
- ~~"클릭합니다"~~ → 콘솔 경로 + 이미지로 대체

---

## 숫자/단위

- 숫자는 아라비아 숫자: `8 GiB`, `3개`
- 포트: `8080`, `443`
- CIDR: `10.0.0.0/16`

---

## 참고/주의 표기

비용 주의 섹션 없음.

기술적 주의사항은 본문에 자연스럽게 포함:
```
이 시점에서 {리소스}를 삭제하면 {영향}이 발생한다.
```

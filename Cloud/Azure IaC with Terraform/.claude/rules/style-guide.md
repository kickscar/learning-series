# 스타일 가이드

## 헤딩 규칙

### 이론 섹션

```
(챕터/섹션 제목 없이 개요 문단으로 시작)

# 개념명                    ← H1: 번호 없음
## 1. 소주제               ← H2: 아라비아 번호
### ① 세부 항목            ← H3: 원숫자
## 2. 소주제
### ① 세부 항목
### ② 세부 항목

# 핵심 정리                 ← 고정 H1
# 참고 자료                 ← 고정 H1
```

### Lab 섹션

```
# [실습] lab{no}: {제목}    ← H1: 실습 표기
### 실습 목표               ← H3: 목표 리스트
# 1. 전체 아키텍처          ← H1: 번호
# 2. 사전 준비
# 3. {작업 단계}
## main.tf                  ← H2: 파일명
## variables.tf
# n. 배포
## terraform init
## terraform plan
## terraform apply
# n+1. 결과 확인
## terraform output
## az CLI 확인
# n+2. 자원 정리            ← Gallery Lab은 이 섹션 생략 가능 (누적)
```

### 고정 H1

- `# 전체 아키텍처` — Lab/Gallery 시작
- `# 사전 준비` — Lab/Gallery 필수
- `# 핵심 정리` — 이론 섹션 마무리
- `# 참고 자료` — 이론 섹션 마무리

### 헤딩 금지사항

- 헤딩에 **볼드** 사용 금지
- 문서 시작에 챕터/섹션 제목 넣지 않음 (개요 문단으로 시작)

## 인라인 표기

| 대상 | 표기 | 예시 |
|------|------|------|
| 파일명 | 백틱 | `main.tf`, `variables.tf` |
| 리소스 주소 | 백틱 | `azurerm_resource_group.main` |
| 속성/인수 | 백틱 | `location`, `address_space` |
| 명령어 | 백틱 | `terraform plan`, `az group list` |
| 설정값 | **볼드 + 백틱** | **`koreacentral`**, **`Standard_B1s`** |
| 환경변수 | 백틱 | `ARM_CLIENT_ID` |

## 이미지 플레이스홀더

콘솔 화면이나 Mermaid로 표현 불가한 개념은 플레이스홀더를 사용한다:

```
[콘솔화면: Azure Portal에서 Federated Credential 설정 화면]
[이미지: VNet Peering 토폴로지 — Hub-Spoke 구조]
```

- 이론, 실습 구분 없이 필요한 곳에 배치
- 설명은 구체적으로 — 사용자가 캡처/제작할 때 참고

## 리소스 네이밍 표기

Azure CAF 네이밍 컨벤션을 따른다. `rules/naming-tagging.md` 참조.

### RG 레벨

```
rg-azure-iac-{context}
```

예: `rg-azure-iac-lab09`, `rg-azure-iac-gallery-dev`

### 리소스 레벨 (RG 내부)

```
{type}-{role}
```

예: `vnet-base`, `vm-web`, `nsg-vm-web`

## 참고 자료 형식

```markdown
# 참고 자료

- [azurerm_resource_group](https://registry.terraform.io/providers/hashicorp/azurerm/latest/docs/resources/resource_group) — Terraform Registry
- [Resource Group 개요](https://learn.microsoft.com/en-us/azure/azure-resource-manager/management/overview) — Microsoft Learn
```

# research/azure-provider — Azure Provider 조사

## 목적

섹션에서 사용하는 azurerm provider 리소스·속성의 정확성을 조사하고 기록한다.

## 조사 항목

| 항목 | 설명 |
|------|------|
| azurerm 리소스 존재 여부 | 해당 리소스가 현재 provider에 존재하는지 |
| 필수/선택 속성 | required vs optional 인수 확인 |
| 속성 지원 버전 | 특정 속성이 추가/변경/폐기된 버전 |
| Azure 서비스 제약 | 이름 규칙, SKU 옵션, 리전 가용성 등 |
| 리소스 간 의존성 | 참조 관계, 필수 선행 리소스 |

## 조사 방법

1. **Terraform Registry** — `registry.terraform.io/providers/hashicorp/azurerm/latest/docs`
   - 리소스 페이지에서 Argument Reference, Attributes Reference 확인
   - Example Usage 참조
2. **Microsoft Learn** — `learn.microsoft.com`
   - Azure 서비스 제약 조건, 이름 규칙 확인
3. **azurerm Changelog** — provider 릴리스 노트
   - 속성 추가/변경/폐기 이력

## 출력 형식

파일: `.claude/research/{ch_no}.{sec_no}.md`

```markdown
# {ch_no}.{sec_no} 조사 결과

> 조사일: {YYYY-MM-DD}
> azurerm provider 기준: ~> {version}

## 리소스 조사

### azurerm_{resource_name}

| 속성 | 필수 | 타입 | 비고 |
|------|------|------|------|
| name | ✓ | string | {제약 사항} |
| location | ✓ | string | |
| ... | | | |

### 주의사항

- {발견된 제약 조건, 이름 규칙, 버전 요구사항 등}

## 참고 자료

- [리소스명](URL) — 출처
```

## 규칙

- 조사 결과는 **반드시 파일로 저장**
- 조사일과 provider 버전 기준을 기록
- 공식 문서 URL을 참고 자료로 포함
- 확인이 필요한 사항은 `[확인 필요]` 태그
- 사용자와 협의가 필요한 사항은 `[협의 필요]` 태그

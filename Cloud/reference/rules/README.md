# 공유 작성 규칙 (Cloud Learning Series)

전 시리즈(Azure / NCP / GCP / AWS Fundamentals 등)가 **공유**하는 문서 작성 규칙이다. 한 벌만 유지해 드리프트를 없앤다. 한 시리즈에서 규칙을 고치면 전 시리즈가 최신을 쓴다.

## 적용 원칙

- **원칙은 전 플랫폼 공통**: 서술 톤(격식·리터럴·번역투 금지), 헤딩·코드블록·다이어그램 규약, 문장부호(②), README 형식.
- **플랫폼 의존부는 각 시리즈 `CLAUDE.md > 플랫폼 상수` 기준**: 콘솔 이름, 메뉴 경로 형식, CLI 도구, 공식 문서 URL, 네이밍. 규칙 안의 예시가 특정 플랫폼(예: Azure Portal, VNet)을 언급해도 그것은 원칙을 보이는 **예시**일 뿐이고, 실제 적용은 현재 시리즈의 플랫폼 상수를 따른다.
- **항상-on 안전망**: 번역투·리터럴·② 톤의 핵심 원칙은 MEMORY(`feedback_*`)에도 있어 세션마다 자동 로드된다. 이 파일들은 **draft 작성 시 상세 기준으로 읽는다**.

## 파일

| 파일 | 내용 |
|------|------|
| `korean-writing.md` | 한국어 서술 톤(격식·리터럴·번역투), 영문 병기, 문장부호(②) |
| `style-guide.md` | 헤딩, 이미지 플레이스홀더, 설정값 표기, 콘솔 경로, 리소스명 |
| `code-blocks.md` | 코드 블록 언어 지정, 인라인 코드, 설정값 표 |
| `diagram-gen.md` | mermaid·이미지 플레이스홀더 규약 |
| `write-readme.md` | 섹션 콘텐츠 디렉토리 README.md 작성 규칙(draft 통과 후 자동) |

## 시리즈 적용 방식

각 시리즈 `CLAUDE.md`가 "작성 규칙은 `reference/rules/`를 따른다. draft 작성 전 반드시 읽는다"고 지시한다. **시리즈별 로컬 rules는 두지 않는다**(드리프트 방지). 네이밍은 `reference/naming/{시리즈}-naming.md`를 함께 참조한다.

## draft 작성 플로우 (대화형)

에이전트·스킬 파이프라인 없이 대화형(메인 스레드)으로 작업한다. 검증된 순서:

1. **맥락 로드**: `series-hierarchy.md`(전체) + 해당 챕터 plan + 앞뒤 draft + thread
2. **리서치**: 필요 시 inline(WebSearch/WebFetch)로 콘솔 경로·버전·팩트 확인(사실만 흡수)
3. **reconciliation**: plan ↔ 리서치 대조. 충돌·결정 있으면 STOP → 협의
4. **draft 작성**: `.claude/draft/{ch_no}.{sec_no}.claude.notion.md`. 공유 rules + naming 적용
5. **상호체크**: self-check(②·팩트·크로스레퍼런스) + 사용자 검토
6. **콘텐츠 디렉토리 + README** 자동 작성(`write-readme.md`)
7. **SSOT 동기화**: plan 상태, 필요 시 CLAUDE.md
8. **완료 보고**: draft 경로 + README 경로 + 판단 내역

원칙: **한 섹션씩**(batch 금지), 결정이 끼면 **STOP-on-ambiguity**.

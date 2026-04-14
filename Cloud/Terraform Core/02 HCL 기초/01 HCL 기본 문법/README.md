# Ch02 HCL & 핵심 블록 / 01 HCL 문법 기초

HCL의 문법 체계를 잡는다. 블록 구조, 타입 시스템, 표현식을 이해하면 이후 모든 블록이 같은 패턴으로 보인다.

## What you will learn

- 블록(block), 인수(argument), 속성(attribute)의 구조와 차이
- 기본 타입(`string`, `number`, `bool`)과 컬렉션 타입(`list`, `map`, `set`, `object`, `tuple`)
- 참조 표현식으로 블록 간 값 연결하는 방법 (`var.*`, `local.*`, `<type>.<name>.<attr>`)
- 조건식과 문자열 템플릿으로 값을 동적으로 구성하는 방법
- 주석 처리 방법 (`#`, `//`, `/* */`)

## Examples

- `lab01` → `locals`, `output`, `resource` 블록 작성, `terraform plan`으로 확정/미확정 값 차이 확인
- `lab02` → 기본/컬렉션 타입 변수 선언, `-var` 플래그 주입, 타입 불일치 오류 재현
- `lab03` → `terraform console`로 조건식·문자열 템플릿·내장 함수 즉석 평가

## Reference

- Notion: [Notion 문서]()

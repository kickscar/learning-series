# Interpreter and Bytecode

이 디렉토리의 예제들은 **CPython의 실제 실행 모델**을 이해하기 위한 코드들이다.

Python이 단순히 “소스를 한 줄씩 실행하는 인터프리터”가 아니라, **소스 → 바이트코드 컴파일 → 가상 머신 실행**이라는 단계를 거친다는 점을 직접 확인하는 것이 목표다.

## What These Examples Explain
- Python 소스 코드가 바이트코드로 변환되는 과정
- 바이트코드를 확인하는 방법 (`dis`)
- 코드 객체(`code object`)의 개념
- `compile()` 과 `exec()` 실행 분리 모델
- `import` 시 `.pyc` 캐시가 생성되는 구조

## Examples
- `lab01`: 모듈 `import` 시 `__pycache__`가 생성되는 시점과 조건을 테스트한다.
- `lab02/dis_expr.py`: `dis` 모듈을 사용하여 일반적인 연산과 함수가 어떤 Opcode로 변환되는지 확인한다.
- `lab03/dis_via_compile.py`: `compile()` 함수로 소스를 코드 객체로 만들고 `exec()`로 실행하는 저수준 제어를 실습한다.


## Reference

[📘 Notion 문서](https://www.notion.so/02-REPL-vs-vs-m-2f4d1253a08880fda1a3ebc47048309c?source=copy_link)
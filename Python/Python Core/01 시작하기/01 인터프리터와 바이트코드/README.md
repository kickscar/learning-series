# 01 시작하기 / 01 인터프리터와 바이트코드

Python은 소스코드를 직접 실행하지 않는다. 내부적으로 바이트코드로 컴파일한 뒤 CPython VM이 해석하여 실행하는 2단계 실행 모델을 따른다.

## What you will learn

- Python의 2단계 실행 모델 — 컴파일(소스 → 바이트코드)과 인터프리팅(VM 실행)
- 컴파일 파이프라인 — 토큰화 → 파싱(PEG) → AST → 바이트코드 생성
- `dis` 모듈로 바이트코드를 확인하는 방법과 CPython VM의 스택 기반 동작
- `.pyc` 파일과 `__pycache__/`의 역할
- CPython 외 구현체(PyPy, MicroPython, GraalPy)의 존재

## Reference

- Notion: [Notion Document]()

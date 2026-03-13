# `__main__` and Execution Entry Points

이 디렉터리의 예제들은 **Python에서 실행 진입점이 어떻게 결정되는지**를 이해하기 위한 코드들이다.
Python에는 명시적인 `main()` 함수가 없으며, 모듈이 직접 실행되었는지 import되었는지를 `__name__` 값으로 구분한다는 점을 실습을 통해 확인한다.


## What These Examples Explain
이 예제들은 다음 개념을 설명하기 위해 구성되어 있다.

- `__name__` 값이 실행 방식에 따라 어떻게 달라지는지
- `if __name__ == "__main__":` 패턴의 역할
- 하나의 파일을 라이브러리 + 실행 스크립트로 사용하는 방법
- `__main__.py`를 이용한 패키지 실행 구조
- `python -m` 옵션의 내부 동작 개념

## Examples
- `lab01` → 직접 실행과 import 시 `__name__` 차이 확인
- `lab02`, `lab03` → `__main__.py`를 이용한 패키지 CLI 구성
- `lab04` → `runpy.run_module()`로 `-m` 실행 재현

## Reference
[📘 Notion 문서](https://www.notion.so/05-2fcd1253a088808ba679c2443714e9b7?source=copy_link)

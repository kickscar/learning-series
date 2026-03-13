# REPL vs Script vs `-m` Module Execution
이 디렉터리의 예제들은 **Python 실행 방식에 따른 차이**를 이해하기 위한 코드들이다.

겉보기에는 같은 코드라도, REPL / 스크립트 실행 / `python -m` 실행에 따라 `sys.path`와 `__name__`이 다르게 설정되며, 그 결과 import 동작과 실행 흐름이 달라진다.

## What These Examples Explain
- REPL, 스크립트 실행, `-m` 실행의 차이는 무엇인가?
- 실행 방식에 따라 `sys.path[0]`는 어떻게 달라지는가?
- 왜 같은 `import` 문이 실행 방식에 따라 성공/실패하는가?
- `__name__ == "__main__"` 패턴은 왜 필요한가?
- 패키지 구조에서 `-m` 옵션이 표준인 이유는 무엇인가?

## Examples
- `lab02`, `lab05` → 실행 방식별 `sys.path[0]` 값 비교
- `lab03`, `lab04` → 직접 실행과 import 시 `__name__` 차이 확인
- `lab06` → `python -m pkg.mod` 와 `python -m pkg` 동작 비교

## Reference
[📘 Notion 문서](https://www.notion.so/02-REPL-vs-vs-m-2f4d1253a08880fda1a3ebc47048309c?source=copy_link)
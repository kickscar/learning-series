# 01 시작하기 / 02 REPL, 스크립트, -m 옵션

Python 코드를 실행하는 세 가지 방식 — REPL, 스크립트, `-m` 옵션 — 의 차이를 이해하고, `sys.path`와 `sys.argv`가 실행 방식에 따라 어떻게 달라지는지 확인한다.

## What you will learn

- REPL의 동작 원리와 `_` 변수, 3.13 새 REPL 기능
- 스크립트 실행 시 `sys.argv`와 `sys.path[0]` 설정 방식
- `-m` 옵션의 모듈 실행 메커니즘과 스크립트 모드와의 `sys.path[0]` 차이
- `__name__`이 `"__main__"`이 되는 조건과 `if __name__ == "__main__"` 패턴

## Examples

- `lab01-exec-modes/` → REPL, 스크립트, `-m` 옵션에서 `sys.path[0]`과 `sys.argv[0]` 차이 비교

## Reference

- Notion: [Notion Document]()

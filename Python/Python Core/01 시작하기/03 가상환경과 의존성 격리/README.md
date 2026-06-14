# 01 시작하기 / 03 가상환경과 의존성 격리

가상환경은 프로젝트별로 독립된 패키지 공간을 제공하여 버전 충돌을 방지한다. `venv` 모듈의 동작 원리와 `sys.path` 탐색 순서를 이해한다.

## What you will learn

- 전역 `site-packages` 충돌 문제와 가상환경의 필요성
- `python -m venv`로 가상환경 생성, 활성화/비활성화의 본질
- `sys.prefix`와 `sys.base_prefix`로 가상환경 여부 판별
- `python -m pip`이 `pip`보다 안전한 이유
- `sys.path` 탐색 순서 — 스크립트 디렉토리 → PYTHONPATH → site-packages

## Examples

- `lab01-venv-isolation/` → 가상환경 생성, 패키지 설치, 시스템 Python과의 격리 확인

## Reference

- Notion: [Notion Document]()

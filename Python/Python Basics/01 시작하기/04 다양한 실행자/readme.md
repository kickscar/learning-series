# Python Executables and Launchers

이 디렉터리의 예제들은 **Python 실행자를 어떻게 선택하고 제어하는지**를 이해하기 위한 코드들이다.
같은 코드라도  `python`, `python3`, shebang, `py` launcher, 가상환경 활성화 여부에 따라 실제로 실행되는 Python 인터프리터가 달라질 수 있음을 직접 확인하는 것이 목적이다.

## What These Examples Explain
이 예제들은 다음 개념을 설명하기 위해 구성되어 있다.

- `python`과 `python3`가 서로 다른 실행 파일을 가리킬 수 있다는 점
- shebang(`#!/usr/bin/env python3`)이 `PATH`를 따라 실행자를 선택하는 방식
- 가상환경 활성화 전·후 `python`이 가리키는 경로 변화
- Windows에서 `py` launcher를 통한 Python 버전 선택
- `python -m pip`가 설치 대상을 명확히 하는 이유

## Examples
- `lab01` → `python` / `python3` 실행 결과 비교
- `lab02`  → shebang으로 실행되는 Python 확인
- `lab03`  → Windows `py -0`, `py -3.x` 사용 예시

## Reference
- [📘 Notion 문서](https://www.notion.so/04-python-2f9d1253a088805bb293e53fa868505b?source=copy_link)
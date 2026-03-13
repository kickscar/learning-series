# Virtual Environments (venv) and Dependency Isolation

이 디렉터리의 예제들은 **Python 가상환경(venv)의 동작 원리와 의존성 격리 개념**을 이해하기 위한 코드들이다.
전역 Python 환경과 가상환경의 차이, 패키지가 어디에 설치되는지, 그리고 실행 중인 Python 환경을 어떻게 확인하는지를 직접 관찰하는 것이 목적이다.

## What These Examples Explain

이 예제들은 다음 개념을 설명하기 위해 작성되어 있다.

- 가상환경(venv)
- venv 활성화 전·후의 Python 실행 경로 차이
- `site-packages`가 환경별로 분리되는 구조
- `sys.prefix`, `sys.executable`을 통한 환경 판별

## Examples
- `lab01` → 전역 Python과 venv의 `sys.executable` , `sys.prefix`를 이용한 실행 환경 확인
- `lab02` → 패키지 설치 위치(`site-packages`) 확인


## Reference
[📘 Notion 문서](https://www.notion.so/03-venv-2f5d1253a08880d6be94fccb9b9e41b6?source=copy_link)

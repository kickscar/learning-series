# Chapter 1: 시작하기 — 환경과 실행의 메커니즘

## Chapter Definition

### 왜 필요한가

"그냥 실행"이 아니라, **인터프리터·가상환경·실행 모드**가 어떻게 엮여 동작하는지 이해해야 이후 모듈/패키지, `__main__`, `-m` 등의 논의가 자연스럽게 이어진다. 설치만 다루지 않고, "환경"과 "실행"의 메커니즘을 파이썬 사고 모델의 출발점으로 둔다.

### 세부 주제

1. 인터프리터와 바이트코드
2. REPL vs 스크립트 vs `-m` 모듈 실행
3. 가상환경(venv)과 의존성 격리
4. `python` / `python3` / shebang / `py.launcher`
5. `__main__`과 실행 진입점

### 간단 소개

이 챕터에서는 CPython이 소스 코드를 바이트코드로 컴파일하고 VM에서 실행하는 파이프라인, REPL·스크립트·`-m` 세 가지 실행 모드의 차이, venv로 격리된 환경을 만드는 원리, 그리고 `__main__`을 통한 진입점 분리까지 다룬다.

---

## Subject Definition

### 1.1 인터프리터와 바이트코드

- **개요**: 소스 `.py` → AST → 바이트코드 → CPython VM에서 실행. "인터프리터"라고 불리지만 내부적으로는 컴파일 단계를 거친다.
- **목표**: CPython 실행 파이프라인을 이해하고, `.pyc`, `dis`, `compile()`로 바이트코드 수준을 엿볼 수 있게 한다.
- **내용 요약**: `import` 시 `__pycache__`에 `.pyc` 생성, `dis.dis()`로 바이트코드 역어셈블, `compile(source, ..., 'exec')`로 직접 컴파일. JIT·다른 구현체(PyPy 등)는 언급만.

---

### 1.2 REPL vs 스크립트 vs `-m` 모듈 실행

- **개요**: 세 가지 실행 모드—대화형 REPL, 파일 경로로 스크립트 실행, `python -m pkg.mod`로 모듈 실행—가 `sys.path`와 `__name__`을 어떻게 설정하는지 다룬다.
- **목표**: `sys.path`와 `-m`의 관계를 파악하고, `__name__`이 `'__main__'`이 되는 조건을 명확히 한다.
- **내용 요약**: REPL·스크립트는 `sys.path[0]`에 현재 디렉터리 또는 스크립트 디렉터리. `-m` 실행 시 `sys.path[0]`에 **현재 작업 디렉터리**가 들어가 모듈 검색에 영향. `__name__`은 `-m`으로 실행될 때 `'__main__'`.

---

### 1.3 가상환경(venv)과 의존성 격리

- **개요**: 격리된 Python 실행 파일과 `site-packages`를 갖는 venv의 생성·활성화·동작 원리.
- **목표**: venv 생성·활성화를 할 수 있고, `site-packages`, `PYTHONPATH`와의 관계를 이해한다.
- **내용 요약**: `python -m venv .venv`, `source .venv/bin/activate`(Unix) / `.venv\Scripts\activate`(Win). 활성화 시 `PATH`에 `venv`의 `bin`이 먼저 오고, `sys.prefix`가 venv 경로로 바뀜. `pip`는 이 경로의 `site-packages`에 설치. `PYTHONPATH`와의 우선순위.

---

### 1.4 실행자: `python` / `python3` / shebang / `py.launcher`

- **개요**: `python` vs `python3` 심볼릭 링크, shebang `#!/usr/bin/env python3`, Windows `py` launcher로 버전·가상환경 선택.
- **목표**: 교차 플랫폼에서 올바른 Python 실행자를 선택할 수 있게 한다.
- **내용 요약**: `#!/usr/bin/env python3`로 `PATH`에서 `python3` 검색. `py -3.11`, `py -0` 등. 가상환경 활성화 시 `python`이 venv를 가리키게 되는 흐름.

---

### 1.5 `__main__`과 실행 진입점

- **개요**: `if __name__ == "__main__":`로 "직접 실행될 때만" 동작하는 블록을 두는 패턴. `python -m pkg`가 `pkg/__main__.py`를 실행하는 메커니즘.
- **목표**: 라이브러리(import용)와 실행 스크립트(CLI)를 같은 모듈에서 분리하는 방식을 이해한다.
- **내용 요약**: `runpy.run_module('pkg', run_name='__main__')` 동작. `__main__.py`가 있으면 `-m pkg` 시 이 파일이 `__main__`으로 실행됨. Ch8 모듈·패키지와 연계.

---

## Modern Key Concepts

- **`python -m pip`**, **`python -m venv`**: `pip`·`venv`를 모듈로 실행해, "어떤 Python"에 붙일지 명확히 함.
- **`__main__.py`**: `python -m pkg` 실행 시 진입점. 패키지에 CLI를 붙이는 표준 방식.
- **`sys.path`**, **import 검색 순서**: 표준 라이브러리·`site-packages`·`PYTHONPATH`·스크립트/`-m`에 따른 `sys.path[0]`.
- **`-I` (isolated)**, **`-E` (ignore env)**: `PYTHONPATH` 등 환경 변수를 무시하고 실행. 보안·재현성.
- **(선택) `pyproject.toml`과 실행 환경의 미래**: `[project.scripts]`, `uv`·`pdm` 등 현대 도구와의 연결고리만 짚어 둠.

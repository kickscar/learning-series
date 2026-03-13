# Chapter 9: 모듈과 패키지 시스템 — 물리적/논리적 구조화

## Chapter Definition

### 왜 필요한가

`import`를 **검색 경로, 바이트코드 캐시, 네임스페이스 주입**의 메커니즘으로 풀고, 패키지·`__init__.py`·namespace package까지 구조화 원칙을 다룬다.

### 세부 주제

1. 모듈: 하나의 `.py` = 하나의 모듈 객체
2. `import`/`from`: `importlib`, `sys.modules`, `sys.path`
3. `__init__.py`, 패키지, `from pkg import mod`
4. 상대 import: `.`, `..`, 패키지 내부에서만
5. `if __name__ == "__main__"` 재 visit
6. `*.pyc`, `__pycache__`, `-B`
7. (Deep) namespace package, `pkg_resources`/`importlib.metadata` 맛보기
8. `pyproject.toml`, `[tool.setuptools]` 등 현대 패키징 방향

### 간단 소개

하나의 `.py`가 하나의 모듈 객체로 `sys.modules`에 캐시되는 방식, `sys.path`와 `import` 검색 순서, `__init__.py`를 둔 패키지와 상대 import, `__main__`·`-m`과의 연계, `__pycache__`·`-B`, namespace package, 그리고 `pyproject.toml` 기반 현대 패키징을 다룬다.

---

## Subject Definition

### 9.1 모듈 객체

- **개요**: 하나의 `.py` 파일이 한 번 로드될 때 하나의 모듈 객체가 만들어지고 `sys.modules['name']`에 저장. 재 import는 캐시에서 반환.
- **목표**: 모듈이 사실상 싱글톤처럼 동작함을 이해한다.
- **내용 요약**: `import foo` → `sys.modules['foo']`에 없으면 로드 후 등록. `from foo import x`는 `foo`를 먼저 import한 뒤 `x`를 현재 네임스페이스에 바인딩.

### 9.2 import와 경로

- **개요**: `sys.path`에 있는 디렉터리·zip 등에서 이름에 해당하는 모듈을 검색. `PYTHONPATH`, 표준 라이브러리, `site-packages`, 스크립트/`-m`에 따른 `sys.path[0]`.
- **목표**: `-m`과 `__main__` 실행 시 `sys.path[0]`에 현재 작업 디렉터리가 들어가는 점을 Ch1과 연결해 파악한다. `importlib.util`로 동적 로드 맛보기.
- **내용 요약**: `sys.path` 순서. `python -m pkg` 시 `''`(CWD)가 먼저. `importlib.import_module`, `importlib.util.spec_from_file_location`.

### 9.3 패키지와 `__init__.py`

- **개요**: `__init__.py`를 갖는 디렉터리는 패키지. `from pkg.sub import x` 시 `pkg`·`pkg.sub` 순으로 로드. `__init__.py`는 패키지 로드 시 실행.
- **목표**: `from pkg.sub import x`의 로드 순서와, `__all__`로 `from pkg import *` 제어를 이해한다.
- **내용 요약**: `pkg/__init__.py`, `pkg/sub/__init__.py`. `__all__ = ['a','b']`. `__init__.py`에서 서브모듈을 re-export하는 패턴.

### 9.4 상대 import

- **개요**: `from . import mod`, `from .mod import x`, `from ..pkg import y`. `.`는 현재 패키지, `..`는 상위. **패키지 안**에서만 사용 가능.
- **목표**: 패키지 내부에서만 상대 import를 쓸 수 있고, 탑레벨 스크립트(패키지가 아닌 `__main__`)에서는 쓸 수 없음을 안다.
- **내용 요약**: `from .. import utils`. 탑레벨에서 실행된 스크립트는 패키지에 속하지 않아 `from .` 불가. `-m`으로 패키지의 `__main__`을 실행할 때는 패키지 맥락.

### 9.5 `__main__`

- **개요**: `python -m pkg`는 `pkg/__main__.py`를 `__main__`으로 실행. Ch1의 `__main__`·`-m`과 연계. 라이브러리(import) vs CLI(직접 실행) 분리.
- **목표**: `__main__.py`를 두어 패키지에 CLI 진입점을 붙이는 표준 방식을 익힌다.
- **내용 요약**: `pkg/__main__.py`에 `def main(): ...`와 `if __name__ == "__main__": main()`. `python -m pkg` → `runpy`가 `pkg.__main__` 로드 후 실행.

### 9.6 바이트코드 캐시

- **개요**: `__pycache__/name.cpython-XX.pyc`. `-B`로 캐시 생성 억제. PEP 3147.
- **목표**: `.pyc`의 버전·위치를 알고, 재현성·디버깅 시 `-B`를 쓸 수 있게 한다.
- **내용 요약**: `.pyc`는 `marshal`된 바이트코드+메타. 소스 수정 시 재컴파일. `sys.dont_write_bytecode`.

### 9.7 Namespace package (Deep)

- **개요**: `__init__.py`가 없는 디렉터리도 `pkgutil`·`importlib`에 의해 여러 디렉터리가 하나의 논리적 패키지로 합쳐질 수 있음.
- **목표**: 여러 위치에 흩어진 `pkg` 디렉터리가 하나의 `pkg`로 보일 수 있음을 이해한다. `pkg_resources`/`importlib.metadata`로 메타데이터 조회 맛보기.
- **내용 요약**: 3.3+ namespace package. `import pkg` 시 `sys.path` 순서로 `pkg` 디렉터리를 찾아 `__path__`에 리스트로 보관. `importlib.metadata.version("pkg")` (3.8+).

### 9.8 현대 패키징

- **개요**: `pyproject.toml`의 `[project]` 메타데이터. setuptools/hatch/poetry 등 백엔드. `[project.optional-dependencies]`.
- **목표**: `pyproject.toml` 중심의 패키징이 표준으로 자리 잡았음을 알고, `[project]`의 최소 필드를 본다.
- **내용 요약**: `[project]`에 `name`, `version`, `dependencies`. `[build-system]`에 `requires`·`build-backend`. `[project.optional-dependencies]`로 `pip install pkg[dev]`.

---

## Modern Key Concepts

- **`importlib.metadata.version("pkg")`** (3.8+): 설치된 패키지 버전 조회.
- **`pyproject.toml`**, **`[project.optional-dependencies]`**: 단일 설정 파일, 선택적 의존성.
- **`__init__.py` 없이 네임스페이스 패키지** (3.3+): 여러 경로에 걸친 패키지.
- **`-m`과 `__main__.py`의 표준 패턴**: 패키지에 CLI를 붙이는 관용적 방법.

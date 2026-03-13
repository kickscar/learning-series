# Chapter 8: 예외 처리 — 견고함과 런타임 제어

## Chapter Definition

### 왜 필요한가

예외를 "에러 메시지"가 아니라 **제어 흐름과 계약 위반**으로 보고, `try`/`except`/`else`/`finally`, 계층, 재발생, 예외를 "값"으로 다루는 관점까지 연결한다.

### 세부 주제

1. 예외 개념: `BaseException`, `Exception`, `raise`
2. `try`/`except`/`else`/`finally` 의미
3. `except E as e`: 바인딩, `e` 스코프, 3.12 변경
4. 계층: `except Exception` 보다 구체적 먼저
5. 재발생: `raise`, `raise from`
6. 커스텀 예외, `__init__`, 상속
7. (Deep) 예외 as 제어: `StopIteration`, EAFP vs LBYL
8. `contextlib.suppress`, `contextlib.AsyncExitStack` 언급

### 간단 소개

`BaseException`/`Exception` 계층, 4개 블록(`try`/`except`/`else`/`finally`)의 역할, `except E as e`의 스코프(3.12 정리), `raise from`으로 예외 체인, 커스텀 예외, EAFP vs LBYL, `suppress`로 예외 무시 패턴을 다룬다.

---

## Subject Definition

### 8.1 예외 개념

- **개요**: `BaseException`(최상위), `Exception`(일반적인 예외), `SystemExit`, `KeyboardInterrupt` 등. `raise TypeError("msg")`로 발생.
- **목표**: `KeyboardInterrupt` 등 `BaseException` 직계는 보통 잡지 않아야 함을 이해한다. `raise E`/`raise E("msg")`.
- **내용 요약**: `except Exception`이 `KeyboardInterrupt`를 안 잡는 이유. `raise RuntimeError("invalid state")`.

### 8.2 try/except/else/finally

- **개요**: `try` 안에서 예외 발생 시 `except`로. 예외 없이 `try`가 끝나면 `else`. `finally`는 예외 유무와 관계없이 **항상** 실행. `else`는 "예외가 없을 때만".
- **목표**: 4개 블록의 역할과 순서, 조합을 정확히 안다.
- **내용 요약**: `try` → (`except` 또는 `else`) → `finally`. `else`는 `except`와 맞물려 "정상 완료 시에만" 실행. `finally`에서 `return`은 예외를 삼킴에 주의.

### 8.3 `as e`와 3.12

- **개요**: `except E as e`로 인스턴스에 바인딩. 3.11 이전에는 `e`가 `except` 블록 밖으로 누출되어 `del e` 관례. 3.12에서 `e`는 `except` 블록 스코프로 제한.
- **목표**: 3.12 이전 `del e` 관례와, 3.12에서의 스코프 정리를 이해한다.
- **내용 요약**: 3.12부터 블록 밖 `e`는 `NameError`. 순환 참조 해제를 위해 이전에 `del e` 권장.

### 8.4 계층과 순서

- **개요**: `except`는 위에서부터 매칭. 구체적인 예외를 먼저, `except Exception`은 마지막에. `BaseException`은 시스템 종료용으로 잡지 않음.
- **목표**: `except Exception`을 맨 나중에 두고, 구체적 예외를 우선 처리하는 패턴을 익힌다.
- **내용 요약**: `except (ValueError, TypeError):` 그룹. `except Exception as e:`는 `KeyboardInterrupt`를 안 잡음.

### 8.5 재발생

- **개요**: `raise`만 하면 현재 예외를 그대로 다시 발생. `raise X from e`로 `__cause__`를 설정해 체인. 디버깅 시 `from` 사용.
- **목표**: 체인과 `__cause__`를 이해하고, 상위에 원인을 전달할 때 `raise NewError(...) from e`를 쓸 수 있게 한다.
- **내용 요약**: `except E: ...; raise` vs `raise F(...) from e`. `from None`으로 이전 예외를 숨길 수 있음(남용 비권장).

### 8.6 커스텀 예외

- **개요**: `class MyError(Exception): pass`. `__init__`으로 인자. `super().__init__(*args)` 권장. `args`로 메시지 보존.
- **목표**: 도메인별 예외를 정의하고, 상속으로 계층을 만든다.
- **내용 요약**: `class ValidationError(ValueError): ...`. `raise MyError("detail")`. `e.args`.

### 8.7 EAFP vs LBYL

- **개요**: "Easier to Ask for Forgiveness than Permission"—일단 시도하고 `try`/`except`. "Look Before You Leap"—`if`로 검사 후 진행. 파이썬 문화는 EAFP 선호.
- **목표**: `try`/`except`를 두려워하지 않고, `get`/`in` 등과 조합해 EAFP 스타일을 익힌다.
- **내용 요약**: `try: d[k]` vs `if k in d:`. `try: int(s)` vs `if s.isdigit()`. 경쟁 조건·원자성 측면에서 EAFP가 나은 경우.

### 8.8 `contextlib.suppress`

- **개요**: `with suppress(FileNotFoundError): os.remove(p)`로 특정 예외만 무시. `try`/`except`/`pass` 대체.
- **목표**: 예외를 의도적으로 무시할 때 `suppress`를 쓸 수 있게 한다.
- **내용 요약**: `with suppress(FileNotFoundError, PermissionError): ...`. `AsyncExitStack`은 비동기·동적 CM 등에서 3.7+.

---

## Modern Key Concepts

- **`raise ... from e`** (exception chaining): `__cause__` 설정, 트레이스백에 "Caused by" 표시.
- **`ExceptionGroup`** (3.11+): `except*`로 그룹 내 일부 예외만 처리. 맛보기 수준.
- **`contextlib.suppress`**: 예외 무시의 선언적 패턴.
- **3.12 `except E as e` 스코프**: `e`가 `except` 블록 안으로 제한, `del e` 관례 불필요.

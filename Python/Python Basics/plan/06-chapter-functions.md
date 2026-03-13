# Chapter 6: 함수와 스코프 — 함수 객체와 네임스페이스

## Chapter Definition

### 왜 필요한가

함수는 "호출 가능한 객체"이며, **LEGB 스코프, 클로저, `*args`/`**kwargs`, 데코레이터**까지 이어지는 "이름 해석"과 함수형 요소의 기초이다. **인자 모델** 안에 **가변 기본 인자** 함정과 해법을 포함해 Ch5(객체)와 맞닿는 부분을 명확히 한다.

### 세부 주제

1. 함수 객체
2. 인자 모델 — 가변 기본 인자 포함
3. `/`와 `*` (3.8+)
4. 반환
5. LEGB, global, nonlocal
6. 클로저
7. 람다, functools
8. Type hints
9. 데코레이터

### 간단 소개

`def`가 객체를 만든다는 점, 인자 모델(위치/키워드/기본값/`*`/`**`, **가변 기본 인자 함정과 `None`+`if l is None: l = []` 해법**), 3.8+ `/`·`*`, LEGB·`global`·`nonlocal`, 클로저와 늦은 바인딩, Type Hints, 데코레이터와 `wraps`를 다룬다.

---

## Subject Definition

### 6.1 함수 객체

- **개요**: `def`가 함수 객체를 생성해 이름에 바인딩. `func.__name__`, `func.__doc__`. 함수를 인자·반환값으로 전달 가능.
- **목표**: 함수에 속성을 부여하고, 함수를 인자로 넘기는 패턴(콜백, 데코레이터)의 기반을 이해한다.
- **내용 요약**: `type(f)`는 `function`. `__name__`, `__qualname__`. `f = g` 후 `f()`는 `g` 호출.

### 6.2 인자 모델

- **개요**: 위치 인자, 키워드 인자, 기본값. `*args`, `**kwargs`. 호출 시 `f(*t)`, `f(**d)` 언패킹. **가변 기본 인자**: `def f(l=[])`에서 `[]`는 함수 정의 시 한 번만 생성되어 같은 리스트가 재사용됨. 누적 버그. 해법: `def f(l=None): l = [] if l is None else l`.
- **목표**: `*args`/`**kwargs`로 가변 인자를 받고 전달할 수 있게 한다. 가변 기본 인자 함정을 이해하고 `None` 체크 패턴으로 해결한다.
- **내용 요약**: `def f(a, b=0, *args, **kwargs)`. `f(1, 2, 3, x=4)` → `args=(3,)`, `kwargs={'x':4}`. 가변 기본인자: `f()` 여러 번 호출 시 `l`에 값 쌓임. `l=None`+`if l is None: l = []`.

### 6.3 `/`와 `*` (3.8+)

- **개요**: `def f(a, /, b, *, c):` — `/` 앞은 위치 전용, `*` 뒤는 키워드 전용.
- **목표**: 인자 이름 변경에 강하고, 의도가 분명한 시그니처를 설계할 수 있게 한다.
- **내용 요약**: `f(1, 2, c=3)` OK, `f(a=1, ...)` 오류. `*` 뒤는 반드시 키워드.

### 6.4 반환

- **개요**: `return` 없으면 `None` 반환. 단일 객체 반환, tuple unpack으로 여러 값처럼 사용. early return 패턴.
- **목표**: `return`의 의미와 `a, b = f()` 활용을 익힌다.
- **내용 요약**: `return x, y`는 `return (x, y)`. `r1, r2 = f()`.

### 6.5 LEGB, global, nonlocal

- **개요**: 이름 검색 순서 Local → Enclosing → Global → Built-in. `global name`, `nonlocal name`.
- **목표**: 전역/외부 스코프 수정 시 `global`/`nonlocal`를 올바르게 쓴다.
- **내용 요약**: `nonlocal x` 없이 `x = ...`하면 로컬 새 바인딩. LEGB는 참조만, 대입 시 스코프 규칙 따로 있음.

### 6.6 클로저

- **개요**: 중첩 함수가 바깥 변수(자유 변수)를 참조. `__closure__`. "늦은 바인딩" 함정: 루프로 클로저 만들 때 마지막 값만 보는 문제.
- **목표**: 클로저 동작 이해, 기본 인자 `default=x`로 "즉시 바인딩" 우회.
- **내용 요약**: `lambda: i`를 루프에서 리스트에 넣으면 모두 마지막 `i`. `lambda i=i: i`로 묶기.

### 6.7 람다, functools

- **개요**: `lambda x: x+1`. `functools.partial`, `reduce`. `map`/`filter`는 제너레이터, list 필요 시 `list(...)`.
- **목표**: 간단한 추상화에 람다·`partial` 사용. `functools.cache`(3.9+) 데코레이터.
- **내용 요약**: `lambda`는 `return` 하나만. `partial(f, 1)(2)` → `f(1, 2)`.

### 6.8 Type hints

- **개요**: `def f(x: int) -> str:`, `list[int]`, `dict[str, int]`, `tuple[int, ...]`, `Callable[[int, str], bool]`. 정적 검사(mypy)·자기 문서화.
- **목표**: 읽고 쓸 수 있고, mypy 등과 연동. Ch10 `Protocol`·`@dataclass`와 연결.
- **내용 요약**: 런타임에는 대부분 무시. `typing.get_type_hints`. `ParamSpec`로 데코레이터 타입.

### 6.9 데코레이터

- **개요**: `@deco`는 `f = deco(f)`. `deco`는 함수를 받아 (보통) 다른 함수를 반환. `functools.wraps`로 `__name__` 등 보존.
- **목표**: 로깅·캐시·인증에 데코레이터 사용, `wraps`로 원본 메타데이터 유지.
- **내용 요약**: `def deco(g): … return g2`. `@deco` 아래 `def f` → `f = deco(f)`. `wraps(f)(g)`.

---

## Modern Key Concepts

- **`def f(a: int, /, b: int = 0, *, c: int) -> str:`**: 위치 전용·기본값·키워드 전용·타입 힌트.
- **`list[int]`**, **`dict[str, int]`**, **`Callable`**.
- **가변 기본 인자**: `def f(l=None): l = [] if l is None else l`.
- **`functools.wraps`**, **`functools.cache`** (3.9+).

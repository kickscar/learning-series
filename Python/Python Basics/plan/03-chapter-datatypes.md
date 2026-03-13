# Chapter 3: 자료형과 연산자 — 데이터의 표현 (basic 입문자)

## Chapter Definition

### 왜 필요한가

값의 "종류"에 따라 쓸 수 있는 연산과 문법이 다르다. **내장 스칼라·시퀀스·매핑·집합**을 입문자 수준에서 다루고, **기본 연산자**(산술, 비교, 논리 등)를 익혀 Ch4(제어문)로 이어진다.

### 세부 주제

1. 내장 스칼라: int, float, str, bytes, bool
2. sequence: list, tuple, range
3. mapping: dict
4. set, frozenset
5. 기본 연산자

### 간단 소개

int·float·str·bytes·bool의 용도와 기본 사용, list·tuple·range의 인덱싱·슬라이싱·이터레이션, dict의 키-값, set의 중복 제거·멤버십, 그리고 산술·비교·논리·할당 연산자를 입문자 수준으로 다룬다.

---

## Subject Definition

### 3.1 내장 스칼라: int, float, str, bytes, bool

- **개요**: int(정수), float(실수), str(문자열), bytes(바이트 열), bool(참/거짓). 각 타입의 리터럴과 기본 연산. f-string, encode/decode 맛보기.
- **목표**: 각 타입을 구분하고, 일상적인 연산과 포맷 출력을 할 수 있게 한다.
- **내용 요약**: `int` 임의 정밀도, `float`와 `math.isclose`. `str` 유니코드, `encode`/`decode`. f-string `{x}`, `{x=}`, `{x:.2f}`. `Decimal`·`Fraction` 언급.

### 3.2 sequence: list, tuple, range

- **개요**: 순서가 있는 컬렉션. 인덱싱 `a[i]`, 슬라이싱 `a[i:j]`, `len(a)`. `for x in a`로 순회.
- **목표**: list 생성·수정, tuple(불변), range로 정수 구간 표현. `*` unpack 맛보기.
- **내용 요약**: `list`, `tuple`, `range` 리터럴과 생성. 인덱스·슬라이스. `a, *rest = it`. `for`는 이터러블에 의존(Ch4에서 상세).

### 3.3 mapping: dict

- **개요**: 키-값 쌍. `d[k]`, `d.get(k)`, `d[k] = v`. 키는 hashable이어야 함.
- **목표**: dict 생성·조회·수정, 3.7+ 삽입 순서 보장. 3.9+ `dict | other`, `|=` 맛보기.
- **내용 요약**: `{}`, `dict()`. `d[k]` vs `d.get(k, default)`. dict comprehension. `dict | other`.

### 3.4 set, frozenset

- **개요**: 중복 없음, 순서 없음. 멤버십 `in`이 빠름. set은 가변, frozenset은 불변.
- **목표**: set으로 중복 제거·멤버십 검사. `{1, 2} | {2, 3}`. `set()` vs `{}`(빈 dict).
- **내용 요약**: `set`, `frozenset`. `in` O(1). `{-1}` vs `{-1,}` 구분.

### 3.5 기본 연산자

- **개요**: 산술(`+`, `-`, `*`, `/`, `//`, `%`, `**`), 비교(`==`, `!=`, `<`, `>`, `<=`, `>=`), 논리(`and`, `or`, `not`), 할당(`=`, `+=` 등). 연산자 우선순위.
- **목표**: 일상적인 연산을 올바른 우선순위로 쓸 수 있게 한다. `and`/`or`의 short-circuit은 Ch4에서.
- **내용 요약**: 연산자 문법과 기본 의미.

---

## Modern Key Concepts

- **f-string**: `{x}`, `{x=}`, `{x:.2f}`.
- **`dict | dict`**, **`set | set`** (3.9+): 매핑·집합 합치기.
- **`list[int]` 등 제네릭**: Ch6 Type Hints, Ch10에서 구체화.

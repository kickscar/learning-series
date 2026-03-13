# Chapter 4: 제어문 — 조건문, 반복문, match

## Chapter Definition

### 왜 필요한가

`if`/`for`/`while`뿐 아니라 **Truthy/Falsy, `for`의 이터러블 프로토콜, `match`의 구조 패턴**까지 넓혀 "제어"를 이터레이션과 패턴 매칭 관점에서 재정의한다.

### 세부 주제

1. Truthy/Falsy: `__bool__`, `__len__`, `None`/`0`/`[]`/`""`
2. `if`/`elif`/`else`, 삼항, short-circuit
3. `for`와 이터러블: `__iter__`/`__next__`, `iter()`, `next()`
4. `while`, `break`/`continue`/`else` (루프의 `else`)
5. `match`/`case`: 리터럴, 패턴, `as`, `|`, 가드
6. `while`/`for`-`else`의 "break 안 했을 때" 의미

### 간단 소개

조건의 본질(Truthy/Falsy와 `__bool__`/`__len__`), `for`가 시퀀스가 아니라 이터러블 프로토콜에 의존한다는 점, `match`/`case`로 구조와 타입을 분해하는 현대적 분기, 그리고 `for`/`while`-`else`의 "break 없이 끝났을 때" 의미를 다룬다.

---

## Subject Definition

### 4.1 Truthy/Falsy

- **개요**: `if x`에서 `bool(x)`가 호출됨. `__bool__`이 있으면 사용, 없으면 `__len__`이 0이면 False. `None`, `0`, `0.0`, `""`, `[]`, `{}`, `()`, `set()` 등은 Falsy.
- **목표**: `if x`의 실제 조건 평가 과정을 이해하고, `__bool__`/`__len__`과의 관계를 안다.
- **내용 요약**: `__bool__`이 우선. `__len__` fallback. `def __bool__(self): return self.data != []` 같은 커스텀. `if not items` vs `if len(items)==0`.

---

### 4.2 if/elif/else, 삼항, short-circuit

- **개요**: 분기 문법. 삼항 `a if c else b`. `or`/`and`의 short-circuit과 기본값 패턴 `x = y or default`(Falsy 주의).
- **목표**: 읽기 좋은 분기 작성과, `or`/`and`로 기본값을 주는 패턴(그 한계 포함)을 익힌다.
- **내용 요약**: `elif` 체인. `or`/`and`는 첫 번째로 결과가 결정되는 값 반환. `"" or "default"` → `"default"`. `0 or 1` → `1`.

---

### 4.3 for와 이터러블

- **개요**: `for x in it`는 `iter(it)`로 이터레이터를 얻고, `next()`를 반복. `StopIteration`이 나면 종료. `__iter__`/`__next__` 프로토콜.
- **목표**: `for`가 "시퀀스"가 아닌 "이터러블"에 의존한다는 것을 이해한다. `iter()`, `next()` 기본 사용.
- **내용 요약**: `it = iter([1,2,3]); next(it)`. 시퀀스는 `__getitem__`으로 이터레이터를 만들어 주는 fallback이 있음(구 legacy). `for`는 `__iter__` 우선.

---

### 4.4 while, break/continue/else

- **개요**: `while` 조건 루프. `break`(루프 탈출), `continue`(다음 반복으로). 루프에 붙은 `else`는 "break로 나가지 않고 정상 종료했을 때" 한 번 실행.
- **목표**: 루프 제어와 "검색 실패" 등에 쓰이는 `for`-`else` 패턴을 이해한다.
- **내용 요약**: `for x in seq: if cond: break` 다음 `else: print("not found")`. `while`-`else` 동일.

---

### 4.5 match/case (3.10+)

- **개요**: 구조 패턴 매칭. 리터럴, 타입 (`case int(x):`), 시퀀스 (`case [a, b]:`), 매핑, `as`, `|`(OR 패턴), 가드 `case x if x>0:`.
- **목표**: `if`-`elif` 대체와 타입·구조 분해를 `match`로 표현할 수 있게 한다.
- **내용 요약**: `case 1:`, `case "ok":`, `case int(n):`, `case [h, *t]:`, `case {"k": v}:`, `case _:`. `case x as y:`, `case 1|2|3:`, `case int(x) if x>0:`.

---

### 4.6 (Deep) 루프-else

- **개요**: `for`/`while`의 `else`는 "break 없이 끝났을 때"만 실행. 도움말과 레거시 코드에서 자주 나오는 패턴.
- **목표**: "검색 실패" 등 루프-else의 의도를 해석하고, 필요 시 활용할 수 있게 한다.
- **내용 요약**: `for item in items: if item == target: break` `else: raise NotFound`. `while`에서 "조건이 False가 되어 나왔을 때"의 `else`.

---

## Modern Key Concepts

- **`match`/`case`** (3.10+): `int`/`str`/`tuple`/`list`/매핑 패턴, `_`(와일드카드).
- **`case _:`**: 와일드카드, fallback.
- **`as`**, **가드** `case x if x>0:`: 패턴 내 바인딩과 조건.
- **`for`-`else`를 활용한 "찾기 실패" 패턴**: `break` 없이 루프가 끝나면 `else` 실행.

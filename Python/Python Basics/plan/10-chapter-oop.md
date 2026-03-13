# Chapter 10: 클래스와 OOP — 네임스페이스로서의 클래스와 객체

## Chapter Definition

### 왜 필요한가

클래스를 "타입"이자 **이름 공간**으로 보고, `self`, MRO, `@property`, descriptor, `__slots__`를 "속성 접근이 어떻게 메서드/데이터로 연결되는가"로 통합한다.

### 세부 주제

1. 클래스와 인스턴스: `type`과 `object`, `__class__`
2. `self`, 메서드 바인딩: `x.f()` → `C.f(x)`
3. `__init__` vs `__new__` (간단히)
4. 속성 탐색: `__dict__`, `__getattribute__`, `__getattr__`
5. MRO: C3, `super()`, 다중 상속
6. `@property`, `@staticmethod`, `@classmethod`
7. descriptor: `__get__`/`__set__`/`__delete__`, `property` 구현
8. `__slots__` (Ch5와 연계)
9. `dataclasses`, `@dataclass`, `typing.Protocol` (구조적 서브타이핑)
10. (Deep) `__getattribute__`/`__getattr__` 차이, `object.__getattribute__`

### 간단 소개

클래스와 인스턴스가 모두 객체이며 `type`·`object`에 뿌리를 둔다는 점, `x.f()`가 `C.f(x)`로 바인딩되는 과정, `__init__`/`__new__`, 속성 탐색과 `__getattribute__`/`__getattr__`, MRO·`super()`, `@property`·descriptor, `__slots__`, 그리고 `@dataclass`·`typing.Protocol` 같은 현대적 도구를 다룬다.

---

## Subject Definition

### 10.1 클래스와 인스턴스

- **개요**: 클래스는 `type`의 인스턴스, `object`가 최상위 베이스. `x.__class__`로 인스턴스의 클래스. `type(x) is C`로 정확한 타입 검사.
- **목표**: 클래스도 객체라는 것을 이해하고, `x.__class__`·`C.__bases__`로 관계를 탐색할 수 있게 한다.
- **내용 요약**: `object`는 `type`의 서브클래스이자 `type`의 베이스. `isinstance`·`issubclass`. `type(x) is C` vs `isinstance(x, C)`.

### 10.2 self와 메서드 바인딩

- **개요**: `x.f()` 호출 시 `f`는 클래스에서 찾고, `function`이면 `x`를 첫 인자로 묶어 바운드 메서드로 호출. `C.f`는 함수.
- **목표**: `x.f()`가 `C.f(x)`와 동등하다는 바인딩 메커니즘을 이해한다.
- **내용 요약**: `x.f` → `type(x).__dict__['f'].__get__(x, type(x))` → `f(x, ...)`. `C.f`는 `function` 그대로.

### 10.3 `__init__`과 `__new__`

- **개요**: `__new__`가 인스턴스 생성, `__init__`이 그 인스턴스를 초기화. 불변 타입·싱글톤 등에서 `__new__` 활용.
- **목표**: 생성 흐름 `__new__` → `__init__`을 이해하고, `object.__new__`를 `super().__new__(cls)` 등으로 호출하는 패턴을 안다.
- **내용 요약**: `__new__`는 `cls`를 받고 인스턴스 반환. `__init__`은 인스턴스+인자. `__new__`가 `cls`가 아닌 다른 클래스 인스턴스를 반환하면 `__init__`은 호출되지 않음.

### 10.4 속성 탐색

- **개요**: `x.a` 검색 순서: 인스턴스 `__dict__` → 클래스 → MRO를 따라 베이스 클래스. `__getattribute__`가 항상 호출되고, `AttributeError` 나면 `__getattr__`(fallback).
- **목표**: `__getattribute__` vs `__getattr__`를 구분하고, `__getattr__`가 "없을 때만" 호출됨을 안다.
- **내용 요약**: `object.__getattribute__(x, 'a')`가 `__dict__`·descriptor·MRO를 따라 검색. 못 찾으면 `__getattr__(x, 'a')`. descriptor는 10.7에서.

### 10.5 MRO와 super()

- **개요**: C3 선형화로 MRO 결정. `super()`는 `__class__`·`self`를 이용해 MRO에서 "다음" 클래스를 찾고, 그 클래스의 메서드를 호출. 다중 상속에서의 동작.
- **목표**: 다중 상속 시 `super()`가 어떤 클래스의 메서드를 부르는지 MRO로 예측할 수 있게 한다.
- **내용 요약**: `ClassName.__mro__`. `super().meth()`는 `__class__` 다음의 `meth`. 다이아몬드 상속에서 `object`까지 한 번만.

### 10.6 @property, @classmethod, @staticmethod

- **개요**: `@property`는 접근자를 속성처럼. `@classmethod`는 `cls`를 첫 인자. `@staticmethod`는 `self`/`cls` 없음, 최소 사용.
- **목표**: 셋의 용도를 구분하고, `cls` vs `self` 없음을 이해한다.
- **내용 요약**: `@property`는 `__get__`/`__set__`(선택). `@classmethod`로 대안 생성자 `cls(...)`. `@staticmethod`는 클래스 네임스페이스에 묶인 일반 함수.

### 10.7 Descriptor

- **개요**: `__get__`/`__set__`/`__delete__`를 가진 객체. `a.x` 접근 시 클래스/인스턴스 `__dict__`에 descriptor가 있으면 `x.__get__(a, type(a))` 등 호출. `property`·`__slots__`의 기반.
- **목표**: `property`가 descriptor로 구현됨을 알고, `__set_name__`(3.6+)로 자신의 이름을 알 수 있음을 이해한다.
- **내용 요약**: `__get__(self, instance, owner)`. `instance`가 `None`이면 클래스 접근. `__set_name__`로 `self.name = name` 저장. `property`·`classmethod`·`staticmethod`는 descriptor.

### 10.8 `__slots__`

- **개요**: `__slots__ = ('a','b')`로 인스턴스 `__dict__` 제거, `a`·`b`만 고정 슬롯. 메모리 절약. 동적 속성 추가 불가. Ch5와 연계.
- **목표**: `__dict__`가 없어지는 대신 메모리·접근 속도 이득, 상속 시 `__slots__` 주의를 안다.
- **내용 요약**: 서브클래스에 `__slots__` 없으면 `__dict__` 생성. 다중 상속에서 `__slots__` 조합 주의. Ch5 `getsizeof`·메모리 레이아웃과 연결.

### 10.9 dataclasses와 typing.Protocol

- **개요**: `@dataclass`로 `__init__`·`__repr__`·`__eq__` 등 보일러플레이트 자동 생성. `field(default_factory=...)`. `typing.Protocol`로 구조적 서브타이핑(덕 타이핑을 타입으로).
- **목표**: `@dataclass`로 데이터 중심 클래스를 짧게 쓰고, `Protocol`로 "이 메서드만 있으면 OK"를 표현할 수 있게 한다.
- **내용 요약**: `@dataclass`에 `field(default_factory=list)`. 3.10+ `@dataclass(slots=True)`. `class P(Protocol): def meth(self)->int: ...` — `isinstance`에는 `@runtime_checkable` 필요.

### 10.10 (Deep) `__getattribute__` vs `__getattr__`

- **개요**: `__getattribute__`는 **모든** 속성 접근에 호출. 여기서 `self.xxx`를 잘못 쓰면 무한 재귀. 커스텀할 때는 `object.__getattribute__(self, name)` 호출 후 가공. `__getattr__`는 `__getattribute__`가 `AttributeError`를 낸 뒤에만.
- **목표**: 커스텀 `__getattribute__` 작성 시 `object.__getattribute__`를 반드시 사용해 재귀를 끊을 수 있게 한다. descriptor와의 연동.
- **내용 요약**: `def __getattribute__(self, n): ...; return object.__getattribute__(self, n)`. `__getattr__`는 fallback, 프로кси·지연 로딩 등.

---

## Modern Key Concepts

- **`@dataclass`**, **`field(default_factory=...)`**: 보일러플레이트 감소, 불변·비교·`slots` 옵션.
- **`typing.Protocol`**, **`@runtime_checkable`**: 구조적 서브타이핑, 덕 타이핑의 타입 수준 표현.
- **`__set_name__`** (descriptor, 3.6+): descriptor가 자신이 붙은 속성 이름을 알 수 있음.
- **`slots=True`** (3.10+ `@dataclass`): dataclass에 `__slots__` 자동 적용.

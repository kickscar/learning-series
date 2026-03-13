# Chapter 7: 프로그램의 소통(I/O) — 데이터 흐름과 자원 관리

## Chapter Definition

### 왜 필요한가

"입출력"을 **바이트/텍스트 스트림, 버퍼링, 인코딩, 그리고 `with`를 통한 자원 수명**으로 묶어, 파일·소켓·락에 공통 적용되는 사고 모델을 제시한다.

### 세부 주제

1. 스트림: 바이트 vs 텍스트, `bytes`/`str`, 인코딩
2. `open()`, `'r'`/`'w'`/`'rb'`/`'wb'`, `encoding`, `errors`
3. `read`/`write`/`readline`/`readlines`, 이터레이션
4. `with`와 컨텍스트 매니저: `__enter__`/`__exit__`
5. `contextlib`, `@contextmanager`, `closing`
6. `pathlib.Path`: `read_text`/`write_text`, `open()`
7. (Deep) 버퍼링, `flush`, `seek`/`tell`

### 간단 소개

바이트/텍스트 모드와 인코딩, `open()` 모드별 의미, 읽기/쓰기 API, `with`로 자동 `close`와 예외 안전을 보장하는 패턴, `pathlib`로 크로스플랫폼 경로·파일 조작, 그리고 버퍼·`seek`에 대한 Deep Insight를 다룬다.

---

## Subject Definition

### 7.1 스트림과 인코딩

- **개요**: 바이트 스트림(`bytes`) vs 텍스트 스트림(`str`). 텍스트 모드에서는 `encoding`으로 디코딩/인코딩. `errors`로 처리 방식 지정.
- **목표**: `encoding='utf-8'`, `errors='replace'`/`'ignore'`/`'strict'` 등을 상황에 맞게 쓸 수 있게 한다. `locale.getpreferredencoding()` 언급.
- **내용 요약**: Windows 기본 cp1252, Linux/macOS UTF-8. 명시적 `encoding` 권장. `str`은 유니코드 코드 포인트, 디스크/소켓은 바이트.

### 7.2 `open()` 모드

- **개요**: `'r'`(읽기, 기본 텍스트), `'w'`(쓰기, 덮어쓰기), `'a'`(추가), `'x'`(배타 생성, 이미 있으면 실패). `'b'`(바이트), `'+'`(읽+쓰).
- **목표**: 올바른 모드 선택으로 데이터 유실·덮어쓰기 실수를 방지한다. `'x'`로 "이미 있으면 안 함" 표현.
- **내용 요약**: `'w'`는 기존 파일 비움. `'a'`는 끝에 추가. `'x'`는 `FileExistsError`. `'rb'`, `'wb'`에서 `encoding` 지정 불가.

### 7.3 읽기/쓰기 API

- **개요**: `read()`/`read(n)`, `readline()`, `readlines()`. `write(s)`, `writelines(iterable)`. `for line in f`로 라인 단위 이터레이션.
- **목표**: 메모리와 라인 단위의 트레이드오프를 이해하고, 큰 파일은 이터레이션으로 처리한다.
- **내용 요약**: `read()` 전체는 작은 파일에만. `for line in f`는 버퍼 단위로 읽어 메모리 효율적. `writelines`는 `'\n'`을 붙이지 않음.

### 7.4 `with`와 컨텍스트 매니저

- **개요**: `with open(...) as f:` 블록을 벗어날 때 `f.close()`가 항상 호출. 예외 발생 시에도. `__enter__`/`__exit__` 프로토콜.
- **목표**: `try`/`finally` 대신 `with`를 자원 관리의 표준으로 사용한다. `__exit__`에서 예외 전파·억제(`return True`)를 이해한다.
- **내용 요약**: `with C() as x:` → `x = C().__enter__()`. 블록 종료 시 `__exit__(type, val, tb)`. `open`은 `__exit__`에서 `close` 호출.

### 7.5 `contextlib`

- **개요**: `@contextmanager`로 `yield` 전후를 `__enter__`/`__exit__`로 만듦. `contextlib.closing`으로 `close`만 있는 객체를 CM으로.
- **목표**: 커스텀 컨텍스트 매니저를 간단히 작성할 수 있게 한다.
- **내용 요약**: `with cm():` 내부에서 `yield` 전 = enter, 후 = exit. `closing(urllib.request.urlopen(...))`로 `with`와 함께 사용.

### 7.6 `pathlib.Path`

- **개요**: `Path`로 크로스플랫폼 경로. `p.read_text(encoding='utf-8')`, `p.write_text(s)`, `p.open()`.
- **목표**: `open()`에 문자열 경로를 넘기는 대신, `Path`를 사용해 `os.path` 조합을 대체한다.
- **내용 요약**: `Path('a') / 'b' / 'c.txt'`. `p.exists()`, `p.is_file()`, `p.iterdir()`. `read_text`/`write_text`는 내부에서 `open` 후 `read`/`write`·`close`.

### 7.7 (Deep) 버퍼링, flush, seek/tell

- **개요**: 출력은 버퍼에 쌓였다가 `flush` 또는 `close` 시 반영. `seek`/`tell`로 위치 이동·확인. 텍스트 모드에서 `seek`는 바이트가 아니라 "추상적" 위치라 주의.
- **목표**: 디버깅·바이너리 처리 시 버퍼·위치를 의식할 수 있게 한다.
- **내용 요약**: `f.flush()`. `f.seek(0)`, `f.tell()`. 텍스트 모드에서는 인코딩 단위·`\n` 변환 때문에 `seek`가 직관과 다를 수 있음. 바이너리는 바이트 단위.

---

## Modern Key Concepts

- **`with` as 자원 관리 표준**: 파일, 락, DB 연결, 트랜잭션 등에 공통 적용.
- **`pathlib.Path`**, **`Path.read_text(encoding='utf-8')`**: `os.path` + `open` 조합 대체.
- **`open(..., encoding='utf-8')` 명시**: 3.x 기본은 플랫폼/환경에 따라 다를 수 있으므로, UTF-8을 쓸 경우 명시 권장.
- **`@contextmanager`와 `yield`**: `yield` 전 = `__enter__`, 후 = `__exit__` 역할.

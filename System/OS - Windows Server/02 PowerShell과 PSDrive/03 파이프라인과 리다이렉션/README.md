# 02 PowerShell과 PSDrive / 03 파이프라인과 리다이렉션

PowerShell 소개에서 본 객체 파이프라인을 실전으로 심화하고, 결과를 파일로 보내는 리다이렉션을 익힌다. Linux의 `>`, `>>`, `|`, `tee`, `2>`에 대응한다.

## What you will learn

- 객체 파이프라인 심화: `Where-Object`(필터), `Select-Object`(속성·`-First`), `Sort-Object`, `Measure-Object`(집계), `Group-Object`(묶기), `ForEach-Object`
- 속성 이름으로 접근하므로 출력 형식이 바뀌어도 깨지지 않는다 (bash의 열 번호 방식과 대비)
- 리다이렉션: `>`/`>>`는 `Out-File`과 동등, `Tee-Object`는 파일 저장과 파이프라인을 동시에(`tee`)
- 스트림: 성공(1)·에러(2) 등 여섯 갈래. `2>`로 에러만 파일로, `*>`로 전부, `Out-Null`로 버리기
- Linux 대응: `>`/`>>`/`|`/`tee`/`2>` ↔ PowerShell 동명 연산자 + `Out-File`/`Tee-Object`

## Examples

- `lab01` → `Get-Service | Where | Sort | Select`로 파이프라인 조립 → `Group-Object`로 집계 → `Out-File`/`Tee-Object`로 저장 → `2>`로 에러 스트림 분리

## Reference

- Notion: [Notion document]()

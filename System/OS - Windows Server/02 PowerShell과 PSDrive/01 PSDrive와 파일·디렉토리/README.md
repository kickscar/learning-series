# 02 PowerShell과 PSDrive / 01 PSDrive와 파일·디렉토리

PowerShell로 실제 파일과 디렉토리를 다루는 CLI 기본기의 출발점이다. PowerShell은 파일시스템·레지스트리·환경변수를 모두 "드라이브(PSDrive)"로 노출하고 하나의 항목 cmdlet 집합으로 다룬다. 이 추상이 이 챕터 전체를 관통한다.

## What you will learn

- provider와 PSDrive 개념: PowerShell은 파일시스템(C:), 레지스트리(HKLM:), 환경변수(Env:) 등을 모두 드라이브로 본다 (`Get-PSDrive`)
- 어느 드라이브든 같은 항목 cmdlet으로 다룬다는 것 (이 챕터의 핵심 메시지)
- 탐색: `Set-Location`(cd), `Get-ChildItem`(ls), `Get-Location`(pwd) — 별칭으로 bash처럼
- 항목: `New-Item`(mkdir/touch), `Copy-Item`(cp), `Move-Item`/`Rename-Item`(mv), `Remove-Item -Recurse`(rm -r)
- 찾기: `Get-ChildItem -Recurse -Filter`(find), 조건 검색은 `Where-Object` 파이프라인
- Linux 대응: pwd/cd/ls/mkdir/touch/cp/mv/rm/find ↔ PowerShell 항목 cmdlet

## Examples

- `lab01` → `Get-PSDrive`로 드라이브 확인 → `New-Item`으로 `C:\labs\psdrive`와 파일 생성(탐색기로 확인) → `Copy/Move/Rename-Item` → `Get-ChildItem -Recurse`로 찾고 `Remove-Item -Recurse`로 정리

## Reference

- Notion: [Notion document]()

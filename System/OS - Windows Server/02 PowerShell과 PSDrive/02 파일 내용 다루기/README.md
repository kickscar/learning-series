# 02 PowerShell과 PSDrive / 02 파일 내용 다루기

파일 안의 내용을 읽고, 쓰고, 검색하고, 편집한다. Linux의 `cat`/`head`/`tail`/`grep`/`vi`로 하던 일을 PowerShell에서 재현한다. Windows CLI엔 vi 같은 내장 편집기가 없어 micro를 도입한다.

## What you will learn

- 읽기: `Get-Content`(cat), `-TotalCount`(head), `-Tail`(tail), `-Wait`(tail -f)
- 쓰기: `Set-Content`(덮어쓰기, `>`), `Add-Content`(이어쓰기, `>>`)
- 검색: `Select-String`(grep, 별칭 `sls`) — 파일 경로·줄번호·내용을 객체로 반환. `Get-Content | Where-Object -match/-notmatch`
- 편집: micro TUI 편집기 — Windows CLI엔 vi가 없고 Server Core엔 notepad도 없다. `winget install -e --id zyedidia.micro`, 키바인딩은 GUI 편집기와 동일(`Ctrl+S`/`Ctrl+Q`)
- Linux 대응: cat/head/tail/grep/vi ↔ Get-Content/Select-String/micro

## Examples

- `lab01` → `Set-Content`+`Add-Content`로 `C:\labs\app.log` 생성 → `Get-Content -TotalCount/-Tail`로 앞뒤 읽기 → `Select-String "ERROR"`로 오류 줄 검색 → `winget`으로 micro 설치 후 편집

## Reference

- Notion: [Notion document]()

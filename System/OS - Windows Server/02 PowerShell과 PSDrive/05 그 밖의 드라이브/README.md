# 02 PowerShell과 PSDrive / 05 그 밖의 드라이브

파일과 레지스트리에 이어 나머지 드라이브(Env:·Variable:·WSMan:)를 짧게 둘러보며 "PowerShell은 세상을 드라이브로 본다"는 이 챕터의 메시지를 마무리한다. 환경변수도, 세션 변수도, 원격 관리 설정도 모두 드라이브다. (이론+인라인 실습)

## What you will learn

- `Get-PSProvider`로 데이터를 드라이브로 노출하는 공급자 전체 확인
- `Env:`: 환경변수 드라이브. `$env:PATH`로 하나, `Get-ChildItem Env:`로 전체. Linux `env`/`$PATH` 대응
- `Variable:`: 현재 세션의 변수 목록(자동 변수 포함)
- `WSMan:`: WinRM 원격 관리 설정을 드라이브로 (원격 접속 섹션에서 참조)
- `Cert:`/`Alias:`/`Function:`도 같은 방식의 드라이브(인식)
- **마무리 메시지**: 파일·레지스트리·환경변수·변수·WinRM이 전부 드라이브이며, `Get-ChildItem` 같은 하나의 cmdlet 집합이 관통한다 = PSDrive

## Reference

- Notion: [Notion document]()

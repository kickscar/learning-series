# Ch08 Provider 심화 / Provider 버전과 lock 파일

Provider 버전 제약의 동작을 정확히 이해하고, lock 파일의 내부 구조와 팀 환경에서의 관리 전략을 학습한다.

## What you will learn

- `~>` 연산자의 2-part와 3-part 차이 (`~> 6.0` vs `~> 6.1.0`)
- `.terraform.lock.hcl`의 내부 구조: version, constraints, hashes (`h1:`, `zh:`)
- `terraform init`의 버전 선택 전략과 `-upgrade` 플래그
- 크로스 플랫폼 해시 문제와 `terraform providers lock` 해결
- Plugin Cache로 Provider 바이너리 캐싱

## Reference

- Notion: [Notion 문서]()

# 03 이미지와 레지스트리 / 04 레지스트리

이미지를 레지스트리와 주고받는 방법을 다룬다. Docker Hub의 요청 제한이 집계되는 방식과 대응 방법, 로그인한 자격 증명이 저장되는 위치를 정리하고, 이미지를 push할 때 레이어가 전송되는 방식을 확인한다. 이어서 여러 플랫폼용 이미지를 하나의 이름으로 묶는 멀티 플랫폼 이미지의 구조와 플랫폼 선택 동작을 정리한다.

## What you will learn

- 레지스트리 · 저장소 · 태그의 구성과 이미지 이름이 pull · push 대상을 정하는 관계, 이미지 외의 산출물(OCI Artifact)
- Docker Hub 요청 제한의 집계 단위, 공인 IP 공유의 영향, 응답 헤더로 남은 횟수 확인, 로그인과 레지스트리 미러
- `docker login` 자격 증명의 저장 위치(`config.json` 의 base64, 자격 증명 저장소)
- push의 레이어 전송(`Pushed` · `Layer already exists` · `Mounted from`)과 push 결과의 다이제스트
- 멀티 플랫폼 이미지와 이미지 인덱스, `--platform` 플랫폼 선택, 다른 아키텍처 이미지의 실행과 로컬 이미지 push의 단일 플랫폼 저장

## Examples

- `lab01` → 레지스트리 사용 (요청 제한 확인, 로그인 상태 확인, 이미지 push와 Docker Hub 확인, 레지스트리에서 복원, 멀티 플랫폼 이미지)

## Reference

- Notion: [Notion 문서]()

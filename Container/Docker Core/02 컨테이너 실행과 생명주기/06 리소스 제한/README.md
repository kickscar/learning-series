# 02 컨테이너 실행과 생명주기 / 06 리소스 제한

컨테이너가 사용하는 메모리, CPU, 프로세스 수를 제한하는 옵션을 정리한다. 자원별로 상한을 넘었을 때의 동작이 어떻게 다른지 확인하고, 메모리 초과로 종료된 컨테이너의 종료 원인을 확인하는 방법을 다룬다.

## What you will learn

- 제한하지 않은 컨테이너의 자원 사용과 제한 옵션별 `HostConfig` 항목
- `-m` 과 `--memory-swap` 의 조합에 따른 스왑 허용, `--memory-reservation`
- `--cpus` 의 주기별 상한, `--cpu-shares` 의 상대 가중치, `--cpuset-cpus`, `stats` 의 `CPU %` 기준
- `--pids-limit` 에 이른 컨테이너의 프로세스 생성과 `exec` 실패
- 자원별 상한 초과 동작(메모리는 종료, CPU는 속도 제한, 프로세스 수는 생성 실패)과 `.State.OOMKilled` 로 확인하는 종료 원인

## Examples

- `lab01` → 제한과 관찰 (호스트 자원 확인, 제한 여부에 따른 상한, 메모리 · CPU · 프로세스 수 상한 초과)

## Reference

- Notion: [Notion 문서]()

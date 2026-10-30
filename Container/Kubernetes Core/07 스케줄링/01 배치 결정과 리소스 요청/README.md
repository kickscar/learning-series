# 07 스케줄링 / 01 배치 결정과 리소스 요청

스케줄러가 노드를 고르는 단계와 그 기준이 되는 리소스 요청(`requests`)을 확인하고, 리소스 상한(`limits`)을 넘었을 때의 결과와 QoS 클래스를 정리한다. requests를 실제 사용량에 맞춰 정할 수 있도록 metrics-server를 설치하고 사용량을 확인한다.

## What you will learn

- 스케줄러의 Filtering과 Scoring, `Pending` 과 `FailedScheduling` Events
- requests는 실제 사용량이 아니라 예약 합계로 판단하는 배치 기준, limits 초과 시 CPU 스로틀링과 메모리 `OOMKilled`(`137`)
- requests · limits 조합과 QoS 클래스(`Guaranteed` · `Burstable` · `BestEffort`), 노드 자원 압박 시 축출 순서
- metrics-server 설치(kubelet 서빙 인증서 검증을 끄지 않는 이유), `kubectl top` 과 `describe node` 의 할당 가능량 · 예약 합계
- 실제 사용량을 근거로 한 requests 설정 기준

## 클러스터 작업

metrics-server v0.9.0을 공식 릴리스의 `components.yaml` 로 설치한다. 별도 파일 없이 본문의 `kubectl apply -f https://github.com/kubernetes-sigs/metrics-server/releases/download/v0.9.0/components.yaml` 을 실행한다. 설치한 metrics-server는 이후 장에서 계속 쓴다.

## Lab

| Lab | 내용 | 디렉터리 |
|-----|------|---------|
| lab01: 리소스 요청과 QoS 판정 | QoS 클래스 판정과 limits만 지정한 경우, 남은 여유보다 큰 requests의 `Pending`, CPU 상한의 스로틀링, 메모리 상한의 `OOMKilled` | `lab01/` |

| 파일 | 내용 |
|------|------|
| `namespace.yaml` | Namespace `lab01` |
| `qos.yaml` | 리소스 설정이 다른 Pod 4개(`besteffort` · `burstable` · `guaranteed` · `limits-only`) |
| `large-request.yaml` | CPU `1800m` 을 요청하는 Pod |
| `cpu-limit.yaml` | CPU limits `200m` 의 반복문 Pod |
| `memory-limit.yaml` | 메모리 limits `64Mi` 를 넘는 Pod |

`cp` 노드의 `~/k8s-core/07/01/lab01` 에서 실행한다. metrics-server 설치를 마친 뒤 진행한다.

## Reference

- Notion: [Notion 문서]()

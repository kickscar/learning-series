# 02 kubeadm 기반 클러스터 구축 / 02 kubeadm 초기화 절차

`kubeadm init` 이 control plane 노드를 구축하는 과정을 단계별로 나누고 단계마다 생성하는 산출물을 정리한다. 이 시리즈가 `kubeadm init` 에 전달하는 설정 파일의 필드와 클러스터에 보관되는 설정을 함께 다룬다.

## What you will learn

- 부트스트랩 도구로서 `kubeadm` 의 담당 범위와 설치하지 않는 구성 요소(네트워크 플러그인, 외부 접근 · 스토리지, metrics-server)
- `kubeadm init` 14개 단계와 산출물 기준 묶음(사전 검사, 신뢰 구조, Control Plane 기동, 클러스터 등록, 애드온과 조인 안내)
- `kubeadm init phase {단계} [{하위 단계}]` 단계 단위 실행과 `--skip-phases`
- 설정 파일(`InitConfiguration` · `ClusterConfiguration` · `KubeletConfiguration`)과 이 시리즈가 지정하는 필드: advertise 주소 `192.168.56.10`, `kubernetesVersion: v1.36.5`, Pod · Service 대역, `serverTLSBootstrap: true`
- `kube-system` 에 보관되는 `kubeadm-config` · `kubelet-config` ConfigMap

## Reference

- Notion: [Notion 문서]()

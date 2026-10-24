# Vagrant: Kubernetes Core 실습 클러스터

Kubernetes Core 실습에서 사용하는 노드 VM 3대(control-plane 1 + worker 2)를 VirtualBox에 생성한다. Vagrant는 VM 생성까지만 담당한다. 노드 사전 준비(swap · SELinux · firewalld · 컨테이너 런타임)와 kubeadm 절차는 교재에서 직접 수행한다.

## 구성

| 노드 | 호스트명 | host-only IP | vCPU | 메모리 |
|------|---------|--------------|------|--------|
| control-plane | `cp` | `192.168.56.10` | 2 | 2.5GB |
| worker | `worker1` | `192.168.56.11` | 2 | 3GB |
| worker | `worker2` | `192.168.56.12` | 2 | 3GB |

- 게스트 OS: Rocky Linux 9 (box는 9.6, 노드 준비에서 `dnf update` 로 최신 9.x로 갱신)
- 디스크: 동적 할당 64GB (box 기본값)
- 네트워크: NIC1 NAT (외부 다운로드), NIC2 host-only `192.168.56.0/24` (클러스터 통신)
- VirtualBox VM 이름: `kc-cp`, `kc-worker1`, `kc-worker2`. 디스크는 linked clone으로 box 이미지를 공유한다

## Box

box는 [bento/rockylinux-9](https://portal.cloud.hashicorp.com/vagrant/discover/bento/rockylinux-9) `202510.26.0` 을 이 저장소의 릴리스 [`vagrant-rockylinux-9-202510.26.0`](https://github.com/kickscar/learning-series/releases/tag/vagrant-rockylinux-9-202510.26.0) 으로 재배포한 것이다. `Vagrantfile` 이 호스트 CPU에 맞는 box를 받고 SHA-256 체크섬으로 검증한다.

| 호스트 | box |
|--------|-----|
| Apple Silicon Mac | `rockylinux-9-202510.26.0-virtualbox-arm64.box` |
| Windows · Linux (x86_64) | `rockylinux-9-202510.26.0-virtualbox-amd64.box` |

- HCP Vagrant 레지스트리(Vagrant Cloud)는 2026-12-31 운영을 종료한다. 교재 기간 동안 같은 box를 받을 수 있도록 재배포한다
- Rocky Linux 공식 aarch64 VirtualBox box는 OVF에 ARM 플랫폼 정보가 없어 Apple Silicon의 VirtualBox에서 부팅하지 않는다

## 사용

```bash
$ vagrant up
$ vagrant ssh cp
```

스냅샷은 3대를 정지한 뒤 같은 이름으로 저장한다.

```bash
$ vagrant halt
$ vagrant snapshot save clean
$ vagrant up
```

## 요구 사항

- VirtualBox 7.2, Vagrant 2.4.9
- 호스트 메모리 16GB 이상 (VM 3대 합계 8.5GB). 실습 중에는 다른 VM과 Docker Desktop을 종료한다
- 디스크 여유 20GB 이상

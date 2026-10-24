# 01 클러스터의 구성 요소 / 03 실습 환경 구축

시리즈 전체에서 사용할 노드 VM 3대(`cp` · `worker1` · `worker2`)를 VirtualBox와 Vagrant로 준비한다. 노드 구성과 듀얼 NIC 네트워크, 사양, Vagrant가 맡는 범위를 정한 뒤 VM을 기동하고, 노드 간 통신과 노드별 고유값을 확인하고, 스냅샷 `ch01-done` 을 만든다. Kubernetes는 설치하지 않는다.

## What you will learn

- 노드 3대 구성과 worker 2대의 이유, 시리즈 전체에서 고정하는 노드 이름과 host-only IP
- NAT · host-only 듀얼 NIC 구성과 세 노드가 같은 NAT 주소(`10.0.2.15`)를 받는 이유, 기본 경로가 NAT 쪽에 있다는 사실
- Vagrant가 맡는 범위(box · VM 생성 · 사양 · IP · 호스트명)와 학습자가 직접 수행하는 노드 준비의 구분, Windows 호스트의 하이퍼바이저(VBS) 점검
- `kubeadm` 이 요구하는 노드별 고유값(호스트명 · MAC 주소)과 복제한 VM의 MAC 중복을 막는 `base_mac = nil`
- 노드를 모두 정지한 뒤 같은 이름으로 저장하는 스냅샷과 `vagrant snapshot restore` 로의 복원

## Source

- `vagrant/Vagrantfile` → 노드 VM 3대를 생성하는 `Vagrantfile`. 원본은 `Container/Vagrant/Vagrantfile` 이고, 강의용 저장소의 `/vagrant` 와 같다. 학습자 호스트의 `~/k8s-core/vagrant/` 에서 `vagrant up` 을 실행한다

## Reference

- Notion: [Notion 문서]()

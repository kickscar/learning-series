# 08 스토리지 / 03 파일 공유

NFS(Network File System)로 네트워크를 통해 디렉토리를 공유한다. 인식 수준.

## What you will learn

- NFS: 원격 디렉토리를 로컬처럼 마운트하는 분산 파일시스템
- 서버: /etc/exports, exportfs, nfs-server 서비스
- 클라이언트: mount -t nfs, showmount, /etc/fstab (_netdev)
- Rocky Linux 9 기본 NFSv4.2, nfs-utils 패키지
- 두 VM 간 NFS 공유: icon-server(NFS) → linux-server(Nginx 웹 서빙)

## Lab

- `lab01/` — icon server 구축 (icon-server ↔ linux-server)
  - `os-linux.svg` — 시리즈 아이덴티티 아이콘 (NFS로 공유, Nginx로 서빙)

## Reference

- Notion: [Notion document](https://app.notion.com/p/03-379dc703ccda80b3a2a6e01deec0830a?source=copy_link)

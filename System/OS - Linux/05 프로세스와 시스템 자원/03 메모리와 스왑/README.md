# 05 프로세스와 시스템 자원 / 03 메모리와 스왑

메모리와 스왑의 상태를 관찰한다. 01.02에서 이론으로 다룬 가상 메모리와 스왑을 도구로 직접 들여다본다.

## What you will learn

- free vs available: "free가 작아도 available이 충분하면 정상"
- buff/cache: 커널이 남는 메모리를 캐시로 활용하는 원리
- free -h 출력 해석, vmstat 출력 해석 (si/so = 스왑 활동)
- /proc/meminfo: free와 vmstat의 데이터 소스
- swapon --show: 스왑 상태 확인
- OOM Killer: oom_score, oom_score_adj로 프로세스 보호

## Reference

- Notion: [Notion document](https://app.notion.com/p/03-379dc703ccda8095b932f1a5d2970431?source=copy_link)

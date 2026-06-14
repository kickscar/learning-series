// helloworld.c
// setuid + setgid 디렉토리 연계 실습
// 컴파일: gcc -o helloworld helloworld.c
// 설정:   sudo chown root:wheel helloworld && sudo chmod 4750 helloworld
#include <stdio.h>

int main() {
    FILE *fp = fopen("/tmp/shared/helloworld.txt", "w");
    if (!fp) return perror("failed"), 1;

    fprintf(fp, "hello world\n");
    fclose(fp);
    return 0;
}

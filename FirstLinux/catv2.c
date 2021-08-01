#include <stdio.h>
#include <stdlib.h>
#include <unistd.h>
#include <sys/types.h>
#include <sys/stat.h>
#include <fcntl.h>
#define BUFFER_SIZE 2048


static void do_cat(int fd);
static void die(const char *s);

int main (int argc, char *argv[]){
    int i;
    if (argc == 1){
        do_cat(STDIN_FILENO);
    }else{
        for (i = 1; i < argc; i++) do_cat(open(argv[i], O_RDONLY));
    }
    exit(0);
}


static void do_cat(int fd){
    unsigned char buf[BUFFER_SIZE];
    int n, i;

    for (;;){
        n = read(fd, buf, sizeof(buf));
        if (n < 0) die("hoge");
        if (n == 0) break;
        if (write(STDOUT_FILENO, buf, n) < 0) die("hoge");

        //for (i = 0; i < sizeof(buf); i++) if (buf[i] == '\n') break;
    }
    if (close(fd) < 0) die("hoge");
}

static void die(const char *s){
    perror(s);
    exit(1);
}


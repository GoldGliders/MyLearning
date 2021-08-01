#include <stdio.h>
#include <stdlib.h>
#include <sys/types.h>

int main(int argc, char *argv[]){
    int n, c, i;
    int fd;
    if (argc == 1){
        fprintf(stderr, "%s: file does not found", argv[0]);
        exit(1);
    }else{
        for (i = 1; i < argc; i++){
            fd = open(argv[i], O_RDONLY);
            if (fd < 0) exit(1);
            while((c = getchar()) != EOF){
                fprintf(stdout, "%c\n", c);
                if (c == '\n') n++;
            }
            fprintf(stdout, "%d\n", n);
        }
    }
}

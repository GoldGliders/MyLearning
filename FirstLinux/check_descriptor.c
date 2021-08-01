#include <stdio.h>

int main(int argc, char* argv[]){
    FILE *f;
    int fno;

    f = stderr;
    fno = fileno(f);
    printf("%d\n", fno);

    return 0;
}

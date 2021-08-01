#include <stdio.h>
#include <stdlib.h>

static int do_cat(FILE *f);

int
main(int argc, char *argv[])
{
    int i, cnt;

    if (argc == 1) {
        do_cat(stdin);
    }
    else {
        for (i = 1; i < argc; i++) {
            FILE *f;

            f = fopen(argv[i], "r");
            if (!f) {
                perror(argv[i]);
                exit(1);
            }
            cnt = do_cat(f);
            fclose(f);
            printf("%d\n", cnt);
        }
    }
    exit(0);
}

static int do_cat(FILE *f)
{
    int c, i = 0;

    while ((c = fgetc(f)) != EOF) {
        if (c == '\n') i++;
        //if (putchar(c) < 0) exit(1);
    }

    return i;
}

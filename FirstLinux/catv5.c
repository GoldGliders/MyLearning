#include <stdio.h>
#include <stdlib.h>
#define _GNU_SOURCE
#include <getopt.h>

static void do_cat(FILE *f, int opt_n, int opt_t);

int main(int argc, char *argv[]) {
    int i, opt;
    int opt_n = 0, opt_t = 0;

    while ((opt = getopt(argc, argv, "nt")) != -1){
        switch(opt){
            case 'n':
                opt_n = 1;
                break;
            case 't':
                opt_t = 1;
                break;
            case '?':
                break;
            default:
                break;
        }
    }

    if (optind == argc) {
        do_cat(stdin, opt_n, opt_t);
    } else {
        for (i = optind; i < argc; i++) {
            FILE *f;

            f = fopen(argv[i], "r");
            if (!f) {
                perror(argv[i]);
                exit(1);
            }
            do_cat(f, opt_n, opt_t);
            fclose(f);
        }
    }
    exit(0);
}

static void do_cat(FILE *f, int opt_n, int opt_t) {
    int c;

    while ((c = fgetc(f)) != EOF) {
        switch(c){
            case '\t':
                if (opt_t){
                    if (fputs("\\t", stdout) == EOF) exit(1);
                    break;
                }
            case '\n':
                if (opt_n){
                    if (fputs("$\n", stdout) == EOF) exit(1);
                    break;
                }
            default:
                if (putchar(c) < 0) exit(1);
                break;
        }
    }
}

#include <stdio.h>
#include <stdlib.h>
#define _GNU_SOURCE
#include <getopt.h>

#define DEFAULT_N_LINES 10;

static void do_cat(FILE *f, int opt_n, int opt_t);
static struct option longopts[] = {
    {"lines", required_argumen, NULL, 'n'},
    {0, 0, 0, 0}
}

int main(int argc, char *argv[]) {
    int i, opt;

    while ((opt = getopt_long(argc, argv, "n:h", longopts, NULL)) != -1){
        switch(opt){
            case 'n':
                opt = atol(optarg);
                break;
            case 'h':
                fprintf(stdout, "Usage: %s [-n LINES] [FILE...]\n", argv[0]);
                exit(0)
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

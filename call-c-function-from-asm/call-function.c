// gcc -c call-function.c -o call-function-c.o

#include <stdio.h>

extern int print();

int print() {
    printf("Hello World\n");
    return 0;
}

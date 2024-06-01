#include <stdio.h>
#include <stdlib.h>

void display(int8_t bit) {
    putchar(bit + 48);
}

void display_32(int32_t num) {
    int8_t result;
    for (int i = 31; i >= 0; i--) {
        result = (num >> i) & 1;
        display(result);
    }
    putchar('\n');
    return;
}

int main(int argc, char const *argv[]) {
    display_32(382);
    return 0;
}
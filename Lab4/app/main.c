#include <stdio.h>
#include "GCD.h"

int main() {
    int array[5] = {45, 90, 180, 135, 45};
    GCD(array);
    printf("GCD = %d", array[1]);
    return 0;
}

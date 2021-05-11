//
// Created by bdoubleo on 05/03/21.
//

#include "GCD.h"
void GCD(int array[]) {
    if (sizeof(array) > 1) {
        int first = array[0];
        int second = 0;
        for (int i = 1; i < 5; i++) {
            second = array[i];
            while (first != 1 && first != second && second != 1) {
                if (first >= second) {
                    first = first - second;
                }
                else {
                    second = second - first;
                }
            }
            if (first == 1 || second == 1) {
                break;
            }
        }
        array[1] = first;
    }
}


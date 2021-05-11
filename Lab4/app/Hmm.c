//
// Created by bdoubleo on 05/11/21.
//
int Hmm(int first, int second){
    while (first != 1 && first != second && second != 1) {
        if (first >= second) {
            first = first - second;
        }
        else {
            second = second - first;
        }
    }
    if (first == 1 || second == 1) {
        return first;
    }
    return first;
}


#include <stdio.h>

int main() {

    int num;
    num = 1;

    while(num != 0) {
        printf("\n Digite um numero e veja se e par ou impar");
        scanf("%d", &num);

        if(num % 2 == 0 ) {
            printf("\n O numero %d e par", num);
        }
        else {
            printf("\n O numero %d e impar", num);
        }
    } 
    return 0;
}

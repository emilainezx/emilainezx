#include <stdio.h>

int main() {
    int nascimento, idadenova, ano;

    printf("\n Que ano voce nasceu?\t");
    scanf("%d", &nascimento);

    printf("\n Ano que voce quer saber sua idade:\t");
    scanf("%d", &ano);

    idadenova=ano-nascimento;

    printf("\nem %d sua idade vai ser: %d \t", ano, idadenova);
    
    return 0;
}

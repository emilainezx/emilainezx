#include <stdio.h>

int main() {

    char operacao, continuar;
    float n1, n2, resultado;
    do {
        do {
            printf("\n Digite uma operacao (+, -, *, /): ");
            scanf(" %c", &operacao);

        
            if (operacao != '+' && operacao != '-' && operacao != '*' && operacao != '/') {
                printf("\n Operacao invalida. Tente novamente.");
            }
        } while (operacao != '+' && operacao != '-' && operacao != '*' && operacao != '/');

        printf("\n Digite o primeiro numero: ");
        scanf("%f", &n1);

        printf("\n Digite o segundo numero: ");
        scanf("%f", &n2);

        switch (operacao) {
            case '+':
                resultado = n1 + n2;
                printf("\n Resultado: %.2f + %.2f = %.2f", n1, n2, resultado);
                break;
            case '-':
                resultado = n1 - n2;
                printf("\n Resultado: %.2f - %.2f = %.2f", n1, n2, resultado);
                break;
            case '*':
                resultado = n1 * n2;
                printf("\n Resultado: %.2f * %.2f = %.2f", n1, n2, resultado);
                break;
            case '/':
                if (n2 != 0) {
                    resultado = n1 / n2;
                    printf("\n Resultado: %.2f / %.2f = %.2f", n1, n2, resultado);
                } else {
                    printf("\n Nao e possivel dividir por 0.");
                }
                break;
        }

                printf("\n\n Deseja realizar outro calculo? (s/n): ");
                scanf(" %c", &continuar);

    } while (continuar == 's' || continuar == 'S');

    printf("\n Obrigado por usar a calculadora!.\n");

    return 0;
}

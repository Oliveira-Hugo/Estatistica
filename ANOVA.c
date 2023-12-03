#include <stdio.h>
#include <stdlib.h>
#include <math.h>

#define MAX_GRUPOS 5
#define MAX_AMOSTRAS 10

// 1- Calcular a média dos grupos (vetores)
double calc_media(double dados[], int tamanho) {
    double soma = 0.0;
    for (int i = 0; i < tamanho; i++) {
        soma += dados[i];
    }
    return soma / tamanho;
}

// 2- Estimar a soma dos quadrados
double calc_som_quadrados(double dados[], int tamanho, double media) {
    double soma = 0.0;
    for (int i = 0; i < tamanho; i++) {
        soma += pow(dados[i] - media, 2);
    }
    return soma;
}

// 3- Executar ANOVA one-way
void ANOVA(double dados[MAX_GRUPOS][MAX_AMOSTRAS], int num_grupos, int tam_grupos) {
    // Média Geral 
    double med_geral = 0.0;
    for (int i = 0; i < num_grupos; i++) {
        med_geral += calc_media(dados[i], tam_grupos);
    }
    med_geral /= num_grupos;

    // Soma dos Quadrados (SQ)
    double som_quad_entre = 0.0;  //som_quad_entre = Soma dos quadrados entre os grupos (par-a-par)
    for (int i = 0; i < num_grupos; i++) {
        double med_grupo = calc_media(dados[i], tam_grupos);
        som_quad_entre += tam_grupos * pow(med_grupo - med_geral, 2);
    }

    double som_quad_dentre = 0.0;   //som_quad_dentre = Soma dos quadrados dentro dos grupos
    for (int i = 0; i < num_grupos; i++) {
        som_quad_dentre += calc_som_quadrados(dados[i], tam_grupos, calc_media(dados[i], tam_grupos));
    }

    // Graus de liberdade (GL)
    int gl_entre = num_grupos - 1;
    int gl_dentre = num_grupos * (tam_grupos - 1);

    // Quadrado médio (QM)
    double qm_entre = som_quad_entre / gl_entre;
    double qm_dentre = som_quad_dentre / gl_dentre;

    // Calcular o F
    double F = qm_entre / qm_dentre;

    printf("Soma dos Quadrados entre grupos: %.2f\n", som_quad_entre);
    printf("Soma dos Quadrados dentro dos grupos: %.2f\n", som_quad_dentre);
    printf("Graus de Liberdade entre grupos: %d\n", gl_entre);
    printf("Graus de Liberdade dentro dos grupos: %d\n", gl_dentre);
    printf("Quadrado médio entre grupos: %.2f\n", qm_entre);
    printf("Quadrado médio dentro dos grupos: %.2f\n", qm_dentre);
    printf("F: %.2f\n", F);
}

int main() {
    int num_grupos = 3;
    int tam_grupos = 10;

    double dados[MAX_GRUPOS][MAX_AMOSTRAS] = {
        {76, 77, 77, 81, 82, 82, 83, 84, 85, 89},
        {81, 82, 83, 83, 83, 84, 87, 90, 92, 93},
        {77, 80, 82, 88, 89, 90, 94, 95, 95, 98}
    };

    ANOVA(dados, num_grupos, tam_grupos);

    return 0;
}

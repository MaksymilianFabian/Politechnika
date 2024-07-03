#include <stdio.h>
int main() {
	/*
    for (int i = 0; i < 6; i++) {
		for (int j = 0; j < i; j++) {
			printf("O");
		}
		printf("\n");
	}
    */

    /*
	int i, space, h, k = 0;
    printf("Enter the height: ");
    scanf_s("%d", &h);
    for (i = 1; i <= h; i++, k = 0) {
        for (space = 1; space <= h - i; ++space) {
            printf("  ");
        }
        for (int row = h-i; row <= h; row++) {
            printf(" ");
        }
        while (k != 2 * i - 1) {
            printf("X");
            k++;
        }
        printf("\n");
    }
	*/

    int m, n;
    printf("Ener m and n: \n");
    scanf_s("%d%d", &m, &n);
    printf("%d", m * n);
    double sum = 0;
    double product = 1;
    for (int i = 1; i <= n; i++) {
        for (int j = 1; j <= m; j++) {
            double temp_product = (pow(i, 2) + pow(j, 2) - 1.)/(2 * i + 3 * j + 4.);
            product *= temp_product;
        }
        sum += product;
    }
	return 0;
}

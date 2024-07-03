#include <stdio.h>
#include <stdbool.h>
#include <math.h>
int main() {
	while (true) {
		printf("Podaj numer zadania:\n");
		printf("1  -  Zadanie 7.1.2 (Zestaw 1)\n2  -  Zadanie 7.1.7 (Zestaw 1)\n3  -  Zadanie 3 (Zestaw 3)\n4  -  Zadanie 6 (Zestaw 4)\n5  -  Zakoncz dzialanie programu\n\n");
		int zadanie;
		scanf_s("%d", &zadanie);
		switch (zadanie) {


			case 1: {
				printf("Oto zadanie 7.1.2:\n");
				int temp = 1;
				int wysokosc;
				printf("Podaj wysokosc\n");
				scanf_s("%d", &wysokosc);
				if (wysokosc <= 0) {
					printf("liczba %d jest niepoprawna", wysokosc);
				}
				else
				{
					for (int i = 0; i < wysokosc; i++) {
						for (int i = 1; i <= temp; i++) {
							printf("O");
						}
						printf("\n");
						temp++;
					}
				}
				printf("\n");
				break;
			}


			case 2: {
				printf("Oto zadanie 7.1.7:\n");
				int i, space, h, k = 0;
				printf("Podaj wysokosc:\n");
				scanf_s("%d", &h);
				for (i = 1; i <= h; i++, k = 0) {
					for (space = 1; space <= h - i; ++space) {
						printf("  ");
					}
					for (int row = h - i; row <= h; row++) {
						printf(" ");
					}
					while (k != 2 * i - 1) {
						printf("X");
						k++;
					}
					printf("\n");
				}
				printf("\n");
				break;
			}


			case 3: {
				printf("Oto zadanie 3:\n");
				int n, m;
				double R = 0;
				printf("Podaj calkowite n oraz m\n");
				scanf_s("%d%d", &n, &m);
				for (int i = 1; i <= n; i++) {
					double temp = 1;
					for (int j = 1; j <= m; j++) {
						double licznik = pow(i, 2) + pow(j, 2) - 1;
						double mianownik = 2 * i + 3 * j + 4;
						temp *= licznik / mianownik;
					}
					R += temp;
				}
				printf("Wynik to %lf\n", R);
				printf("\n");
				break;

			}


			case 4: {
				printf("Oto zadanie 4:\n");
				int a;
				printf("Podaj calkowite a\n");
				scanf_s("%d", &a);
				for (int n = 1; n <= a; n++) {
					for (int m = n; m <= a; m++){
						int suma_m = 0;
						int suma_n = 0;
						for (int i = 1; i < n; i++) {
							if (n % i == 0) {
								suma_n += i;
							}
						}
						for (int i = 1; i < m; i++) {
							if (m % i == 0) {
								suma_m += i;
							}
						}
						if (suma_n == m && suma_m == n && n != m) {
							printf("Liczby %d i %d sa zaprzyjaznione\n", n, m);
						}
					}
				}
				printf("\n");
				break;

			}
			default:
				printf("\n");
				break;

		}
		if (zadanie == 5) {
			break;
		}
	}
	return 0;
}
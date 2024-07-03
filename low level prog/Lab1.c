#include <stdio.h>
#include <stdbool.h>
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
		}
			
		}
		if (zadanie != 5) {
			printf("\n");
			continue;
		}
		else {
			break;
		}
	}
	return 0;
}
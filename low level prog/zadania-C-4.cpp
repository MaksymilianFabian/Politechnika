#include<stdio.h>
#include <string.h>  
#include <math.h>
FILE* plik;

float oblicz(double x) {
	double wynik = 3.31;
	if(x!=( - 1)) wynik = (sin(x) * sin(x) - 3) / sqrt(x + 1);
	
	return wynik;
}

double srednia(double tab[]) {
	float suma = 0;
	for (int i = 0; i < 4; i++) {
		suma += tab[i];
	}
	return (suma / 4);
}
double maks(double tab[]) {
	float maks = tab[0];
	for (int i = 0; i < 4; i++) {
		if (tab[i] > maks)maks = tab[i];
	}
	return maks;
}
double minimum(double tab[]) {
	float minimum = tab[0];
	for (int i = 0; i < 4; i++) {
		if (tab[i] < minimum)minimum = tab[i];
	}
	return minimum;
}
int main()
{
	//zad 2
	
	/*int const n = 50, m = 50;
	double a[n][m], b[n][m];
	for (int i = 0; i < n; i++) {
		for (int j = 0; j < m; j++) {
			b[i][j] = oblicz(a[i][j]);
		}
	}*/

	//zad 6
	/*int const n = 50, m = 50;
	int a[n][m], b[n][m],przewaga[n][m],rownosc[n][m];

	for (int i = 0; i < n; i++) {
		for (int j = 0; j < m; j++) {
			if (a[n][m] == b[n][m])rownosc[n][m] = 1;
			else rownosc[n][m] = 0;

			if (a[n][m] <= b[n][m])przewaga[n][m] = 0;
			else przewaga[n][m] = 0;
		}
	}*/

	//zad 8
	int numerSerii = 0;
	double pomiary[4];
	int kodSposobuPrzetwarzania = 0;
	plik = fopen("Pomiary.txt", "r");
	fscanf(plik, "%d", &numerSerii);
	for (int i = 0; i < 4; i++) {
		fscanf(plik, "%f", &pomiary[i]);
	}
	fscanf(plik, "%d", &kodSposobuPrzetwarzania);
	fclose(plik);
	double wartosc;
	if (kodSposobuPrzetwarzania == 0)wartosc=srednia(pomiary);
	else if (kodSposobuPrzetwarzania == 1)wartosc=maks(pomiary);
	else if (kodSposobuPrzetwarzania == 2)wartosc=minimum(pomiary);
	plik = fopen("Wyniki.txt", "w");
	fprintf(plik, "%d", numerSerii);
	fprintf(plik, "%d", wartosc);
	fprintf(plik, "%d", kodSposobuPrzetwarzania);
	fclose(plik);
}
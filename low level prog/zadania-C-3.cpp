#include<stdio.h>
#include <string.h>  
#include <math.h>
FILE* plik;
int main()
{
	//zad 1

	/*
	char szukany = 'r';
	int ilosc_wystapien=0;
	plik = fopen("plik.txt", "r");
	char linijka[100];
	while (fgets(linijka, 100, plik)) {
		for (int i = 0; i < strlen(linijka); i++) {
			if (linijka[i] == szukany) ilosc_wystapien++;
		}
	}
	fclose(plik);
	printf("Ilosc wystapien %c w pliku to %d\n", szukany, ilosc_wystapien);*/



	//zad 7
	plik = fopen("plik7.txt", "r");
	char linijka[100];
	int rozdzial[] = { 0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0 };
	int podpunkt[] = { 0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0 };
	int index = 0;
	while (fgets(linijka, 100, plik)) {
		int ilosc_gwiazdek = 0;
		for (int i = 0; i < strlen(linijka); i++) {
			if (linijka[i] == '*') ilosc_gwiazdek++;
		}
		rozdzial[index] += ilosc_gwiazdek;
		index += 1;
		//char x = "";
		printf("aha");
		for (int i = 0; i < ilosc_gwiazdek; i++) {
			printf("%d", (podpunkt[i] + 1));

		}
		//printf("%s\n", x);
	}
	int tosamo[] = { 0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0 };
	for (int i = 0; i < 10; i++) {
		for (int spacje = 1; spacje < rozdzial[i]; spacje++) {
			printf("\t");
		}
		for (int j = 0; j <= i; j++) {
			if (rozdzial[j] == rozdzial[i]) tosamo[rozdzial[i]-1]++;
		}
		//printf("licbza gwiazdek %d\n", rozdzial[i]);
		for (int j = 0; j < rozdzial[i]-1; j++) {
			printf("%d.", tosamo[rozdzial[i] - 1]);
		}
		printf("\n");
	}
	fclose(plik);


	//zad 8
	/*plik = fopen("plik8.txt", "r");
	char linijka[100];
	int liczba_linijek[100]={0};
	int suma[100]={0};
	float srednia[100]={0};
	while (fgets(linijka, 100, plik)) {
		int index = 0;
		char* liczby;
		liczby = strtok(linijka, " ");
		while (liczby != NULL) {
			char *liczba = liczby;
			printf("liczba: %s\t", liczba);
			for (int i = 0; i < strlen(liczba); i++) {
				char* ptr = strchr(liczba, '\n');
				if (ptr) {
					// if new line found replace with null character
					*ptr = '\0';
				}
				int x = ((int)(liczba[i])-48) * pow(10,(strlen(liczba) - i-1));
				printf("dodawana suma %d",x);
				suma[index] += x;
			}
			liczba_linijek[index]++;
			liczby = strtok(NULL, " ");
			index += 1;
			printf("\nnowa linijka \n");
		}

	}
	for (int i = 0; i < 7; i++){
		srednia[i] = ((float)suma[i] / liczba_linijek[i]);
	}
	fclose(plik);
	for (int i = 0; i < 6; i++)
	{
		printf("%d\t", suma[i]);
	}
	printf("\n");
	for (int i = 0; i < 7; i++)
	{
		printf("%f\t", srednia[i]);
	}*/

}
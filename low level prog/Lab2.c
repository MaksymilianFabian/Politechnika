#define _CRT_SECURE_NO_WARNINGS
#include <stdio.h>
#include <stdlib.h>
#include <math.h>
#include <string.h>
#include <stdbool.h>
int automorficzna(int x) {
    int kwadrat = x * x;
    do {
        if (x % 10 == kwadrat % 10) {
            x /= 10;
            kwadrat /= 10;
        }
        else {
            return 0;
        }
    } while (x != 0);
    return 1;
}

int sumy(int x) {
    printf("x:%d\n", x);
    if (x != 0) return ((x % 10) + sumy(x / 10));
    else return 0;
}

int ilosctowarow = 0;
struct TablicaTowarow {
    char NazwaTowaru[64];
    int LiczbaSztuk;
    int Cena1Sztuki;


};
struct TablicaTowarow TablicaTowarow[49];
void n(const char NazwaTowaru[], int LiczbaSztuk, int Cena1Sztuki) {
    strcpy(TablicaTowarow[ilosctowarow].NazwaTowaru, NazwaTowaru);
    TablicaTowarow[ilosctowarow].LiczbaSztuk = LiczbaSztuk;
    TablicaTowarow[ilosctowarow].Cena1Sztuki = Cena1Sztuki;
    ilosctowarow++;
}
void w() {
    for (int i = 0; i < ilosctowarow; i++) {
        printf("Nazwa towaru: %s\n", TablicaTowarow[i].NazwaTowaru);
        printf("Liczba sztuk: %d\n", TablicaTowarow[i].LiczbaSztuk);
        printf("Cena 1 sztuki: %d\n", TablicaTowarow[i].Cena1Sztuki);
    }
}
void r() {
    int suma = 0;
    for (int i = 0; i < ilosctowarow; i++) {
        suma += TablicaTowarow[i].LiczbaSztuk * TablicaTowarow[i].Cena1Sztuki;
    }
    printf("suma wartosci wszystkich towarow %d", suma);
}
void q() { exit(1); }

int main() {
    while (true) {
        printf("Podaj numer zadania:\n");
        printf("1  -  Zadanie 8 (Zestaw 1)\n2  -  Zadanie 9 (Zestaw 1)\n3  -  Zadanie 12 (Zestaw 2)\n4  -  Zakoncz dzialanie programu\n\n");
        int zadanie;
        scanf_s("%d", &zadanie);
        switch (zadanie) {
        case 1: {
            printf("Oto zadanie 8:\n");
            int a;
            int b;
            printf("Podaj a i b\n");
            scanf_s("%d%d", &a, &b);
            for (; a <= b; a++) {
                if (automorficzna(a)) printf("%d\n", a);
            }
            break;
        }


        case 2: {
            printf("Oto zadanie 9:\n");
            int liczba;
            printf("Podaj liczbe\n");
            scanf("%d", &liczba);
            printf("%d\n", sumy(liczba));
            break;
        }


        case 3: {
            printf("Oto zadanie 12:\n");
            char wej;
            while (true)
            {
                printf("Co chcesz zrobic? (N, W, R, Q)\n");
                scanf(" %c", &wej);
                if (wej == 'N') {
                    char nazwa[100];
                    int ilosc, cena;
                    printf("Podaj ilosc i cene produktu\n");
                    scanf("%d%d", &ilosc, &cena);
                    printf("Podaj nazwe produktu\n");
                    scanf(" %s", &nazwa);
                    n(nazwa, ilosc, cena);
                }
                else if (wej == 'W') {
                    w();
                }
                else if (wej == 'R') {
                    r();
                    printf("\n");
                }
                else if (wej == 'Q') {
                    //q();
                    break;
                }
                else {
                    printf("Nie ma takiego polecenia\n");
                }
            }
            break;
        }


        default:
            printf("\n");
            break;

        }
        if (zadanie == 4) {
            break;
        }
    }
    return 0;
}
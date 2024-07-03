#include<stdio.h>
#include <stdlib.h>
#include <math.h>
#include <string.h>
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
        printf("Nazwa towaru:%s\n", TablicaTowarow[i].NazwaTowaru);
        printf("Liczba sztuk:%d\n", TablicaTowarow[i].LiczbaSztuk);
        printf("Cena 1 sztuki:%d\n", TablicaTowarow[i].Cena1Sztuki);
    }
}
void r() {
    int suma = 0;
    for (int i = 0; i < ilosctowarow; i++) {
        suma += TablicaTowarow[i].LiczbaSztuk * TablicaTowarow[i].Cena1Sztuki;
    }
    printf("suma wartosci wszystkich towarów%d", suma);
}
void q() { exit(1); }
int main() {
    //zad 8
    int a = 1;
    int b = 25;
    for(;a<=b;a++){
        if (automorficzna(a)) printf("%d\n", a);
    }

    //zad 9
    printf("%d\n", sumy(123));

    n("towar nr 1", 3, 4);
    w();
    r();
    q();
}
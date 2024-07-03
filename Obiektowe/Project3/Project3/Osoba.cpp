#include "Osoba.h"
#include <iostream>
using namespace std;

void Osoba::ustawImieNazwisko(const string& imie, const string& nazwisko) {
    this->Imie = imie;
    this->Nazwisko = nazwisko;
}

string Osoba::odczytajImie() const {
    return Imie;
}

string Osoba::odczytajNazwisko() const {
    return Nazwisko;
}

Osoba::~Osoba() {

}

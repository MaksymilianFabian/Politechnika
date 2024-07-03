#include "Pracownik.h"
#include <iostream>
using namespace std;

void Pracownik::ustawStanowisko(const std::string& stanowisko) {
    this->stanowisko = stanowisko;
}

string Pracownik::odczytajStanowisko() const {
    return stanowisko;
}

void Pracownik::zmienPensje(double pensja) {
    this->pensja = pensja;
}

double Pracownik::odczytajPensje() const {
    return pensja;
}

void Pracownik::przedstaw() const {
    Osoba::przedstaw();
    cout << "Pracownik: " << stanowisko << ", pensja: " << pensja << endl;
}

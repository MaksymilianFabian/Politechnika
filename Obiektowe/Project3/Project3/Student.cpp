#include "Student.h"
#include <iostream>
using namespace std;

void Student::ustawNazweUczelni(const string& nazwa) {
    NazwaUczelni = nazwa;
}

string Student::odczytajNazweUczelni() const {
    return NazwaUczelni;
}

void Student::zmienSrednia(double srednia) {
    SredniaOcen = srednia;
}

double Student::odczytajSrednia() const {
    return SredniaOcen;
}

void Student::przedstaw() const {
    Osoba::przedstaw();
    cout << "Student: " << NazwaUczelni << ", srednia: " << SredniaOcen << endl;
}

#pragma once
#include "Osoba.h"
#include<string>
using namespace std;

class Pracownik : public Osoba {
private:
    string stanowisko;
    double pensja;

public:
    void ustawStanowisko(const string& stanowisko);
    string odczytajStanowisko() const;
    void zmienPensje(double pensja);
    double odczytajPensje() const;
    void przedstaw() const override;
};

#pragma once
#include "Osoba.h"
#include<string>
using namespace std;

class Student : public Osoba{
private:
	string NazwaUczelni;
	double SredniaOcen;
public:
	void ustawNazweUczelni(const string& nazwa);
	string odczytajNazweUczelni() const;
	void zmienSrednia(double srednia);
	double odczytajSrednia() const;
	void przedstaw() const override;
};
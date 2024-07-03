#pragma once
#include <iostream>
#include<string>
using namespace std;

class Osoba {
protected:
	string Imie;
	string Nazwisko;
public:
	void ustawImieNazwisko(const string& imie, const string& nazwisko);
	virtual ~Osoba();
	string odczytajImie() const;
	string odczytajNazwisko() const;
	virtual void przedstaw() const = 0;
};
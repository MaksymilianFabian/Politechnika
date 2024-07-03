#include "Osoba.h"
#include "Student.h"
#include "Pracownik.h"
#include <iostream>
#include <vector>
using namespace std;

void foo(Osoba& os) {
    os.przedstaw();
}

void bar(Osoba* os) {
    os->przedstaw();
}

int main() {
    /*
    // Testowanie klasy Osoba
    Osoba osoba;
    osoba.ustawImieNazwisko("Jan", "Kowalski");
    osoba.przedstaw();

    // Testowanie klasy Student
    Student student;
    student.ustawImieNazwisko("Anna", "Nowak");
    student.ustawNazweUczelni("Politechnika Warszawska");
    student.zmienSrednia(4.5);
    student.przedstaw();

    // Testowanie klasy Pracownik
    Pracownik pracownik;
    pracownik.ustawImieNazwisko("Adam", "Majewski");
    pracownik.ustawStanowisko("Inzynier");
    pracownik.zmienPensje(5000.0);
    pracownik.przedstaw();
    return 0;

    //foobar
    Osoba foobarosoba;
    foobarosoba.ustawImieNazwisko("Maksymilian", "Fabian");
    foo(foobarosoba);
    bar(&foobarosoba);
    foobarosoba.przedstaw();

    Pracownik foobarpracownik;
    foobarpracownik.ustawImieNazwisko("Natan", "Lipiecki");
    foobarpracownik.ustawStanowisko("Malarz");
    foobarpracownik.zmienPensje(2000.0);
    foo(foobarpracownik);
    bar(&foobarpracownik);
    foobarpracownik.przedstaw();
    */

    vector<Osoba*> tablicaOsob;

    while (true) {
        cout << "Podaj komende (pracownik, student, wyswietl, wyjscie): ";
        string komenda;
        cin >> komenda;

        if (komenda == "pracownik") {
            Pracownik* nowyPracownik = new Pracownik;
            nowyPracownik->ustawImieNazwisko("Imie", "Nazwisko");
            nowyPracownik->ustawStanowisko("Stanowisko");
            nowyPracownik->zmienPensje(5000.0);
            tablicaOsob.push_back(nowyPracownik);
        }
        else if (komenda == "student") {
            Student* nowyStudent = new Student;
            nowyStudent->ustawImieNazwisko("ImieS", "NazwiskoS");
            nowyStudent->ustawNazweUczelni("Uczelnia");
            nowyStudent->zmienSrednia(4.5);
            tablicaOsob.push_back(nowyStudent);
        }
        else if (komenda == "wyswietl") {
            for (const auto& osoba : tablicaOsob) {
                osoba->przedstaw();
            }
        }
        else if (komenda == "wyjscie") {
            // Zwolnienie zaalokowanej pamięci przed zakończeniem programu
            for (auto osoba : tablicaOsob) {
                delete osoba;
            }
            break;
        }
        else {
            cout << "Nieznana komenda. Sprobuj ponownie." << endl;
        }
    }
}

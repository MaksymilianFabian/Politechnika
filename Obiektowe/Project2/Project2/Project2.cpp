using namespace std;
#include <iostream>
#include <string>
#include <algorithm>
#include <vector>
#include <set>

class Samochod {
private:
    float pojemnosc_baku;
    float poziom_paliwa;
    unsigned int liczba_kilometrow;
    std::string model;
public:
    Samochod() : pojemnosc_baku(60.0), poziom_paliwa(0.0), liczba_kilometrow(0.0), model("Yaris") {}

    Samochod(string nazwa, float pojemnosc) {
        model = nazwa;
        pojemnosc_baku = pojemnosc;
        poziom_paliwa = 0;
        liczba_kilometrow = 0;
    }

    float odczytaj_pojemnosc_baku() const {
        return pojemnosc_baku;
    }

    void displayInfo() const {
        std::cout << "Model: " << model << std::endl;
        std::cout << "Pojemnosc baku: " << pojemnosc_baku << " l" << std::endl;
        std::cout << "Poziom paliwa: " << poziom_paliwa << " l" << std::endl;
        std::cout << "Liczba kilometrow: " << liczba_kilometrow << " km" << std::endl;
    }

    void refuel(float amount) {
        poziom_paliwa += amount;
        std::cout << "Zatankowano " << amount << " l paliwa." << std::endl;
    }

    void drive(unsigned int distance) {
        if (distance == 0) {
            std::cout << "Samochod nie rusza sie." << std::endl;
            return;
        }

        float fuel_needed = static_cast<float>(distance) / 16.67; // Zakładamy spalanie 6l -> 1l = 16.67km
        if (fuel_needed > poziom_paliwa) {
            std::cout << "Brak wystarczajacej ilosci paliwa do przejechania " << distance << " km." << std::endl;
        }
        else {
            poziom_paliwa -= fuel_needed;
            liczba_kilometrow += distance;
            std::cout << "Przejechano " << distance << " km." << std::endl;
        }
    }

    // Operator bool()
    operator bool() const {
        return !model.empty() && pojemnosc_baku > 0;
    }

    // Operator !
    bool operator!() const {
        return model.empty() || pojemnosc_baku <= 0;
    }

    // Operator <<
    friend ostream& operator<<(ostream& os, const Samochod& samochod) {
        os << samochod.model << " " << samochod.poziom_paliwa << " l";
        return os;
    }
    /*Słowo kluczowe friend pozwala funkcji operator<< uzyskać dostęp do prywatnych składowych 
    klasy Samochod, umożliwiając bezpośrednie korzystanie z nich do wypisywania informacji na
    strumień wyjścia.*/

    // Operator <
    bool operator<(const Samochod& samochod) const {
        return this->model < samochod.model;
    }

    // Operator <<
    Samochod& operator++() {
        ++liczba_kilometrow;
        return *this;
    }

    // Operator |=
    Samochod& operator|=(float value) {
        poziom_paliwa += value;
        return *this;
    }


};

struct cmp {
    bool operator()(const Samochod& a, const Samochod& b) const {
        return a.odczytaj_pojemnosc_baku() < b.odczytaj_pojemnosc_baku();
    }
};

int main() {
    Samochod myCar("Corolla", 50.0); 

    myCar.displayInfo();  
    myCar.refuel(20.0);   
    myCar.drive(150);     
    myCar.displayInfo();  

    Samochod s1("audi", 123);
    Samochod s2("bmw", 0);
    Samochod s3("", 200);

    if (s3)
    {
        cout << "git1" << endl;
    }
    if (!s3)
    {
        cout << "git2" << endl;
    }

    cout << myCar << endl;  

    myCar.refuel(20.0);
    myCar.drive(150);

    cout << myCar << endl;  

    vector<Samochod> v;
    v.push_back(s1);
    v.push_back(s2);
    v.push_back(s3);

    sort(v.begin(), v.end());

    for (auto it = v.begin(); it != v.end(); ++it) {
        cout << *it << endl;
    }


    set <Samochod, cmp> s;
    s.insert(s1);
    s.insert(s2);
    s.insert(s3);
    for (auto it = s.begin(); it!=s.end(); ++it)
    {
        cout << *it << endl;
    }
    return 0;
}
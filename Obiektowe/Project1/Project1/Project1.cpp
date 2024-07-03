using namespace std;
#include <iostream>
#include <string>

class Beehive {
private:
	string Name;
	int Bee_count;
	double Honey_prodution;
	pair<double, double> Beehive_position;
	
	string Owner_name;
	string Date_of_placement;
	bool Bees_c_set;
	double Earnings;
public:
	Beehive(string name, string date, double honey_production) {
		if (isupper(name[0]))
		{
			Name = name;
		}
		Date_of_placement = date;
		Bees_c_set = false;
		Honey_prodution = honey_production;
	}
	void setBee_count(int bee_count) {
		if (Bees_c_set == false && bee_count >= 0)
		{
			Bee_count = bee_count;
			Bees_c_set = true;
		}
		else
		{
			cout << "Wartosci nie mozna ustawic" << endl;
		}
	}
	void changeBee_count(int bee_change) {
		if (Bee_count + bee_change >= 0 && abs(bee_change) <= 100)
		{
			Bee_count += bee_change;
		}
		else
		{
			cout << "Nieprawidlowa zmiana" << endl;
		}
	}
	int getBee_count() {
		return Bee_count;
	}
	void setBeehive_position(double x, double y) {
		Beehive_position = make_pair(x, y);
	}
	pair<double, double> getBeehive_position() {
		return Beehive_position;
	}
	void setHoney_production(int honey) {
		if (honey>=0)
		{
			Honey_prodution += honey;
		}
		else
		{
			cout << "Zle wprowadzono ilosc"<<endl;
		}
	}
	double getHoney_production() {
		return Honey_prodution;
	}
	void setName(string name) {
		if (isupper(name[0]))
		{
			Name = name;
		}
		else
		{
			cout << "Nieprawidlowa nazwa" << endl;
		}
	}
	string getName() {
		return Name;
	}
	void setOwner_name(string name) {
		Owner_name = name;
	}
	string getOwner_name() {
		return Owner_name;
	}
	void setEarnings(double price) {
		if (price >= 0)
		{
			Earnings = price * Honey_prodution;
		}
	}
	double getEarnings() {
		return Earnings;
	}
};


int main() {
	//PONIŻEJ PRZYKŁADOWY KOD SPRAWDZAJĄCY POPRAWNĄ FUNKCJONALNOŚĆ OBIEKTU UL
	
	Beehive ul = Beehive("Pasieka nowoczesna", "28.06.2021", 21.0);
	ul.setBee_count(50);
	cout<<ul.getBee_count()<<endl;
	ul.setBee_count(40);
	ul.changeBee_count(-30);
	cout << ul.getBee_count() << endl;
	ul.changeBee_count(25);
	cout << ul.getBee_count() << endl;
	ul.setBeehive_position(3.45435, 342.425);
	cout << ul.getBeehive_position().first << " " << ul.getBeehive_position().second << endl;
	ul.setHoney_production(12);
	cout << ul.getHoney_production() <<endl;
	cout << ul.getName() << endl;
	ul.setName("Mamma mia");
	cout << ul.getName() << endl;
	ul.setName("oh no");
	cout << ul.getName() << endl;
	ul.setOwner_name("Max");
	cout << ul.getOwner_name() << endl;
	ul.setEarnings(9);
	cout << ul.getEarnings() << "$" << endl;
	

}

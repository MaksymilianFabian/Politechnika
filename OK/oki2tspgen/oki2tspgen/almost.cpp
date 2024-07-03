#include <random>
#include <fstream>
#include <iostream>
#include <limits.h>
#include <vector>
#include <stdlib.h>
#include <string>
#include <cmath>
#include <cstdlib>
#include <ctime>
#include <algorithm>
#include <cstdio>

//g³ówne sta³e s³u¿¹ce do strojenia
#define POP_SIZE 1111 // Liczba populacji
#define DOMINATION_FACTOR 4500 // Czas dominacji danego genu (czyli ile razy by³ lepszy od innego genu zanim zrobiliœmy "reset")
#define ILOSC_CZEMPIONOW 0.15 // Ile osób z poprzedniego pokolenia przetrwa (ile genów do nastêpnego pokolenia) 
#define MUTATION_FACTOR 35 // Szansa na to, ¿e odbêdzie siê mutacja [%]
#define MINIMUM_LOSOWAN 2 //minimalna iloœæ mutacji przy tworzeniu populacji na bazie heurystyki
#define MAKSIMUM_LOSOWAN 0.315 // Popoluacja * Maksimum Losowañ = maksymalna iloœæ mutacji przy tworzeniu populacji na bazie heurystyki

#define TEMP_START 1000 // Temperatura na start
#define TEMP_REDUCE 0.9 // Jak mocno zmiejszana jest temp.

#define TRZY_MINUTY 15 //czas po jakim program sie wylaczy
#define GEN_COUNT 5000000000 //ilosc populacji po ktorej program sie wylaczy

typedef std::vector< std::vector<double> > Matrix;
typedef std::vector<double> Row;
typedef std::vector<int> Dna;


//struktura jednej odpowiedzi
struct individual {
	Dna gnome;
	double fitness;
	int dominacja;
};

//randomowa liczba
int rand_num(int start, int end)
{
	//std::cout << "rand_num" << std::endl;
	int r = end - start;
	int rnum = start + rand() % r;
	return rnum;
}
//zamiana dwóch genów miejscami
Dna mutatedGene(Dna gnome, int V)
{
	//std::cout << "MutatedGene" << std::endl;
	while (true) {
		int r = rand_num(1, V-1);
		int r1 = rand_num(1, V-1);
		if (r1 != r) {
			int temp = gnome[r];
			gnome[r] = gnome[r1];
			gnome[r1] = temp;
			break;
		}
	}
	return gnome;
}

//sprawdzenie czy sie powtarza
bool repeat(Dna s, int nowa)
{
	//std::cout << "Repeat" << std::endl;
	for (int i = 0; i < s.size(); i++) {
		if (s[i] == nowa)
			return true;
	}
	return false;
}
Dna mate(individual par1, individual par2) {
	//std::cout << "Mate" << std::endl;
	// std::cout << len;
	Dna child_gnome;
	//for (int i = 0; i < len; i++) {
		//std::cout << par1.gnome[i];
	//}
	int wartosc = -1;
	child_gnome.push_back(par1.gnome[0]);
	par1.gnome.erase(par1.gnome.begin());
	par2.gnome.erase(par2.gnome.begin());
	while(par2.gnome[0]>0 && par1.gnome[0] > 0) {
		float p = (float)rand() / (float)(RAND_MAX / 1);
		if (p < 0.5) {
			wartosc = par1.gnome[0];
			child_gnome.push_back(wartosc);
			
		}
		else {
			wartosc = par2.gnome[0];
			child_gnome.push_back(wartosc);
			/*std::remove(par1.gnome.begin(), par1.gnome.end(), wartosc);
			std::remove(par2.gnome.begin(), par2.gnome.end(), wartosc);*/

		}
		par1.gnome.erase(std::remove(par1.gnome.begin(), par1.gnome.end(), wartosc), par1.gnome.end());
		par2.gnome.erase(std::remove(par2.gnome.begin(), par2.gnome.end(), wartosc), par2.gnome.end());
		//std::cout << child_gnome[i] << "-" << std::endl;
	}
	child_gnome.push_back(0);
	
	/*for (size_t i = 0; i < child_gnome.size(); i++)
	{
		std::cout << child_gnome[i] << "-";
	}
	std::cout << std::endl;*/
	int i = rand_num(1, 100);
	if (i > MUTATION_FACTOR)
	{ 
		child_gnome = mutatedGene(child_gnome, child_gnome.size());
	}
	//std::cout << "rozmiar dzieciaka: " << child_gnome.size() << std::endl;
	return child_gnome;
}
double dystans(int n, Matrix graph, int vertex1, int vertex2) {
	return graph[vertex1][vertex2];
}

individual TSP_choose_shortest(int n, Matrix matrix_graph) {
	//tworze dwa wektory, pierwszy to trasa, drugi to flaga na wierzcholki
	std::vector<int> trasa;
	std::vector<bool> visited(n, false);
	//wybieram miasto poczatkowe
	individual her;
	int currentVertex = 0;
	visited[currentVertex] = true;
	trasa.push_back(currentVertex);
	double dystans_value = 0.0;

	for (int i = 1; i < n; i++) {
		int nextVertex = -1;
		//to jest dziwne, ustawiam aktualny najmniejszy dystans na najwieksza wartosc inta
		int minimalnyDystans = std::numeric_limits<int>::max();
		for (int j = 0; j < n; j++) {
			if (matrix_graph[currentVertex][j] < minimalnyDystans && visited[j]==false) {
				minimalnyDystans = matrix_graph[currentVertex][j];
				nextVertex = j;
			}
		}
		if (nextVertex != -1) {
			trasa.push_back(nextVertex);
			visited[nextVertex] = true;
			currentVertex = nextVertex;
		}

	}
	currentVertex = 0;
	trasa.push_back(currentVertex);
	for (int vertex : trasa) {
		std::cout << vertex << " -> ";
	}
	//std::cout << "0" << std::endl;
	for (int i = 0; i < trasa.size() - 1; i++) {
		//std::cout << "krok: " << dystans(matrix_graph, trasa[i], trasa[i + 1]) << std::endl;
		dystans_value += dystans(n, matrix_graph, trasa[i], trasa[i + 1]);
		//std::cout <<"teraz: "<< dystans(n, matrix_graph, trasa[i], trasa[i + 1]) << std::endl;
		//std::cout << "w sumie "<< dystans_value << std::endl;
	}

	her.gnome = trasa;
	std::cout << "dystans w sumie to: " << dystans_value << std::endl;
	return her;
}
//tworzenie genomu
Dna create_gnome(int V)
{
	//std::cout << "Create_gnome" << std::endl;
	Dna gnome;
	gnome.push_back(0);
	while (true) {
		if (gnome.size() == V) {
			gnome.push_back(0);
			break;
		}
		int temp = rand_num(1, V);
		if (!repeat(gnome, temp)) {
			gnome.push_back(temp);
		}

	}
	return gnome;
}
Dna mutatefirst(Dna first, int V) {
	for (int i = 0; i < rand_num(MINIMUM_LOSOWAN, V*MAKSIMUM_LOSOWAN); i++) {
		first = mutatedGene(first, V);
	}
	return first;
}

double cal_fitness(Dna gnome, int V, Matrix map)
{
	//std::cout << "Call_fitness" << std::endl;
	double f = 0;
	for (int i = 0; i < gnome.size() - 1; i++) {
		//std::cout << f << "+" << map[gnome[i]][gnome[i + 1]] << std::endl;
		f += map[gnome[i]][gnome[i + 1]];

	}
	return f;
}


//cooling element
int cooldown(int temp)
{
	//std::cout << "Cooldown" << std::endl;
	//return (90 * temp) / 100;
	return temp * TEMP_REDUCE;
}

//porównywanie, okazalo sie useless
bool lessthan(struct individual t1,
	struct individual t2)
{
	return t1.fitness < t2.fitness;
}

individual newlessthan(struct individual t1, struct individual t2) {
	//std::cout << "newwlessthan" << std::endl;
	if (t1.fitness <= t2.fitness) {
		t1.dominacja++;
		return t1;
	}
	else {
		std::cout << "progress-> " << t2.fitness << std::endl;
		t2.dominacja = 0;
		return t2;
	}
}

//g³ówna funkcja genetycznego
void TSP_GEN(Matrix map, int V)
{
	//poczatek liczenia czasu
	clock_t start = clock();
	clock_t now;

	// generacja 1
	int gen = 1;
	// ilosc iteracji
	int gen_thres = GEN_COUNT;

	//odp
	Dna smieci;
	individual syn_kolezanki_mamy = { smieci,std::numeric_limits < double >::max(),0 };
	

	//populacja
	std::vector<struct individual> population;
	struct individual temp,shortest;

	//
	temp = TSP_choose_shortest(V, map);
	temp.fitness = cal_fitness(temp.gnome, V, map);
	population.push_back(temp);
	shortest = temp;
	//
	// zape³nianie populacji
	for (int i = 0; i < POP_SIZE-1; i++) {
		//temp.gnome = create_gnome(V);
		temp.gnome=mutatefirst(population[0].gnome, V);
		temp.fitness = cal_fitness(temp.gnome, V, map);
		population.push_back(temp);
	}

	//std::cout << "\nInitial population: " << std::endl
		//<< "GNOME     FITNESS VALUE\n";
	for (int i = 0; i < POP_SIZE; i++) {
		for (int j = 0; j < V + 1; j++) {
			//std::cout << population[i].gnome[j] << "-";
		}
		//std::cout << ">     " << population[i].fitness << std::endl;
		syn_kolezanki_mamy = newlessthan(syn_kolezanki_mamy, population[i]);
	}


	bool found = false;
	int temperature = TEMP_START;

	//krzyzowanie i mutacje
	now = clock();
	while (gen <= gen_thres && ((now - start) / CLOCKS_PER_SEC) <= TRZY_MINUTY) {
		sort(population.begin(), population.end(), lessthan);
		//std::cout << "\nCurrent temp: " << temperature << "\n";
		std::vector<struct individual> new_population;
		if (syn_kolezanki_mamy.dominacja < DOMINATION_FACTOR) {
			int ss = POP_SIZE * ILOSC_CZEMPIONOW;
			for (int i = 0; i < ss; i++) {
				new_population.push_back(population[i]);
			}

			int sss = POP_SIZE - ss;
			for (int i = 0; i < sss; i++) {
				int len = population.size();
				int parenting = rand_num(1, ss);
				individual offspring;
				offspring.gnome = mate(population[0], population[parenting]);
				offspring.fitness = cal_fitness(offspring.gnome, V, map);
				new_population.push_back(offspring);

			}
			//std::cout << "rozmiar populacji: " << new_population.size() << std::endl;
		}
		else
		{
			std::cout << "zdominowane" << std::endl;
			int iloscsynow = POP_SIZE * 0.1;
			for (int i = 0; i < iloscsynow; i++) {
				new_population.push_back(population[i]);
			}
			temp = shortest;
			
			for (int i = 0; i < POP_SIZE - iloscsynow; i++) {
					new_population.push_back(temp);
					temp.gnome = mutatefirst(population[0].gnome, V);
					temp.fitness = cal_fitness(temp.gnome, V, map);
					
				
			}
			//std::cout << "rozmiar populacji: " << new_population.size() << std::endl;
			syn_kolezanki_mamy.dominacja = (-2 * DOMINATION_FACTOR);
		}

		temperature = cooldown(temperature);

		population = new_population;
		//std::cout << "Generation " << gen << " \n";
		//std::cout << "GNOME     FITNESS VALUE\n";

		for (int i = 0; i < POP_SIZE; i++) {
			for (int j = 0; j < V + 1; j++) {
				//std::cout << population[i].gnome[j] << "-";
			}
			//std::cout << ">     " << population[i].fitness << std::endl;
			syn_kolezanki_mamy = newlessthan(syn_kolezanki_mamy, population[i]);
		}
		gen++;
		std::cout << "czas: " << ((now - start) / CLOCKS_PER_SEC) << std::endl;
		now = clock();
	}
	std::cout << "\n\n\n\n najlepszy gen to: ";
	for (int j = 0; j < V + 1; j++) {
		std::cout << syn_kolezanki_mamy.gnome[j] << "-";
	}
	std::cout << "  jego fitness to: " << syn_kolezanki_mamy.fitness;
}

//koniec algorytmu genetycznego

void generate() {
	
	int n;
	std::cout << "wpisz ile chcesz wierzcho³ków " << std::endl;
	std::cin >> n;
	std::cout << std::endl;
	std::ofstream zapis("in.txt");
	zapis << n << std::endl;
	for (int i = 1; i < n + 1; i++) {
		zapis << i << " " << (std::rand() % 100) * 1 << " " << (std::rand() % 100) * 1 << std::endl;
	}
}

double calculate(int x1, int y1, int x2, int y2)
{
	double wynik;
	//std::cout << "x1: " << x1 << "  x2: " << x2 << "  y1: " << y1 << "  y2: " << y2 << std::endl;
	wynik = std::sqrt(std::pow(x2 - x1, 2) + std::pow(y2 - y1, 2));
	//std::cout << "wynik: " << wynik << std::endl;
	return wynik;
}

//sta³a iloœæ wierzcho³ków
//#define V 5




int main() {
	std::srand((std::time(nullptr)));
	int wybor;
	std::cout << "Jesli masz plik, wybierz 1, jesli nie, wybierz 2, skonczyc 3 " << std::endl;
	std::cin >> wybor;
	std::cout << std::endl;
	bool koniec = true;
	while (koniec != false)
	{

		switch (wybor)
		{
		case 1:
		{

			//to jest otwarcie pliku
			std::ifstream odczyt("in.txt");
			std::string linia;
			//tu chodzi tylko o to, ¿e ta pierwsza linia jest inna, wiêc chce j¹ od razu przerzuciæ do zmiennej i zapomnieæ o jej iostnieniu
			getline(odczyt, linia);
			int V = stoi(linia);
			if (V < 1) {
				break;
			}
			//tu robiê sobie vektor vektorów -> czyli macierz


			const size_t N = 3; //macierz jest zawsze szeroka na 3 i wysoka na 2
			Matrix matrix;
			std::string s, dump;
			std::vector<int> ciag;
			getline(odczyt, dump, ' ');
			//tu zaczynaj¹ siê jaja
			//tworze vector intów do którego wpycham wszystkie wartoœci po pierwszej linii z pliku
			int integer;
			//to slice'uje mi wszystko po spacji, ale nie ogarnia do koñca konceptu entera, póŸniej to siê ogarnie
			while (getline(odczyt, s, ' ')) {
				integer = stoi(s);
				//std::cout << integer << "  ";
				ciag.push_back(integer);
			}
			/*
			//nie ma po co tego drukowaæ
			for (size_t i = 0; i < ciag.size(); i++) {
			}*/
			//std::cout << ciag.size();

			//tu zaczynaj¹ siê jaja^2
			//counter - liczy mi który rzecz z vectora ciag powinna byc teraz dodana do macierzy
			int counter = 0;
			//dodawaæ bêdziemy ca³e wiersze od razu
			Row row(V);
			for (int i = 0; i < V; ++i)
			{


				//konstrukcja wiersza to LP, X, Y, jako ¿e nasza funkcja slice'owania nie wie jak dzia³a enter, wpiszemy LP rêcznie XD
				row[0] = i + 1;
				//tutaj dodaje X i Y, po to jest mi counter ¿eby wiedzia³ które one maj¹ miejsca w vektorze ciag
				for (size_t j = 1; j < N; ++j)
				{
					//row[j] = odczyt.get();

					int temp = ciag[counter];
					row[j] = temp;
					counter++;

				}
				/*
				for (int i = 0; i < 3; i++)
				{
					std::cout << row[i] << "  ";
				}
				std::cout << std::endl;*/
				matrix.push_back(row); //pushuje wiersze do tabeli
			}
			//no i mam macierz, która dzia³a, uwaga uwaga, jak macierz

			//zaczynamy liczyæ 
			//potrzebujemy macierzy s¹siedztwa
			//uwaga uwaga - nie mamy macierzy s¹siedztwa
			Matrix neighbour_matrix;
			Row n_row;
			for (int i = 0; i < V; ++i)
			{
				Row n_row(V);
				for (size_t j = 0; j < V; ++j)
				{
					if (i != j) {
						n_row[j] = calculate(matrix[i][1], matrix[i][2], matrix[j][1], matrix[j][2]);
					}
					else
					{
						n_row[j] = 0;
					}
				}

				{

				}

				neighbour_matrix.push_back(n_row);
			}
			/*
			for (size_t i = 0; i < V; ++i)
			{
				for (size_t j = 0; j < V; ++j)
				{
					std::cout << neighbour_matrix[i][j] << " ";
				}

				std::cout << std::endl;
			}
			*/
			TSP_choose_shortest(V, neighbour_matrix);
			TSP_GEN(neighbour_matrix, V);
			std::cin >> wybor;

			break;
		}
		case 2:
		{
			generate();
			wybor = 3;
			break;
		}
		case 3:
		{
			koniec = false;
			break;
		}
		default:
		{
			wybor = 3;
			break;
		}
		}
	}
	return 0;
}	  
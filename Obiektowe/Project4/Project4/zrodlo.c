#include <stdio.h>
#include <stdlib.h>
#include <unistd.h>
#include <pthread.h>
#include <semaphore.h>
#include <time.h>

// Maksymalna liczba pasazerów
#define MAX_PASSENGERS 25


pthread_mutex_t check_in_lock; // mutex do kontrolowania pasazerów on-board
pthread_mutex_t riding_lock; // mutex do kontrolowania pasazerów off-board

sem_t board_queue; // Semafor zapewniajacy dolaczanie do wagonika
sem_t all_boarded; // Binarny semafor wysylajacy sygnal do oczekiwania
sem_t unboard_queue; // Semafor zapewniajacy wychodzenie z wagonika
sem_t all_unboarded; // Semafor binarny wysylajacy sygnal do ponownego zapelnienia

volatile int boarded = 0; // Aktualna wartosc watków pasazerów, który weszli do wagonika
volatile int unboarded = 0; // Aktualna wartosc watków pasazerów, który opuscili wagonik
volatile int current_ride = 0; // Aktualna liczba kursów
volatile int passengers; // Aktualna wartosc watków pasazerów
volatile int capacity; // Pojemnosc wagonika

void* Rollercoaster() {
	int i, max_rides;

	max_rides = (passengers / capacity % 2 == 0) ? (passengers / capacity) : (passengers / capacity + 1);

	while (current_ride < max_rides && passengers >= capacity) {
		printf("Przejazd #%d wlasnie sie rozpoczyna, czas na gotowosc!\n", current_ride + 1);
		printf("Pojemnosc wagonika to: %d\n", capacity);
		sleep(2);

		for (i = 0; i < capacity; i++) sem_post(&board_queue); // Sygnal do zapelniania wagonika
		sem_wait(&all_boarded); // Oczekiwanie na zapelnienie wagonika

		printf("Wagonik jest pelen, czas na przejazd!\n");
		sleep(2);
		printf("Jazda rollercoasterem!\n");
		sleep(5);
		printf("Jazda skonczona, czas na opuszczenie wagoniku!\n");
		sleep(2);

		for (i = 0; i < capacity; i++) sem_post(&unboard_queue); // Sygnal do opuszczania wagonika
		sem_wait(&all_unboarded); // Oczekiwanie na  zwolnienie wagonika
		printf("Wagonik jest pusty!\n\n");

		current_ride++;
	}
	return NULL;
}

void* Passengers() {

	while (1) {
		sem_wait(&board_queue);

		pthread_mutex_lock(&check_in_lock);
		boarded++;
		passengers--;

		printf("%d pasazer wszedl do wagonu...\n", boarded);
		sleep(rand() % 2);

		if (boarded == capacity) {
			sem_post(&all_boarded); // Jezeli wagonik jest zapelniony, wysylamy sygnal do startu
			boarded = 0;
		}
		pthread_mutex_unlock(&check_in_lock);

		sem_wait(&unboard_queue); // Oczekiwanie na koniec jazdy

		pthread_mutex_lock(&riding_lock);
		unboarded++;

		printf("%d pasazer wyszedl z wagonu...\n", unboarded);
		sleep(rand() % 2);

		if (unboarded == capacity) {
			sem_post(&all_unboarded); // Jezeli to ostatni pasazer, który opuscil wagonik, wysylamy sygnal do ponownego ladowania
			unboarded = 0;
		}
		pthread_mutex_unlock(&riding_lock); // Odblokowanie wspoldzielonych zmiennych
	}
	return NULL;
}


int main() {

	srand(time(NULL));
	passengers = 2 + rand() % MAX_PASSENGERS;
	capacity = 1 + rand() % (passengers - 1);

	pthread_t passenger[passengers];
	pthread_t car;
	int i;

	pthread_mutex_init(&check_in_lock, NULL);
	pthread_mutex_init(&riding_lock, NULL);
	sem_init(&board_queue, 0, 0);
	sem_init(&all_boarded, 0, 0);
	sem_init(&unboard_queue, 0, 0);
	sem_init(&all_unboarded, 0, 0);

	printf("Jest %d pasazerow czekajacych w kolejce!\n\n", passengers);

	//Wlasciwy start programu
	if (pthread_create(&car, NULL, &Rollercoaster, NULL) == -1) {
		perror("Watek kolejki");
	}
	for (i = 0; i < passengers; i++) {
		if (pthread_create(&passenger[i], NULL, &Passengers, NULL) == -1) {
			perror("Watki pasazera");
		}
	}

	pthread_join(car, NULL);


	// Usuniecie wszystkich semaforów i watków
	pthread_mutex_destroy(&check_in_lock);
	pthread_mutex_destroy(&riding_lock);
	sem_destroy(&board_queue);
	sem_destroy(&all_boarded);
	sem_destroy(&unboard_queue);
	sem_destroy(&all_unboarded);

	return 0;
}
#include <stdio.h>
#include <stdlib.h>
#include <pthread.h>
#include <unistd.h>
#include <semaphore.h>

#define MAX_OPOZNIENIE 3

typedef struct {
    int id;
    char kierunek; // 'N' dla pólnocy, 'S' dla poludnia
} Samochod;

int oczekujace_polnoc = 0, oczekujace_poludnie = 0;
sem_t semafor_polnoc, semafor_poludnie;
pthread_mutex_t blokada = PTHREAD_MUTEX_INITIALIZER;
int samochody_na_moscie = 0;
char aktualny_kierunek = '0';

void* watek_samochodu(void* arg) {
    Samochod* samochod = (Samochod*)arg;
    printf("Samochód %d podjezdza z kierunku %c.\n", samochod->id, samochod->kierunek);

    pthread_mutex_lock(&blokada);
    if (samochod->kierunek == 'N') {
        oczekujace_polnoc++;
        while (aktualny_kierunek == 'S' || (samochody_na_moscie > 0 && aktualny_kierunek != samochod->kierunek)) {
            pthread_mutex_unlock(&blokada);
            sem_wait(&semafor_polnoc);
            pthread_mutex_lock(&blokada);
        }
        oczekujace_polnoc--;
    }
    else {
        oczekujace_poludnie++;
        while (aktualny_kierunek == 'N' || (samochody_na_moscie > 0 && aktualny_kierunek != samochod->kierunek)) {
            pthread_mutex_unlock(&blokada);
            sem_wait(&semafor_poludnie);
            pthread_mutex_lock(&blokada);
        }
        oczekujace_poludnie--;
    }
    samochody_na_moscie++;
    aktualny_kierunek = samochod->kierunek;
    pthread_mutex_unlock(&blokada);

    printf("Samochód %d przejezdza przez most z kierunku %c.\n", samochod->id, samochod->kierunek);
    sleep(rand() % MAX_OPOZNIENIE + 1);

    pthread_mutex_lock(&blokada);
    samochody_na_moscie--;
    if (samochody_na_moscie == 0) {
        aktualny_kierunek = '0';
        if (oczekujace_polnoc > 0) {
            sem_post(&semafor_polnoc);
        }
        else if (oczekujace_poludnie > 0) {
            sem_post(&semafor_poludnie);
        }
    }
    pthread_mutex_unlock(&blokada);

    printf("Samochód %d odjechal.\n", samochod->id);
    free(samochod);
    return NULL;
}

int main() {
    pthread_t watki;
    int licznik = 0;

    sem_init(&semafor_polnoc, 0, 0);
    sem_init(&semafor_poludnie, 0, 0);

    while (1) {
        Samochod* samochod = malloc(sizeof(Samochod));
        if (!samochod) {
            perror("Nie udalo sie zaalokowac pamieci dla samochodu");
            exit(EXIT_FAILURE);
        }

        samochod->id = ++licznik;
        samochod->kierunek = (rand() % 2) == 0 ? 'N' : 'S';

        if (pthread_create(&watki, NULL, watek_samochodu, (void*)samochod) != 0) {
            perror("Nie udalo sie utworzyc watku dla samochodu");
            free(samochod);
            continue;
        }

        pthread_detach(watki); // Pozwala na zwolnienie zasobów watku po jego zakonczeniu

        if ((licznik % 10) == 0) sleep(1); // Ograniczenie ilosci tworzonych watków

        sleep(rand() % MAX_OPOZNIENIE); // Losowe opóznienie miedzy tworzeniem samochodów
    }

    // Czyszczenie semaforów (teoretycznie, poniewaz w tym przypadku main nigdy sie nie zakonczy)
    sem_destroy(&semafor_polnoc);
    sem_destroy(&semafor_poludnie);
    return 0;
}

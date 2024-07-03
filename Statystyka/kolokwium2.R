#######################
###### Hipotezy #######
#######################
###### ZADANIE 1 ######
#######################

Aby mogły pracować urządzenia prądotwórcze elektrowni wiatrowej średnia prędkość wiatru powinna
przekraczać 4 m/s. W celu stwierdzenia czy sensowna jest budowa elektrowni wiatrowej mierzono
przez okres roku każdego miesiąca przeciętną prędkość wiatru w okolicach Darłowa uzyskując wyniki
(w m/s):

Zakładając, że prędkość wiatru jest zmienną losową o rozkładzie normalnym oraz przyjmując poziom
istotności α=0,05 sprawdź, czy okolice Darłowa nadają się do budowy elektrowni wiatrowych. W tym
celu skonstruuj odpowiednią procedurę testującą. Porównaj otrzymane wyniki z uzyskanymi po
zastosowaniu odpowiedniej funkcji z pakietu R.

dane = read.csv("C:/Users/klemm/Desktop/SADkolos2/dane_hip.csv", sep=";", dec = ",", head = TRUE)
wiatr = na.omit(dane$wiatr)
wiatr

### Hipoteza
### H0: mu <= 4m/s
### H1: mu  > 4m/s

mu = 4
alfa = 0.05
t.test(wiatr, mu = mu, alternative = "greater", conf.level = 1-alfa)

### Jeżeli p-value jest większe of alfy -> nie odrzucamy H0
### Jeżeli p-value jest mniejsze of alfy -> odrzucamy H0
### Na poziomie istotności 0.05 dane potwierdzają hipotezę, że okolice darłowa nadają się na budowę elektrowni wiatrowych







#######################
###### Hipotezy #######
#######################
###### ZADANIE 2 ######
#######################

Przyjęto, że współczynnik efektywności pompy cieplnej COP jest zadawalający, gdy jego średnia
wartość wynosi co najmniej 3,5 (co oznacza, że ponad 70% dostarczonego przez pompę ciepła
pochodzi z naturalnego źródła ciepła, a reszta pochodzi z pracy sprężarki). Potencjalny nabywca
pompy ma wątpliwości i wysunął przepuszczenie, że współczynnik efektywności pompy cieplnej w
jego gospodarstwie domowym jest znacznie mniejszy niż 3,5. Przez pewien okres mierzono
współczynnik COP w tym gospodarstwie otrzymując następujące wyniki:

Zakładając, że zmienna opisująca wartości współczynnika COP jest zmienną losową o rozkładzie
normalnym i na podstawie powyższych wyników (przyjmując poziom istotności α=0,01) sprawdź, czy
wątpliwości nabywcy są słuszne. 


dane = read.csv("C:/Users/klemm/Desktop/SADkolos2/dane_hip.csv", sep=";", dec = ",", head = TRUE)
pompa = na.omit(dane$pompa)
pompa

### Hipoteza
### H0: mu >= 3.5
### H1: mu < 3.5

mu = 3.5
alfa = 0.01

t.test(pompa, mu = mu, alternative = "less", conf.level = 1-alfa)

### p-value jest większe of alfy, zatem nie ma podstaw do odrzucenia H0. Na poziomie istotności 0.01
### dane nie potwierdzają hipotezy







#######################
###### Hipotezy #######
#######################
###### ZADANIE 3 ######
#######################

Wiadomo, że rozkład wyników pomiarów głębokości morza w pewnym rejonie jest normalny z
odchyleniem standardowym 5 m. Dokonano 5 niezależnych pomiarów głębokości morza w pewnym
rejonie i otrzymano następujące wyniki (w m):
Przyjmując poziom istotności α=0,05 zweryfikuj hipotezę, że średnia głębokość morza w tym rejonie
jest różna od 870 m. 

install.packages("BSDA")
library(BSDA)

dane = read.csv("C:/Users/klemm/Desktop/SADkolos2/dane_hip.csv", sep=";", dec = ",", head = TRUE)
morze = na.omit(dane$morze)
morze

### Hipoteza
### H0: mu = 870
### H1: mu != 870

sd = 5
alfa = 0.05
mu = 870

z.test(morze, sigma.x = sd, mu = mu, alternative="two.sided", conf.level = 1 - alfa)

### p-value jest większe niż alfa, zatem nie ma podstaw do odrzucenia H0. 
### Na poziomie ufności 0.01, dane potwierdzają hipotezę, że w tym rejonie średnia
### głębokość jest różna od 870mm







#######################
###### Hipotezy #######
#######################
###### ZADANIE 4 ######
#######################

Automat produkuje blaszki określonych wymiarów o nominalnej grubości 0,04 mm. Wylosowana
próba 40 blaszek dała następujące wyniki:
Przyjmując poziom istotności α=0,02 sprawdź poprawność twierdzenia, że produkowane przez ten
automat blaszki są grubsze niż nominalna grubość. 


install.packages("BSDA")
library(BSDA)

dane = read.csv("C:/Users/klemm/Desktop/SADkolos2/dane_hip.csv", sep=";", dec = ",", head = TRUE)
blaszki = na.omit(dane$blaszki)
blaszki

### Hipoteza
### H0: mu <= 0.04
### H1: mu > 0.04

mu = 0.04
alfa = 0.02

zsum.test(mean(blaszki), sd(blaszki), length(blaszki), mu = mu, alternative = "greater", conf.level = 1 - alfa)

### p-value jest większe od alfy, zatem mamy brak podstaw do odrzucenia H0.
### Na poziomie istotności 0.02 dane nie potwierdzają hipotezy, że blaszki są grubsze niż 0.04mm







#######################
###### Hipotezy #######
#######################
###### ZADANIE 5 ######
#######################

W próbce laboratoryjnej mleka spożywczego wykonano 10 oznaczeń (w %) zawartości tłuszczu i
uzyskano:
Przyjmując, że rozkład zawartości tłuszczu w mleku spożywczym jest normalny, odpowiedź na
poniższe pytania (przyjmij poziom istotności α = 0,05):
(a) Czy obserwacje przeczą hipotezie, że średnia zawartość tłuszczu w mleku wynosi 1,7 %?
(b) Czy można twierdzić, że wariancja zawartości tłuszczu w mleku jest mniejsza niż 0,02 (%)2

dane = read.csv("C:/Users/klemm/Desktop/SADkolos2/dane_hip.csv", sep=";", dec = ",", head = TRUE)
mleko = na.omit(dane$mleko)
mleko

### Hipoteza
### H0: mu = 1.7
### H1: mu != 1.7

alfa = 0.05
mu = 1.7

### a)

t.test(mleko, mu = mu, alternative = "two.sided", conf.level = 1 - alfa)

### p-value jest większe of alfy -> brak podstaw do odrzucenia H0
### Nie przeczy hipotezie, że średnia wartość tłuszczu wynosi 1.7%


### b)

install.packages("TeachingDemos")
library(TeachingDemos)

### Hipoteza
### H0: mu >= 0.02
### H1: mu < 0.02

sigma0 = 0.02
alfa = 0.05

sigma.test(mleko, sigmasq = sigma0, alternative = "less", conf.level = 1 - alfa)

### p-value jest większe od alfy, zatem brak podstaw do odrzucenia H0
### Wynik przeczy hipotezie, że wariancja zawartości tłuszczu w mleku jest mniejsza od 0.02







#######################
###### Hipotezy #######
#######################
###### ZADANIE 6 ######
#######################

Kukułki podrzucają swoje jaja różnym ptakom, między innymi małym strzyżykom. Obserwacje
przyrodników wskazują, że kukułka potrafi znieść jajo wielkości podobnej do jaj „adopcyjnych
rodziców”. Zmierzono długość [w mm] 21 jaj podrzuconych strzyżykom otrzymując wyniki:

Wiadomo, że średnia długość jaj strzyżyka wynosi 17 mm, a odchylenie standardowe 2,5 mm.
Zakładamy, że badana cecha ma rozkład normalny.
(a) Na poziomie istotności 0,05 zweryfikuj stawianą przez przyrodników hipotezę dotyczącą:
  (i) średniej długości podrzuconych jaj.
  (ii) wariancji długości podrzuconych jaj.
(b) Zbuduj 95% przedział ufności dla średniej długości jaj podrzucanych strzyżykom. Jaki jest związek
między skonstruowanym przedziałem ufności a decyzją podjętą przy testowaniu hipotez?

dane = read.csv("C:/Users/klemm/Desktop/SADkolos2/dane_hip.csv", sep=";", dec = ",", head = TRUE)
kukulki = na.omit(dane$kukulki)
kukulki

mu = 17
sd = 2.5
alfa = 0.05


### a) 
### i)

install.packages("BSDA")
library(BSDA)

### Hipoteza
### H0: mu = 17
### H1: mu != 17

t.test(kukulki, mu = mu, alternative = "two.sided", conf.level = 1 - alfa)

### p-value jest mniejsze od alfa, więc odrzucamy H0. Hipoteza nie jest prawdziwa


### a)
### ii)

install.packages("TeachingDemos")
library(TeachingDemos)

### Hipoteza
### H0: var = 17
### H1: var != 17

wariancja = sd^2

sigma.test(kukulki, sigmasq = wariancja, alternative = "two.sided", conf.level = 1 - alfa)

### p-value jest większe od alfry, zatem nie mamy podstaw do odrzucenia H0.
### Dane potwierdzają hipotezę


### b)

t.test(kukulki, conf.level = 1 - alfa) ### Jest to poprawna odpowiedź

przedzial = function(dane, conf_level){
  srednia = mean(kukulki)
  odchylenie = sd(kukulki)
  n = length(kukulki)
  alfa = conf_level
  t_critical = qt(1 - alfa/2, df = n - 1)
  
  dolna_granica = srednia - t_critical * (odchylenie / sqrt(n))
  gorna_granica = srednia + t_critical * (odchylenie / sqrt(n))
  
  przedzial = c(dolna_granica, gorna_granica)

  return(przedzial)
    
}

przedzial(kukulki, alfa)

### Średnia (17) nie zawiera się w przedziale dla ufności 95%, 
### zatem odrzucamy Hipotezę







#######################
###### Hipotezy #######
#######################
###### ZADANIE 7 ######
#######################

Agencja Ochrony Środowiska ustaliła dopuszczalne średnie zanieczyszczenie na terenach
przemysłowych jako 55 miligramów na m3, (w promieniu 2 km od fabryki), przy odchyleniu
standardowym 18 (miligramów na m3). Ekolog zmierzył poziom zanieczyszczeń na terenie
przemysłowym 100 razy, w różnych dniach i nocach, a następnie obliczył średnią i odchylenie
standardowe pomiarów: odpowiednio 60 i 20 miligramów na m3. Przyjmując poziom istotności 0,01,
zweryfikuj, czy dane potwierdzają, że fabryka działa niezgodnie z prawem (w celu weryfikacji
hipotezy dotyczącej wariancji należy przyjąć normalność poziomu zanieczyszczeń).


mu = 55
sd = 18

n = 100 #duża próba

srednia = 60
odchylenie = 20

alfa = 0.01



### a)

install.packages("BSDA")
library(BSDA)

### Hipoteza dla sredniej
### H0: mu <= 55
### H1: mu > 55

zsum.test(srednia, odchylenie, n, mu = mu, alternative="greater", conf.level = 1 - alfa)

### p-value jest mniejsze od alfy, zatem odrzucamy H0




### b)

### =========================================================== ###








#######################
###### Hipotezy #######
#######################
###### ZADANIE 8 ######
#######################

Sondaż opinii publicznej na temat frekwencji oczekiwanej na wyborach wykazał, że w losowo
wybranej grupie 2500 osób 1600 zamierza uczestniczyć w głosowaniu. Czy na poziomie istotności
równym 0,05 próba przeczy twierdzeniu, że 60% ogółu osób zamierza wziąć udział w wyborach?
Skonstruuj odpowiednią procedurę testującą. Porównaj otrzymane wyniki z uzyskanymi po
zastosowaniu testu dokładnego dostępnego w pakiecie R.

n = 2500
T = 1600
alfa = 0.05
p0 = 0.6

### Hipoteza 
### H0: p = 0.6
### H1: p != 0.6

binom.test(T, n, p = p0, alternative="two.sided", conf.level = 1 - alfa)



### Odrzucamy H0, ponieważ p-value wyszło mniejsze niż alfa

p_hat = 1600/2500

qnorm(1 - alfa/2)
### Obszar krytyczny dla "two.sided" 
### (-inf, -z1-a/2) U (z1-a/2, inf)

Z = (p_hat - p0) / (sqrt(p0 * (1 - p0)) / sqrt(n))
Z

### |Z| > kwantyl rozkładu qnorm(1 - alfa/2) zatem zawiera się w obszarze
### krytycznym, a co za tym idzie, odrzucamy H0








#######################
###### Hipotezy #######
#######################
###### ZADANIE 9 ######
#######################

Przeprowadzono badanie jakości jaj kurzych pochodzących z pewnej fermy. Zakłada się z góry, że 2%
jaj jest złej jakości. Wylosowano 1200 jaj do zbadania i wśród nich 16 okazało się złej jakości. Czy
obserwacje przeczą przyjętemu założeniu i potwierdzają, że frakcja ta w badanej fermie jest mniejsza?
Wnioskuj na poziomie istotności 0,05. W tym celu skonstruuj odpowiednią procedurę testującą.
Porównaj otrzymane wyniki z uzyskanymi po zastosowaniu testu dokładnego dostępnego w
pakiecie R.

### Hipoteza 
### H0: p >= 0.02
### H1: p < 0.02


p0 = 0.02
n = 1200
T = 16
p_hat = 16/1200
alfa = 0.05

binom.test(T, n, p = p0, alternative = "less", conf.level = 1 - alfa)

### p-value jest większe of alfa, więc nie ma podstaw do odrzucenia H0

qnorm(1 - alfa)

### dla "less" jest (-inf, -z1-a)

z = (p_hat - p0) / (sqrt(p0 * (1 - p0)) / sqrt(n))
z

### Statystyka testowa zawiera się w obszarze krytycznym, więc odrzucamy H0









#######################
###### Hipotezy #######
#######################
###### ZADANIE 10 #####
#######################

W sondażu przeprowadzonym przez pracownię badania opinii społecznych wśród 1100 dorosłych
Polaków, 1000 ankietowanych odpowiedziało, że w ubiegłym miesiącu nie przeczytało żadnej książki.
Pozostali twierdzili, że przeczytali przynajmniej jedną książkę. Na podstawie tych danych, na poziomie
0,05, stwierdzić, czy opinia, że procent Polaków, którzy nie przeczytali żadnej książki jest większy niż
90 jest uzasadniona?

n = 1100
T = 1000
alfa = 0.05
p0 = 0.9
p_hat = 1000/1100

### Hipoteza 
### H0: p <= 0.9
### H1: p > 0.9

binom.test(T, n, p = p0, alternative = "greater", conf.level = 1 - alfa)

### p-value jest większe od alfy, więc nie ma podstaw do odrzucenia H0



qnorm(1 - alfa/2)

### Dla "greater" obszar krytyczny to (z1-a, +inf)


z = (p_hat - p0)/(sqrt(p0 * (1 - p0)) / sqrt(n))
z

### Wynik jest poza obszarem krytycznym, więc mamy brak podstaw do odrzucenia H0









#######################
### Dwie Populacje ####
#######################
###### ZADANIE 1 ######
#######################

Badano zawartość procentową celulozy w drewnie pewnego gatunku pochodzącego z dwóch różnych
regionów Polski. Dla regionu I poddano analizie 8 próbek drewna natomiast dla regionu II przebadano
21 próbek drewna. Otrzymane wyniki zapisane zostały w pliku DwiePopulacje.csv. Przyjmując
normalność rozkładu zawartości celulozy w drewnie i poziom istotności 0,02:
(a) zweryfikuj hipotezę, że przeciętna zawartość celulozy dla regionu I różni się istotnie od przeciętnej
zawartości celulozy dla regionu II. Przyjmij jednorodność wariancji populacji i normalność rozkładu
badanej cechy;
(b) sprawdź, czy założenie o równości wariancji było słuszne;
(c) oceń metodą przedziałową, ze współczynnikiem ufności 0,98, różnicę średnich. Zinterpretuj wynik
i na jego podstawie podejmij decyzję dotyczącą hipotezy z punktu (a).

### a)

dane = read.csv("C:/Users/klemm/Desktop/SADkolos2/DwiePopulacje.csv", sep=";", dec = ".", head = TRUE)
cel1 = na.omit(dane$cel1)
cel1

dane = read.csv("C:/Users/klemm/Desktop/SADkolos2/DwiePopulacje.csv", sep=";", dec = ".", head = TRUE)
cel2 = na.omit(dane$cel2)
cel2

alfa = 0.02

### Hipoteza 
### H0: mu1 = mu2
### H1: mu1 != mu2

t.test(cel1, cel2, var.equal = TRUE, conf.level = 1 - alfa)

### p-value jest większe od alfy, brak podstaw do odrzucenia H0




### b)

### Hipoteza 
### H0: var1 = var2
### H1: var1 != var2

install.packages("PairedData")
library(PairedData)

var.test(cel1, cel2, conf.level = 1 - alfa)

### p-value większe od alfy, brak podstaw do odrzucenia H0



### c)

alfa = 0.02

t.test(cel1, cel2, var.equal = TRUE, conf.level = 1 - alfa)

### Nie mamy podstaw do odrzucenia H0, ponieważ różnica średnich zawiera się w przedziale


przedzial = function(dane1, dane2, alfa){
  diff = mean(dane1) - mean(dane2)
  
  n1 = length(dane1)
  n2 = length(dane2)
  
  s1 = var(dane1)
  s2 = var(dane2)
  
  sp = ((n1-1) * s1 + (n2-1) * s2 ) / (n1+n2-2)
  
  t = qt(1 - alfa/2, df = n1 + n2 - 2)
  
  L = diff - t*sqrt(sp * (1/n1 + 1/n2))
  P = diff + t*sqrt(sp * (1/n1 + 1/n2))
  return(c(L, P))
  
}

przedzial(cel1, cel2, alfa)
# (-13.51, 3.14)
# (-inf, -2.47) U (2.47, inf)
# Brak podstaw do odrzucenia H0, miesci sie w przedziale





#######################
### Dwie Populacje ####
#######################
###### ZADANIE 2 ######
#######################

W budownictwie mieszkaniowym założono, że czas budowy metodą tradycyjną jest dłuższy niż czas
budowy nową technologią. Wylosowano 10 obiektów wybudowanych metodą tradycyjną oraz 11 nową
metodą i otrzymane czasy budowy zapisano w pliku DwiePopulacje.csv. Przyjmując, że rozkład czasu
budowy zarówno metodą tradycyjną jak i nową jest normalny, zweryfikuj hipotezę, że średni czas
budowy metodą tradycyjną jest dłuższy od średniego czasu budowy nową metodą. Przyjmij poziom
istotności 0,1.

install.packages("PairedData")
library(PairedData)

dane = read.csv("C:/Users/klemm/Desktop/SADkolos2/DwiePopulacje.csv", sep=";", dec = ".", head = TRUE)
nowa = na.omit(dane$nowa)
nowa

dane = read.csv("C:/Users/klemm/Desktop/SADkolos2/DwiePopulacje.csv", sep=";", dec = ".", head = TRUE)
tradycyjna = na.omit(dane$tradycyjna)
tradycyjna


### Hipoteza 
### H0: mu1 <= mu2
### H1: mu1 > mu2

alfa = 0.1

var.test(tradycyjna, nowa, conf.level = 1 - alfa)
### p-value większe od alfy, brak podstaw do odrzucenia H0

t.test(tradycyjna, nowa, var.equal = FALSE, alternative = "greater", conf.level = 1 - alfa)
### p-value większe od alfy, brak podstaw do odrzucenia H0








#######################
### Dwie Populacje ####
#######################
###### ZADANIE 3 ######
#######################

Bank chce sprawdzić, która metoda pozyskiwania pieniędzy (ze źródeł publicznych czy prywatnych)
prowadzi do pozyskania większego funduszu. W tym celu bank pobrał losową próbę 11 firm, które
zaciągnęły kredyt tylko ze źródeł publicznych oraz próbę 16 firm, które zaciągnęły kredyt tylko ze
źródeł prywatnych. Otrzymane wyniki zapisano w pliku DwiePopulacje.csv. Zakładając, że wysokość
kredytów prywatnych i publicznych ma rozkład normalny czy można stwierdzić, że publiczne źródła
finansowania udzielają, przeciętnie rzecz biorąc, mniejszych kredytów? Wnioskuj na poziomie
istotności 0,1.

dane = read.csv("C:/Users/klemm/Desktop/SADkolos2/DwiePopulacje.csv", sep=";", dec = ".", head = TRUE)
publiczny = na.omit(dane$publiczny)
publiczny

dane = read.csv("C:/Users/klemm/Desktop/SADkolos2/DwiePopulacje.csv", sep=";", dec = ".", head = TRUE)
prywatny = na.omit(dane$prywatny)
prywatny


### Hipoteza 
### H0: mu1 >= mu2 
### H1: mu1 < mu2 

alfa = 0.1
var.test(publiczny, prywatny, conf.level = 1 - alfa)
### p-value jest mniejsze niż alfa, więc odrzucamy H0

t.test(publiczny, prywatny, var.equal = FALSE, alternative = "less", conf.level = 1 - alfa)
### p-value jest mniejsze niż alfa, więc odrzucamy H0

### Na poziomie istotności 0.1 dane wskazują na poprawność hipotezy drugiej,
### która zakłada, że źródla publiczne skutkują pozyskaniem mniejszego funduszu,
### niż źródła prywatne 









#######################
### Dwie Populacje ####
#######################
###### ZADANIE 4 ######
#######################

Dla porównania regularności uzyskiwanych wyników sportowych dwóch zawodników w pewnym
okresie, wylosowano 12 wyników pierwszego zawodnika i 9 drugiego. Otrzymano następujące rezultaty
(w m):
Na poziomie istotności 0,05 zweryfikuj hipotezę o większej regularności wyników pierwszego
zawodnika

dane = read.csv("C:/Users/klemm/Desktop/SADkolos2/DwiePopulacje.csv", sep=";", dec = ".", head = TRUE)
zawodnik1 = na.omit(dane$zawodnik1)
zawodnik1

dane = read.csv("C:/Users/klemm/Desktop/SADkolos2/DwiePopulacje.csv", sep=";", dec = ".", head = TRUE)
zawodnik2 = na.omit(dane$zawodnik2)
zawodnik2

alfa = 0.05

### Hipoteza 
### H0: var1 >= var2 
### H1: var1 < var2 

var.test(zawodnik1, zawodnik2, alternative = "less", conf.level = 1 - alfa)
### Brak podstaw do odrzucenia H0









#######################
### Dwie Populacje ####
#######################
###### ZADANIE 5 ######
#######################

Testowano działanie dwóch leków przeciwbólowych, przy czym spodziewano się, że pierwszy lek
będzie działał dłużej. Podano 10 losowym pacjentom lek L1, a innej losowej grupie 15 pacjentów
skarżących się również na bóle, lek L2. Otrzymane czasy działania (w godzinach) zapisano w pliku
DwiePopulacje.csv. Czy można twierdzić, że średni czas działania leku L1 jest istotnie dłuższy niż dla
leku L2? Testuj na poziomie istotności 10%.

dane = read.csv("C:/Users/klemm/Desktop/SADkolos2/DwiePopulacje.csv", sep=";", dec = ".", head = TRUE)
L1 = na.omit(dane$L1)
L1

dane = read.csv("C:/Users/klemm/Desktop/SADkolos2/DwiePopulacje.csv", sep=";", dec = ".", head = TRUE)
L2 = na.omit(dane$L2)
L2

### Hipoteza 
### H0: var1 <= var2 
### H1: var1 > var2 

alfa = 0.1

var.test(L1, L2, alternative = "greater", conf.level = 1 - alfa)
### Brak podstaw do odrzucenia H0

t.test(L1, L2, var.equal = FALSE, alternative = "greater", conf.level = 1 - alfa)
### Odrzucamy H0, ponieważ p-value > alfa












#######################
### Dwie Populacje ####
#######################
###### ZADANIE 6 ######
#######################

W oparciu o badania przeprowadzone w Polsce i USA, dotyczące zadowolenia z pracy, uzyskano
wyniki: spośród 1200 badanych Polaków 78% potwierdziło zadowolenie z pracy, natomiast spośród
2000 Amerykanów 20% było niezadowolonych.
(a) Porównaj za pomocą 90% przedziału ufności procent zadowolonych Polaków i Amerykanów.
Napisz swoją własną funkcję, a następnie porównaj wyniki z otrzymanymi po zastosowaniu
funkcji R.
(b) Czy opinia, że proporcja zadowolonych Polaków jest mniejsza niż zadowolonych Amerykanów jest
słuszna? Testuj na poziomie istotności 0,1.
(c) Socjolodzy twierdzili, że procent Polaków zadowolonych z pracy jest większy niż 75. Czy próba
potwierdza to przypuszczenie? Wnioskuj na poziomie istotności 0,1. 

### a)

### 1 - polacy
### 2 - amerykanie

p1 = 0.78
p2 = 0.8

n1 = 1200
n2 = 2000

T1 = 1200 * 0.78
T2 = 2000 * 0.8

alfa = 0.1

przedzial = function(n1, n2, p1, p2, alfa){
  q = qnorm(1 - alfa/2)
  dif = p1 - p2
  se_dif = sqrt((p1*(1 -p1) / n1) + (p2 * (1 - p2) / n2))
  Lewa_granica = dif - q * se_dif
  Prawa_granica = dif + q * se_dif
  return(c(Lewa_granica, Prawa_granica))
  
}

przedzial(n1, n2, p1, p2, alfa)

prop.test(c(T1, T2), c(n1, n2), conf.level = 1 - alfa)


### Na poziomie ufności 90% (-4.45, 0.46) pokrywa nieznaną
### prawdziwą różnicę proporcji zadowolonych Polaków i Amerykanów z pracy




### b)

### H0: p1 - p2 >= 0 
### H1: p1 - p2 < 0

prop.test(c(T1, T2), c(n1, n2), alternative = "less", conf.level = 1 - alfa)

### p-value jest mniejsze od alfy, więc odrzucamy H0, więc 
### na poziomie istotności alfa = 0.1, dane potwierdzają
### hipotezę, że zadowolenie Polaków jest mniejsze niż Amerykanów





### c)

### H0: p1 <= 75
### H1: p1 > 75


prop.test(c(T1), c(n1), p = 0.75, alternative = "greater", conf.level = 1 - alfa)
### p-value jest mniejsze od alfy, więc odrzucamy H0

### Drugi sposób
binom.test(T1, n1, p = 0.75, alternative = "greater", conf.level = 1 - alfa)











#######################
### Dwie Populacje ####
#######################
###### ZADANIE 7 ######
#######################

Badano czy częstość występowania malarii zależy od regionu. Przypadki występowania malarii w
tropikalnych regionach były następujące: w Azji zanotowano 313 przypadków malarii typu A i 28
przypadków malarii typu B; w Afryce zanotowano 145 przypadków malarii typu A i 56 typu B.

(a) Czy częstość występowania malarii typu A zależy od regionu? Przyjmij poziom istotności 0,05.
(b) Oceń metodą przedziałową, przyjmując współczynnik ufności 0,95, różnicę badanych częstości
występowania malarii typu A.

Azja_A = 313
Azja_B = 28

Afryka_A = 145
Afryka_B = 56

n1 = Azja_A + Azja_B
n2 = Afryka_A + Afryka_B

p1_A = Azja_A / n1
p1_B = Azja_B / n1

p2_A = Afryka_A / n2
p2_B = Afryka_B / n2

### a)

### H0: p1_A = p2_A
### H1: p1_A != p2_A

alfa = 0.05

### Metoda 1
phat = (Azja_A + Afryka_A) / (n1 + n2)

Z = (p1_A - p2_A) / (sqrt(phat * (1 - phat) * (1/n1 + 1/n2)))
q = qnorm(1 - alfa/2)
### dla "two.sided" obszar (-inf, -z1-alfa/2) U (z1-alfa/2, +inf)


### Metoda 2
prop.test(c(Azja_A, Afryka_A), c(n1, n2), alternative = "two.sided", conf.level = 1 - alfa)

### p-value wyszło mniejsze niż alfa, więc odrzucamy H0
### Na poziomie istotności alfa = 0.05, dane potwierdzają hipotezę, że 
### częstość malarii typu A zależy od regionu




### b)

przedzial = function(p1_A, p2_A, n1, n2, alfa){
  p_dif = p1_A - p2_A
  z = sqrt((p1_A * (1 - p1_A) / n1) + p2_A * (1 - p2_A) / n2)
  q = qnorm(1 - alfa/2)
  L = p_dif - q * z
  P = p_dif + q * z
  return(c(L, P))
  
}

przedzial(p1_A, p2_A, n1, n2, alfa)
### (12.8%, 26.5%)

prop.test(c(Azja_A, Afryka_A), c(n1, n2), conf.level = 1 - alfa)$conf.int
### (12.4%, 26.9%)










#######################
### Dwie Populacje ####
#######################
###### ZADANIE 8 ######
#######################


### DOKŁADNIE KURWA TO SAMO
Doświadczenie ma określić efekt temperatury na przeżywalność jajeczek owadów. W temperaturze
11°C przeżyły do następnego etapu rozwoju 73 z 105 jajeczek. W temperaturze 30°C przetrwały102 z
110 jajeczek. 

(a) Czy wyniki doświadczenia potwierdzają przypuszczenie, że proporcja przeżywalności zależy od
temperatury? Przyjmij poziom istotności 0,05.
(b) Oceń metodą przedziałową różnicę proporcji przeżywalności w badanych temperaturach. Przyjmij
współczynnik ufności 0,95.







#######################
### Dwie Populacje ####
#######################
###### ZADANIE 9 ######
#######################

Lekarz podejrzewa, że dany rodzaj leku zmienia wartości określonego parametru biochemicznego. I tak,
u 9 pacjentów zmierzono poziom tego parametru przed i po podaniu leku:
Zakładając poziom istotności 5%, zweryfikuj podejrzenia lekarza. Załóż normalność poziomu
parametru biochemicznego. 


n = 9

przed = c(15, 4, 9, 9, 10, 10, 12, 17, 14)
po = c(14, 4, 10, 8, 10, 9, 10, 15, 14)

alfa = 0.05
d = przed - po

### H0: mu = 0
### H1: mu != 0

t.test(d, conf.level = 0.05)

### p-value jest większe od alfy, zatem nie ma podstaw do odrzucenia H0
### Dane potwierdzają hipotezę, że lek zmienia wartość określonego parametru
### biochemicznego









#######################
### Dwie Populacje ####
#######################
###### ZADANIE 10 #####
#######################

Zmierzono pH wody w 8 jeziorach na dwóch różnych głębokościach (15 cm i 100 cm). Wyniki
przedstawiono w poniższej tabeli:
(a) Czy pH wody zależy od głębokości? Załóż 10% istotności i normalności rozkładu pH
(b) Sprawdź (a) używając 90% przedziału ufności. 

n = 8

Deep = c(1,2,3,4,5,6,7,8)
Deep_15 = c(6.55, 5.98, 5.59, 6.17, 5.92, 6.18, 6.43, 5.68)
Deep_100 = c(6.78, 6.14, 5.80, 5.91, 6.10, 6.01, 8.18, 5.88)

d = Deep_15 - Deep_100



### a)

### H0: Deep_15 = Deep_100
### H1: Deep_15 != Deep_100

alfa = 0.1

t.test(d, alternative = "two.sided", conf.level = 0.1)

### p-value wyszło większe od alfy, zatem nie ma podstaw do odrzucenia H0
### Dane potwierdzają, że pH nie zależy od głębokości wody



### b)

alfa = 0.1

odchylenie = sd(d)
srednia = mean(d)
n = length(d)

przedzial = function(odchylenie, srednia, n, alfa){
  t = qt(1-alfa/2, df = n-1)
  x = t * odchylenie / sqrt(n)
  
  L = srednia - x
  P = srednia + x
  
  return(c(L, P))
  
}


przedzial(odchylenie, srednia, n, alfa)

### (-70.3%, 12.8%)












#######################
######## ANOVA ########
#######################
###### ZADANIE 1 ######
#######################

Inżynier chemiczny chce sprawdzić, czy różne warunki ciśnieniowe mają wpływ na średnią produkcję
pewnego wyrobu z danego typu surowca. Poniższa tabela zawiera wyniki przeprowadzonego
eksperymentu (w g/l):

Czy ciśnienie ma wpływ na wielkość produkcji? Wykorzystaj funkcję pakietu R o nazwie anova.
Wnioskuj na poziomie istotności 0,05. Analizę wariancji poprzedź testem równości wariancji, np. z
wykorzystaniem funkcji bartlett.test.


cisnienie = read.csv("C:/Users/klemm/Desktop/SADkolos2/Anova_cisnienie.csv", sep = ";")

### H0: sig_1^2 = sig_2^2 = sig_3^2 = sig_4^2
### H1: !H0

### H0: wariancje są jednorodne
### H1: !H0

alfa = 0.05

obiekty = rep(names(cisnienie), each = length(cisnienie$Niskie))

wyniki = c(na.omit(cisnienie$Niskie),
           na.omit(cisnienie$Srednie),
           na.omit(cisnienie$Silne),
           na.omit(cisnienie$BardzoSilne))

cisnienieTest = data.frame(obiekty, wyniki)


bartlett.test(wyniki~obiekty, cisnienieTest)

### p-value jest większe od alfy, zatem nie ma podstaw do odrzucenia H0 
### Na poziomie istotności 5% dane potwierdzają hipotezę, że wariancje są jednorodne


model = lm(wyniki~obiekty)
anova(model)

### p-value jest większe od alfy, zatem mamy brak podstaw do odrzucenia H0
### Na poziomie istotności 5% dane potwierdzają hipotezę, że ciśnienie
### nie ma istotnego wpływu na średnią produkcją wyrobu










#######################
######## ANOVA ########
#######################
###### ZADANIE 2 ######
#######################

W doświadczeniu badano zawartość popiołu (części niepalnych) dla ekogroszku wyprodukowanego na
bazie węgla wysokogatunkowego pochodzącego z pięciu różnych kopalni. Otrzymano następujące
wyniki: 
Czy średnie zawartości popiołu dla ekogroszku produkowanego w pięciu kopalniach można uznać za
jednakowe? Wykonaj analizę wariancji na poziomie istotności 0,01.



kopalnie = read.csv("C:/Users/klemm/Desktop/SADkolos2/Anova_kopalnie.csv", sep = ";", dec = ",", head = TRUE)

obiekty = rep(names(kopalnie), each = length(kopalnie$K1))

wyniki = c(na.omit(kopalnie$K1),
           na.omit(kopalnie$K2),
           na.omit(kopalnie$K3),
           na.omit(kopalnie$K4),
           na.omit(kopalnie$K5))


kopalnieTest = data.frame(obiekty, wyniki)

### H0: sig_1^2 = sig_2^2 = sig_3^2 = sig_4^2 = sig_5^2
### H1: !H0

### H0: wariancje są jednorodne
### H1: !H0


alfa = 0.01

bartlett.test(wyniki~obiekty)
### p-value jest większe od alfy, zatem nie ma podstaw do odrzucenia H0
### Dane potwierdzają hipotezę, że wariancje są jednorodne

model = lm(wyniki~obiekty)
anova(model)

### p-value jest większe od alfy, zatem nie ma podstaw do odrzucenia H0
### Dane potwierdzają hipotezę, że w ekogroszku produkowanego w każdej
### z pięciu kopalnii jest taka sama średnia zawartość popiołu










#######################
######## ANOVA ########
#######################
###### ZADANIE 3 ######
#######################

Każdym z trzech mikrometrów zmierzono kilkukrotnie ten sam przedmiot i uzyskano wyniki:
Zakładając, że błędy pomiarów mają rozkłady normalne o takiej samej wariancji, na poziomie istotności
0,05 zweryfikuj hipotezę, że wybór mikrometru ma wpływ na uzyskane wyniki.


mikrometr = read.csv("C:/Users/klemm/Desktop/SADkolos2/Anova_mikrometr.csv", sep = ";", dec = ",", head = TRUE)

obiekty = rep(names(mikrometr), c(length(na.omit(mikrometr$mikrometrI)), length(na.omit(mikrometr$mikrometrII)), length(na.omit(mikrometr$mikrometrIII))))

wyniki = c(na.omit(mikrometr$mikrometrI),
           na.omit(mikrometr$mikrometrII),
           na.omit(mikrometr$mikrometrIII))

mikrometrTest = data.frame(obiekty, wyniki)

### Jeżeli zakładamy, że błędy pomiarów mają rozkłady normalne o takiej samej wariancji,
### nie trzeba wówczas robić testu bartletta

### H0: mu1 = mu2 = mu3
### H1: !H0

alfa = 0.05

anova(lm(wyniki~obiekty))

### p-value jest większe od alfy, zatem nie ma podstaw do odrzucenia H0
### Dane potwierdzają hipotezę, że wybór mikrometru nie ma wpływu na uzyskane wyniki













#######################
######## ANOVA ########
#######################
###### ZADANIE 4 ######
#######################

Populacja sportowców została ostrzeżona, że palenie papierosów opóźnia rozwój. Jedną z miar wpływu
palenia na rozwój jest badanie rytmu zatokowego serca. Przeprowadzono eksperyment, w którym
zbadano rytm zatokowy serca u 24 sportowców po zadanym wysiłku fizycznym i 5-min. Otrzymano
wyniki:

(a) Zakładając, że rytm serca u każdego rodzaju palaczy ma rozkład normalny, na poziomie istotności
0,01, sprawdź czy palenie papierosów może wpływać na rytm zatokowy serca.
(b) Zastosuj test uczciwych istotnych różnic (honest significant differences) Tukey’a do wyznaczenia
grup jednorodnych porównywanych średnich obiektowych.


sportowcy = read.csv("C:/Users/klemm/Desktop/SADkolos2/Anova_sportowcy.csv", sep = ";", head = TRUE)

obiekty = rep(names(sportowcy), each = length(na.omit(sportowcy$Niepalacy)))
wyniki = c(na.omit(sportowcy$Niepalacy),
           na.omit(sportowcy$Lekkopalacy),
           na.omit(sportowcy$Sredniopalacy),
           na.omit(sportowcy$Duzopalacy))

sportowcyTest = data.frame(obiekty, wyniki)

### a)

### H0: sig_1^2 = sig_2^2 = sig_3^2 = sig_4^2
### H1: !H0

### H0: wariancje są jednorodne
### H1: !H0

alfa = 0.01 

bartlett.test(wyniki~obiekty, sportowcyTest)

### p-value > alfa => brak podstaw do odrzucenia H0 => wariancje są jednorodne

### H0: mu1 = mu2 = mu3 = mu4
### H1 = !H0

anova(lm(wyniki~obiekty))

### p-value = 0.004 < alfa => odrzucamy H0
### Na poziomie istotności 1% dane potwierdzają hipotezę, że
### palenie nie ma wpływu na rytm zatokowy serca





### b)

plot(TukeyHSD(aov(wyniki~obiekty)))

### Patrzymy na p adj i sprawdzamy czy jest większe od alfy
### Jeżeli jest większe od alfy, oznacza to, że obiekty
### nie różnią się od siebie istotnie (bierzemy pod uwagę)

### Grupy jednorodne 
### L-D, N-D, S-D, S-N => N-S-D, L-D
### Narysuj se graf
















#######################
######## ANOVA ########
#######################
###### ZADANIE 5 ######
#######################

Badano masę tarczycy chomików w zależności od ich poziomu homozygotyczności (inbredu),
wyróżniając cztery grupy (I - osobniki niezinbredowane, II - osobniki o poziomie inbredu z przedziału
<0,01 - 0,10>, III - osobniki o poziomie inbredu z przedziału <0,11 - 0,20>, IV - osobniki o poziomie
inbredu od 0,21). Uzyskano następujące wyniki:

(a) Sprawdź (przyjmując poziom istotności 0,05) czy słuszne jest przypuszczenie, że masa gruczołu
tarczycowego zależy od poziomu inbredu.
(b) Zastosuj test HSD Tukey’a do wyznaczenia grup jednorodnych porównywanych średnich
obiektowych.


chomiki = read.csv("C:/Users/klemm/Desktop/SADkolos2/Anova_chomiki.csv", sep = ";", dec = ",")

obiekty = rep(names(chomiki), c(length(na.omit(chomiki$I)),
              (length(na.omit(chomiki$II))),
              (length(na.omit(chomiki$III))),
              (length(na.omit(chomiki$IV)))))


wyniki = c(na.omit(chomiki$I),
           na.omit(chomiki$II),
           na.omit(chomiki$III),
           na.omit(chomiki$IV))


chomikiTest = data.frame(obiekty, wyniki)


### a)

### H0: mu1 = mu2
### H1: !H0

alfa = 0.05

bartlett.test(wyniki~obiekty, chomikiTest)
### p-value jest większe od alfy => nie ma podstaw do odrzucenia H0
### Zakładamy jednorodność wariancji


anova(lm(wyniki~obiekty))
### p-value jest mniejsze od alfy => odrzucamy H0
### Na poziomie istotności 5% dane potwierdzają hipotezę, że masa gruczołu
### tarczycowego zależy od poziomu inbredu




### b)

TukeyHSD(aov(wyniki~obiekty))

### Grupy jednorodne: II-I, III-I, III-II, IV-II, IV-III
### Dzielimy na dwie podgrupy: 
### II-I, III-I, III-II => I-II-III
### IV-III, IV-II, III-II => II-III-IV












#######################
######## ANOVA ########
#######################
###### ZADANIE 6 ######
#######################

Student inżynierii przemysłowej pomógł zespołowi badawczemu ocenić różne strategie lokalizacji
pułapek zapachowych na ćmy cygańskie. Uzyskano następujące dane (w %):
Zmienną odpowiedzi jest szacunkowy odsetek uwięzionej rodzimej populacji płci męskiej. 

(a) Czy strategia lokalizacji może mieć wpływ na liczbę uwięzionych ciem cygańskich? Przyjmij
poziom istotności 0,05 i normalność proporcji uwięzionych ciem cygańskich. Zweryfikuj założenie
dotyczące jednorodności wariancji przed wykonaniem ANOVA
(b) Zastosuj test HSD Tukey’a do wyznaczenia grup jednorodnych porównywanych średnich
obiektowych.

pulapki = read.csv("C:/Users/klemm/Desktop/SADkolos2/Anova_pulapki.csv", sep = ";")


obiekty = rep(names(pulapki), each = length(na.omit(pulapki$rozsiany)))


wyniki = c(na.omit(pulapki$rozsiany),
           na.omit(pulapki$skoncentrowany),
           na.omit(pulapki$roslina.zywicielka),
           na.omit(pulapki$powietrzny),
           na.omit(pulapki$gruntowy))


pulapkiTest = data.frame(obiekty, wyniki)


### a)

### H0: sig_1^2 = sig_2^2 = sig_3^2 = sig_4^2 = sig_5^2
### H1: !HO

alfa = 0.05

bartlett.test(wyniki~obiekty, pulapkiTest)

### Wariancje są jednorodne (p-value > alfa)


### H0: mu1 = mu2
### H1: !H0

anova(lm(wyniki~obiekty))

### Odrzucamy H0 (p-value < alfa)




### b)

TukeyHSD(aov(wyniki~obiekty))

### Grupy jednorodne: r-g, rz-p, s-p, s-rz => s-rz-p, r-g















#######################
###### Regresja #######
#######################
###### ZADANIE 1 ######
#######################

Poniższa tabela przedstawia wyniki eksperymentu, w którym inżynier chce wyznaczyć relację miedzy końcową
wielkością produkcji środków chemicznych Y (w kg) w zależności od ilości zużytego surowca X (w litrach):
(a) Narysuj wykres punktowy przedstawiający zależność wielkości produkcji od ilości zużytego surowca
(scatter plot).
(b) Wyznacz i zinterpretuj kowariancję próbkową między ilością zużytego surowca a wielkością produkcji.
(c) Wyznacz i zinterpretuj współczynnik korelacji.
(d) Wyznacz ocenę prostej regresji między wielkością produkcji a ilością zużytego surowca. 
(e) Dodaj do wykresu punktowego prostą regresji.
(f) W jaki sposób zmieni się wielkość produkcji, jeśli ilość surowca wzrośnie o 1 litr?
(g) Jaka będzie wielkość produkcji, jeśli zużyjemy do produkcji 20 litrów surowca?
(h) Jaka będzie wielkość produkcji, jeśli zużyjemy do produkcji 15 litrów surowca?
(i) Oceń dopasowanie prostej regresji do danych.
(j) Zweryfikuj test o istotności regresji. Przyjmij poziom istotności 5%. Zinterpretuj wynik.


dane = read.csv("C:/Users/klemm/Desktop/SADkolos2/Reg_chemikalia.csv", sep=";", head=TRUE)

X = dane$surowiec
Y = dane$produkt

### a)
plot(X, Y, main = "Zależność wielkości produkcji od ilości zużytego surowca", 
     xlab = "Ilość zużytego surowca (X)",
     ylab = "Wielkość produkcji (Y)", pch = 19)



### b)
cov(X, Y) # 138.4889
# Kowariancja jest różna od 0, zatem istnieje liniowa zależność
# między ilością zużytego surowca, a końcową wielkością
# produkcji środków chemicznych

# Ponieważ kowariancja jest dodatnia, zatem wraz ze 
# wzrostem ilości zużytego surowca wzrasta końcowa
# wielkość produkcji środków chemicznych


### c)
cor(X, Y) # 0.895
# Współczynnik korelacji r jest w wartości bezwzględnej 
# większy lub równy 0,8, zatem istnieje bardzo silny związek
# liniowy między ilością zużytego surowca, a
# końcową wielkością produkcji środków chemicznych

# KOWARIANCJA TO KIERUNEK ZALEŻNOŚCI, A KORELACJA TO JEJ SIŁA



### d)

# Równanie regresji prostej liniowej 
# Y = b0 + b1x

lm(Y~X) 
# Y = 22.4 + 3.62x




### e) 
abline(lm(Y~X), col = "red")



### f)

# Jeśli ilość surowca wzrośnie o 1 litr,
# wówczas końcowa wielkość produkcji środków
# chemicznych wzrośnie o 3,619kg

# Jest to interpretacja współczynnika regresji liniowej




### g) oraz h)
predict(lm(Y~X), data.frame(X = c(20, 15)))

# Jeśli zużyjemy 20 litrów surowca, końcowa produkcja wyniesie 94,79kg
# Jeśli zużyjemy 15 litrów surowca, końcowa produkcja wyniesie 76,69kg



### i)
summary(lm(Y~X))$r.squared
# Ocena dopasowania regresji: ~0.80
# Prosta regresji liniowej jest dobrze dopasowana do danych

# Końcowa wielkość produkcji środków chemicznych 
# jest wyjaśniona w ok. 80% przez ilość zużytego surowca



### j)

### H0: b1 = 0 => regresja liniowa jest nieistotna
### H1: b1 != 0 => regresja liniowa jest istotna

anova(lm(Y~X))

alfa = 0.05

# p-value < alfa => odrzucamy H0
# Na poziomie istotności 0.05 dane potwierdzają hipotezę,
# że regresja liniowa jest istotna












#######################
###### Regresja #######
#######################
###### ZADANIE 2 ######
#######################

Żywotność pewnego urządzenia (w miesiącach) zależy od liczby wyprodukowanych przez to urządzenie
elementów (efektywność urządzenia). Dla próby 9 urządzeń tego samego typu otrzymano następujące wyniki:
(a) Narysuj wykres punktowy przedstawiający zależność żywotności od efektywności (scatter plot).
(b) Oblicz i zinterpretuj kowariancję między żywotnością i efektywnością.
(c) Oblicz i zinterpretuj współczynnik korelacji.
(d) Wyznacz ocenę prostej regresji żywotności urządzenia od jego efektywności.
(e) Jak zmieni się żywotność urządzenia jeśli efektywność wzrośnie o 1 element?
(f) Oszacuj żywotność urządzenia przy efektywności 11 elementów
(g) Oszacuj żywotność urządzenia przy efektywności 19 elementów
(h) Oceń dopasowanie prostej regresji.
(i) Zweryfikuj test istotności regresji. Przyjmij poziom istotności 1%. Zinterpretuj otrzymany wynik.

dane = read.csv("C:/Users/klemm/Desktop/SADkolos2/Reg_urzadzenie.csv", sep=";", head=TRUE)


X = dane$efektywnosc
Y = dane$zywotnosc

### a)
plot(X, Y, main = "Zależność żywotności urządzenia od liczby wyprodukowanych elementów przez urządzenie",
     xlab = "Liczba wyprodukowanych elementów (X)", 
     ylab = "Żywotność urządzenia w miesiącach (Y)", pch = 19)



### b)

cov(X, Y) 
# Kowariancja różna od zera, więc istnieje zależność lioniowa
# Kowariancja ujemna, wraz ze spadkiem efektywności, rośnie żywotność



### c)
cor(X, Y)
# Wartość bezwględna większa od 0.8, zatem
# istnieje bardzo silny związek liniowy



### d)
model = lm(Y~X) # Y = 18.8823 - 0.8629x
abline(model, col = "red")




### e)

# Zmaleje o 0.8629kg
# Zgodnie ze wzorem prostej regresji liniowej




### f) oraz g)
predict(model, data.frame(X = c(11, 19)))

# Przy efektywności 11 elementów: 9.39
# Przy efektywności 19 elementów: 2.49




### h)
summary(model)$r.squared

# 82.7% - prosta regresji liniowej jest dobrze dopasowana




### i)

### H0: b1 = 0 (regresja nieistotna)
### H1: b1 != 0 (regresja istotna)

alfa = 0.01
anova(model)

# p-value < alfa => odrzucamy H0
# Dane potwierdzają hipotezę H1
# Regresja jest istotna















#######################
###### Regresja #######
#######################
###### ZADANIE 3 ######
#######################

Przeprowadzono proces usuwania arszeniku z wód gruntowych. Poniższa tabela przedstawia procentowe ilości
usuniętego przez proces arszeniku w zależności od zakwaszenia (pH) gleby: 
(a) Narysuj diagram punktowy ilości usuniętego arszeniku w zależności od zakwaszenia gleby
(b) Oblicz i zinterpretuj kowariancję i współczynnik korelacji między zakwaszeniem gleby a ilością
usuniętego arszeniku.
(c) Wyznacz prostą regresji zależności ilości usuniętego arszeniku i zakwaszenia gleby. 
(d) W jaki sposób zmieni się ilość usuniętego przez proces arszeniku jeśli pH gleby wzrośnie o 1?
(e) Ile arszeniku zostanie usunięte, jeśli pH gleby wyniesie 7,5?
(f) Ile arszeniku zostanie usunięte, jeśli pH gleby wyniesie 9?
(g) Jak dobra jest ocena liniowa regresji? 
(h) Zweryfikuj test istotności regresji. Przyjmij poziom istotności 1%

dane = read.csv("C:/Users/klemm/Desktop/SADkolos2/Reg_arszenik.csv", sep=";", dec = ",")

X = dane$pH
Y = dane$arszenik

model = lm(Y~X)


### a)
plot(X, Y, main = "Zależność usuniętego arszeniku od zakwaszenia gleby")



### b)
cov(X, Y) # -18.32 => różna od zera, istnieje zależność liniowa
cor(X, Y) # -0.95 => istnieje silna zależność



### c)
model # Y = 190.27 - 18.03x
abline(model, col = "red")



### d)
# Zmaleje o 18.03%




### e) oraz f)
predict(model, data.frame(X = c(7.5, 9)))

# pH = 7.5 => 55
# pH = 9 => 28




### g)
summary(model)$r.squared

#90.34%



### h)

### H0: b1 = 0
### H1: b1 != 0


alfa = 0.01
anova(model)

# p-value < alfa => odrzucamy H0

# Na poziomie istotności 0.01 dane potwierdzają 
# hipotezę, że regresja liniowa jest istotna















#######################
##### Chi-kwadrat #####
#######################
###### ZADANIE 1 ######
#######################

Stowarzyszenie Russela Reynolda przeprowadziło ankietę wśród emerytowanych menedżerów wyższego
szczebla, którzy wrócili do pracy. Ustalili, że po powrocie do pracy 38% było zatrudnionych w innej
organizacji, 32% samozatrudnionych, 23% było freelancerami lub konsultantami, a 7% założyło własne firmy.
Aby sprawdzić, czy te wartości procentowe są zgodne z odsetkami mieszkańców hrabstwa Allegheny, lokalny
badacz przeprowadził ankietę wśród 300 emerytowanych menedżerów, którzy wrócili do pracy, i odkrył, że
122 pracowało dla innej firmy, 85 prowadziło działalność na własny rachunek, 76 pracowało jako freelancer
lub doradzało, a 17 założyło własne firmy. Czy przy istotności 10% dane potwierdzają, że odsetki
poszczególnych zatrudnionych w hrabstwie Allegheny różnią się od ich odpowiedników w skali całego kraju?

### H0: Proporcje zatrudnionych są takie same jak w całym kraju
### H1: Proporcje zatrudnionych różnią się

alfa = 0.1

kraj = c(0.38, 0.32, 0.23, 0.07)
allegheny = c(122, 85, 76, 17)

chisq.test(allegheny, p = kraj)
# x-squared = 3.29
# p-value = 0.34 > alfa => brak podstaw do odrzucenia H0












#######################
##### Chi-kwadrat #####
#######################
###### ZADANIE 2 ######
#######################

Badacz przeczytał w artykule, że liczba zgonów związanych z bronią palną wśród osób w wieku od 1 do 18 lat
rozkładała się następująco: 74% to wypadki, 16% to zabójstwa, a 10% to samobójstwa. W jej okręgu w
ubiegłym roku doszło do 68 wypadków śmiertelnych, 27 zabójstw i 5 samobójstw. Czy na poziomie istotności
10% dane potwierdzają, że odsetki poszczególnych zgonów różnią się od przedstawionych w artykule?

### H0: Odsetki zgonów są takie same jak w artykule
### H1: Odsetki zgonów różnią się

alfa = 0.1

artykul = c(0.74, 0.16, 0.10)
okreg = c(68, 27, 5)

chisq.test(okreg, p = artykul)
# x-squared = 10.549
# p-value < alfa => odrzucamy H0












#######################
##### Chi-kwadrat #####
#######################
###### ZADANIE 3 ######
#######################

M&M/Mars, producent cukierków Skittles, twierdzi, że mieszanka smakowa wynosi 20% dla każdego smaku.
Skittles to połączenie cukierków o smaku cytrynowym, limonkowym, pomarańczowym, truskawkowym i
winogronowym. Poniższe dane przedstawiają wyniki czterech losowo wybranych torebek Skittles i ich
mieszanek smakowych.
Wykonaj test, aby porównać zaobserwowane (całkowite) wartości z wartościami oczekiwanymi. Załóżmy
poziom istotności 0,05.


### H0: Rozkład wynosi 20%
### H1: !H0

# Smaki: cytrynowy, limonkowy, pomarańczowy, truskawkowy, winogronowy

alfa = 0.05

smaki = c(43, 50, 44, 44, 52)
test = c(0.2, 0.2, 0.2, 0.2, 0.2)

chisq.test(smaki, p = test)
# x-squared = 1.44
# p-value > alfa => brak podstaw do odrzucenia H0














#######################
##### Chi-kwadrat #####
#######################
###### ZADANIE 4 ######
#######################

Poniższe przykładowe dane przedstawiają stężenie ozonu (mierzone w częściach na 100 milionów) w
powietrzu w centrum miasta przez 78 kolejnych letnich dni w 2004 roku:


install.packages("nortest")
library("nortest")

ozon = read.csv("C:/Users/klemm/Desktop/SADkolos2/normalnosc_ozon.csv", sep=";", dec = ",", head = TRUE)$ozon

### H0: Stężenie ozonu ma rozkład normalny
### H1: Stężenie ozonu nie ma rozkładu normalnego

alfa = 0.05

pearson.test(ozon, adjust = FALSE)$p.value
# p-value = 0.26 > alfa => brak podstaw do odrzucenia H0
# Nie stostuje korekty liczby swobody

pearson.test(ozon, adjust = TRUE)$p.value
# p-value = 0.14 > alfa => brak podstaw do odrzucenia H0
# Stosuje korekte liczby swobody

lillie.test(ozon)$p.value
# p-value = 0.27 > alfa => brak podstaw do odrzucenia H0

shapiro.test(ozon)$p.value
# p-value = 0.10 > alfa => brak podstaw do odrzucenia H0


# Na poziomie istotności alfa = 0.05 dane potwierdzają hipotezę, że
# stężenie ozonu nie ma rozkładu normalnego




#######################################################
############ ZADANIE 4 SZEREG ROZDZIELCZY #############
#######################################################

br = c(0, 2, 4, 6, 8, 10, 12)
k = length(br) - 1
series = cut(ozon, br)
y = table(series)

m = mean(ozon)
s = sd(ozon)
n = length(ozon)

hist(ozon, br, freq = F)
curve(dnorm(x, m, s), xlim = c(br[1], br[k+1]), col = "3", add = TRUE)
# Funckja rysująca

observedf = c();
for (i in 1:dim(y)){
  observedf = c(observedf, y[[i]])
}
# Ten for służy do zapisania do wektora observedf wartości z danego przedziału

normprobabilities = c();
for (i in 1:length(br) - 1){
  normprobabilities = c(normprobabilities, pnorm(br[i+1], m, s) - pnorm(br[i], m, s))
}

normprobabilities[1] = pnorm(br[2], m, s)
normprobabilities[length(br) - 1] = 1 - pnorm(br[length(br) - 1], m, s)

normalfreq = normprobabilities * n
normalfreq

# Zauważamy, że w dwóch ostatnich klasach mamy mniej, niż 5 obserwacji. 
# Dlatego musimy połączyć te klasy

normalfreq[k-1] = normalfreq[k-1] + normalfreq[k]
normalfreq = normalfreq[-c(k)]

observedf[k-1] = observedf[k-1]+observedf[k]
observedf = observedf[-c(k)]

normalfreq
observedf

k = k-1

expectedp = normalfreq/sum(normalfreq)
expectedp

chisq.test(observedf, p = expectedp)


################# NIE DZIAŁA KURWA ####################
#######################################################














#######################
##### Chi-kwadrat #####
#######################
###### ZADANIE 6 ######
#######################

Poniższe dane przedstawiają liczbę punktów uzyskanych przez grupę studentów na koniec semestru:
Na poziomie istotności 0,01 sprawdź, czy oceny tej grupy uczniów mają rozkład normalny

punkty = read.csv("C:/Users/klemm/Desktop/SADkolos2/normalnosc_punkty.csv", sep=";", dec = ",", head = TRUE)$punkty

### H0: rozkład ocen jest normalny
### H1: rozkład ocen nie jest normalny

alfa = 0.01

shapiro.test(punkty)$p.value
# p-value < alfa => odrzucamy H0












#######################
##### Chi-kwadrat #####
#######################
###### ZADANIE 7 ######
#######################

Socjolog pragnie sprawdzić, czy liczba lat nauki danej osoby ma związek z jej miejscem zamieszkania.
Wybrano próbę 88 osób i sklasyfikowano, jak pokazano.

Czy na poziomie istotności 0,05 socjolog może stwierdzić, że miejsce zamieszkania danej osoby zależy od
liczby lat studiów?

### H0: miejsce zamieszkania zależy od liczby lat studiów
### H1: miejsce zamieszkania nie zależy od liczby lat studiów

miejski = c(15, 12, 8)
podmiejski = c(8, 15, 9)
wiejski = c(6, 8, 7)


TK = data.frame(miejski, podmiejski, wiejski)

alfa = 0.05
chisq.test(TK)
# p-value > alfa => brak podstaw do odrzucenia H0















#######################
##### Chi-kwadrat #####
#######################
###### ZADANIE 8 ######
#######################

Badacz wybrał 100 pasażerów każdej z 3 linii lotniczych i zapytał ich, czy linia lotnicza zgubiła ich bagaż
podczas ostatniego lotu. Dane przedstawiono w tabeli. Czy na poziomie istotności 0,05 dane potwierdzają, że
odsetek pasażerów, którzy zagubili bagaż w trakcie lotu, zależy od linii lotniczej?

### H0: Odsetek pasażerów, którzy zgubili bagaż w trakcie lotu zależy od linii lotniczej
### H1: Nie zależy

alfa = 0.05

tak = c(10, 7, 4)
nie = c(90, 93, 96)

TK = data.frame(tak, nie)

chisq.test(TK)
# x-squared = 2.765
# p-value = 0.251 > alfa => brak podstaw do odrzucenia H0

# Na poziomie istotności 0.05 dane potwierdzaj hipotezę,
# że zgubienie bagażu zależy od linii lotniczej












#######################
##### Chi-kwadrat #####
#######################
###### ZADANIE 9 ######
#######################

W Senacie planowane jest głosowanie nad projektem ustawy zezwalającej na instalowanie anten satelitarnych
dowolnej wielkości na obszarach objętych ograniczeniami wykonawczymi. Podobną ustawę przyjęła Izba.
Przeprowadzono badanie opinii publicznej, aby sprawdzić, czy odczucia danej osoby w związku z
ograniczeniami dotyczącymi anten satelitarnych są powiązane z jej wiekiem. Uzyskano następujące dane:


### H0: powiązane z wiekiem
### H1: nie powiązane z wiekiem

alfa = 0.05

za = c(96, 96, 90, 36)
przeciw = c(201, 189, 195, 234)
nie_wiem = c(3, 15, 15, 30)

TK = data.frame(za, przeciw, nie_wiem)

chisq.test(TK)
# x-squared = 61.247
# p-value ~ 0 < alfa => odrzucamy H0


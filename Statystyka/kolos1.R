###################
####KOLOKWIUM 1####
###################

###Zadanie 1
Zmierzono miesięczne zużycie energii elektrycznej [kWh] w wybranym typie domów. Wszystkie wyniki dostępne są w pliku dane.csv, zmienna energia.
(a) Oblicz i zinterpretuj kwartyl trzeci i odchylenie standardowe zużycia energii elektrycznej.
(b) Skonstruuj szereg rozdzielczy przedziałowy składający się z 5 przedziałów, przy czym pierwszy przedział zaczyna się od 180kWh, a ostatni kończy się na 420kWh.
(c) Narysuj wykres kolowy zużycia energii elektrycznej zgodnie z szeregiem rozdzielczym skonstruowanym w punkcie (b).

dane=read.csv("E:/Ważne/Studia/Semestr_4/Statystyka/dane1.csv", sep=";", dec=",")
print(dane)

energia=na.omit(dane$energia)
print(energia)

a)
trzeci = quantile(energia, probs=0.75)
print(trzeci) #317.75
print(length(energia)) #64
sd(energia)#53.07653
#W pierwszych 75% pomiarów zużycie energii było mniejsze lub równe 317.15, a w pozostałej części większa
#Przeciętnie zużycie energii odchyla się o ok 53 kWh

b)
przedzialy=seq(180, 420, length=6)
szer = table(cut(energia, przedzialy))
print(szer)

c)
pie(szer)


###Zadanie 2
Liczba rejestrowanych rozpadów promieniotwórczych przez dekoder promieniowania podlega rozkładowi wykładniczemu (X). Badano źródło promieniowania dające średnio h rozpadów na sekundę (każdy pomiar trwa 1 sekundę, h to ostatnia niezerowa cyfra Twojego indeksu taka, że h>1).
(a) Narysuj rozkład X.
(b) Oblicz prawdopodobieństwo, że dekoder zarejestruje nie więcej niż 3 rozpady promieniotwórcze.

a)
lambda=1/6
curve(dexp(x,lambda),0,60)
b) #P(X<=3)
a =pexp(3,lambda)
print(a) #P(X<=3) = 0.3934693


###Zadanie 3
Wzrost kobiet mieszkających w pewnej miejscowości jest zmienną losową o rozkładzie normalnym ze średnią (165+h)cm i odchyleniem standardowym 5 cm. Wylosowano próbę 40 kobiet.
(a) Podaj rozkład średniego wzrostu 40 wylosowanych kobiet.
(b) Oblicz prawdopodobieństwo, że średni wzrost 40 wylosowanych kobiet mieści się w przedziale od 164 cm do 167 cm.
h = 6
mu = 165 + h
sigma = 5
n = 40
a) #avR ma rozkład normalny N(mu, sigma/sqrt(n))
print(pnorm(mu,sigma/sqrt(n)))

b) #P(164<avR<167) = P(avR<167) - P(avR<164)
prob = pnorm((167-mu)/(sigma/sqrt(n))) - pnorm((164-mu)/(sigma/sqrt(n)))
print(prob)
#P(164<avR<167) = P(avR<167) - P(avR<164) =  0.1029514


###Zadanie 4
Do przeprowadzenia eksperymentu wykorzystano 16 elektrowni wiatrowych typu „VerticalAxis Wind Turbines” z wiatrakiem ze zmodyfikowanym wirnikiem Darrieusa o stosunku wysokości do średnicy 2,8. Otrzymano wartości uzyskanej mocy (w setkach kW), które znajdują się w pliku dane.csv, zmienna moc.
Zakładając normalność badanej zmiennej, wyznacz (90+h)% przedział ufności dla średniej oczekiwanej wartości uzyskanej mocy. Podaj interpretację wyniku.
Jak duża powinna być próba, żeby mieć (90+h)% pewność, że błąd estymacji wynosi 0.1 setek kW?
moc = na.omit(dane$moc)
print(moc)
n = length(moc)
srednia = mean(moc)
sigma = sd(moc)
alfa = 1 - (0.96)

t.test(moc, conf.level = 1 - alfa)
#Z ufnoscia 0.96 przedział (3.74658, 4.32842) pokrywa średnia oczekiwana wartosc uzyskanej mocy 

###################
####KOLOKWIUM 2####
###################

###Zadanie 1
Zmierzono miesięczne zużycie energii elektrycznej [kWh] w wybranym typie domów. Wszystkie wyniki dostępne są w pliku dane.csv, zmienna energia.
(a) Oblicz i zinterpretuj medianę zużycia energii elektrycznej.
(b) Skonstruuj szereg rozdzielczy przedziałowy składający się z 4 przedziałów, przy czym pierwszy przedział zaczyna się od 190kWh, a ostatni kończy się na 400kWh.
(c) Narysuj histogram probabilistyczny zgodnie z szeregiem rozdzielczym skonstruowanym w punkcie (b).

dane=read.csv("E:/Ważne/Studia/Semestr_4/Statystyka/dane1.csv", sep=";", dec=",")
print(dane)
energia=na.omit(dane$energia)
print(energia)

a)
mediana = quantile(energia, probs=0.5)
print(mediana) #277
#Trzeci kwantyl wynosi 277, oznacza to, ze 50% miesięcznych wartości zużycia energii elektrycznej jest poniżej tej wartości.

b)
przedzialy=seq(190, 400, length=5)
szer = table(cut(energia, przedzialy))
print(szer)

c)
hist(szer, main="zuzycie", freq=FALSE) #źle


###Zadanie 2
W pewnej firmie informatycznej prawdopodobieństwo uszkodzenia laptopa przez pracownika w czasie rocznej eksploatacji wynosi 0.4. W firmie tej pracuje h osób. Każdy pracownik korzysta z jednego laptopa. X - zmienna losowa uszk. laptopów.
(a) Podaj rozkład prawdopodobieństwa X.
(b) Jakie jest prawdopodobieństwo, że liczba uszkodzonych laptopów w ciągu roku będzie większa niż 1?
(c) Wyznacz i zinterpretuj wartość oczekiwaną zmiennej losowej X.

a)
p = 0.4
h = 6
x = c(1, 2, 3, 4, 5, 6)
prawd = dbinom(x, h, p)
tabela = rbind(x, prawd)
print(tabela)

b) #P(X>1)
1 - pbinom(1, h, p)
##P(X>1) = 76.672%

c)
ex = h * p
print(ex) #2.4
#Oczekuje się, że w ciągu roku uszkodzone bedzie 2.4 laptopa


###Zadanie 3
Wzrost mężczyzn mieszkających w pewnej miejscowości jest zmienną losową o rozkładzie normalnym ze średnią (170+h) cm i odchyleniem standardowym 6 cm. Wylosowano próbę 50 mężczyzn.
(a) Podaj rozkład całkowitego wzrostu wszystkich wylosowanych mężczyzn.
(b) Oblicz prawdopodobieństwo, że całkowity wzrost wszystkich wylosowanych mężczyzn nie przekroczy 8550 cm.

mu = 176
sig = 6
n = 50

a)
# rozkład normalny N(n * mu, sqrt(n) * sig)

b) P(T<=8550)

pnorm(8550, n*mu, sqrt(n) * sig)

# ZADANIE 4
W badaniach dotyczących jakości wody ważne jest sprawdzenie obecności bakterii coli. Spośród 120 próbek wody z wybranych zbiorników wodnych 23 próbki wykazały obecność tych mikroorganizmów. Oszacuj z (90+h)% pewnością prawdziwą proporcję wszystkich zbiorników skażonych bakterią coli.

n = 120
T = 23
prop.test(T, n, conf.level = 0.96)
# Proporcja wszystkich zbiorników wodnych skażonych bakterią coli znajduje się m przedziale 12.5% do 28%
# Zasadne jest wdrożenie systemów poprawy jakości wody, ponieważ prawdą jest że proporcja zbiorników
# skażonych bakterią coli jest większa niż 20 %


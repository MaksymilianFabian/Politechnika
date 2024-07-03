dane = read.csv("dane.csv", sep=";", dec=",")
energia = na.omit(dane$energia)

# ZADANIE 1
# a
# MEDIANA
# Środkowa wartość czyli mediana wynosi 277 kWh
quantile(energia)[3]

# b
tablica = table(cut(energia, seq(190, 400, length=5)))
print(tablica)

# c
hist(tablica, main="Miesięczne zużycie energii elektrycznej" ,freq=FALSE)

# ZADANIE 2
# a
p = 0.4
h = 6
x = c(1, 2, 3, 4, 5, 6)
prawd = dbinom(x, h, p)
tabela = rbind(x, prawd)
print(tabela)

# b
# Prawdopodobienstwo ze liczba uszkodzonych laptopow w ciagu roku bedzie wieksza niz 1 wynosi 76.7 %
1 - pbinom(1, h, p)

# c
# Wartość oczekiwana wynosi 2.4
wartość_oczekiwana = h * p
print(wartość_oczekiwana)

# ZADANIE 3
mu = 176
sig = 6
n = 50

# a
# Rozkład normalny
# z parametrami n, mu, sig, sqrt(n)
N(n * mu, sqrt(n) * sig)


# b
pnorm(8550, n*mu, sqrt(n) * sig)

# ZADANIE 4
n = 120
T = 23
prop.test(T, n, conf.level = 0.96)
# Proporcja wszystkich zbiorników wodnych skażonych bakterią coli znajduje się m przedziale 12.5% do 28%
# Zasadne jest wdrożenie systemów poprawy jakości wody, ponieważ prawdą jest że proporcja zbiorników
# skażonych bakterią coli jest większa niż 20 %



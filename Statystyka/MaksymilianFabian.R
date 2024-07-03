#Zadanie 1
dane = read.csv('C:/Users/student/Downloads/dane_K2.csv', sep =";", dec = ",", head = TRUE)
czas = na.omit(dane$czas)
print(czas)

#Hipoteza
#H0: mu >= 0.08
#H1: mu < 0.08
sigma0 = 0.08
alfa = 0.06
install.packages("TeachingDemos")
library(TeachingDemos)
sigma.test(czas, sigmasq = sigma0, alternative = "less", conf.level = 1 - alfa)
#p-value jest większe od alfy, zatem brak podstaw do odrzucenia H0
#Wynik przeczy hipotezie, że wariancja czasu życia tych komórek w tym samym środowisku jest mniejsza od 0.8h^2.


#Zadanie 2
technologia = read.csv('C:/Users/student/Downloads/ANOVA_technologia.csv', sep =";", dec = ",", head = TRUE)
obiekty = rep(names(technologia), c(length(na.omit(technologia$T1)), length(na.omit(technologia$T2)), length(na.omit(technologia$T3))))
wyniki = c(na.omit(technologia$T1),
           na.omit(technologia$T2),
           na.omit(technologia$T3))
techTest = data.frame(obiekty, wyniki)
#a)
# H0: sig_1^2 = sig_2^2 = sig_3^2
# H1: !HO
alfa=0.01
bartlett.test(wyniki~obiekty, techTest)
#p-value(0.1766)>alfa więc wariancje są jednorodne

#b)
anova(lm(wyniki~obiekty))
#
#Zadanie 3
dane = read.csv('C:/Users/student/Downloads/Reg_temperatura.csv', sep =";", dec = ",", head = TRUE)
dane
X=dane$temperatura
Y=dane$tlen
#a)
cov(X,Y)#-5.4(8)
#kowariancja różna od zera, więc istnieje zależność liniowa między zawartością tlenu rozpusczonego w wodzie destylowanej a temperaturą.

#b)
# Równanie regresji prostej liniowej 
# Y = b0 + b1X
lm(Y~X)
#Y=13.089 - 0.1634x
#Jeśli temperatura wzrośnie o 1 st. C, to zawartość tlenu spadnie o 0.1634mg/dm^3

#c)
summary(lm(Y~X))$r.squared
#ocena: ~0.54
#Prosta regresji liniowej jest umiarkowanie dopasowana do danych
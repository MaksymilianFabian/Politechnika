dane=read.csv("C:/Users/Student/Desktop/155960/dane.csv", sep=";")
print(dane)
class(dane)
nazwy=names(dane)

#Zadanie 1
trzeci = quantile(na.omit(dane[,1], probs=0.75))
print(trzeci)      
#

sd(na.omit(dane[,1]))
#przecietnie zuzycie energii odchyla się od średniej o ok 53kWh

table(na.omit(dane[,1]),180)


#Zadanie 2
lambda=1/6
curve(dexp(x,lambda),0,60)
a =pexp(3,lambda)


#Zadanie3
mi=171
sigma=5
#rozkład dokładny, parametry wyżej

prawdopodobienstwo = 



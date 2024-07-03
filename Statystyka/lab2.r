loty=read.csv("F:/Szkola/Statystyka/RStudio/loty.csv", sep=";")
oceny=read.csv("F:/Szkola/Statystyka/RStudio/oceny.csv", sep=";", dec=',')
truskawki=read.csv("F:/Szkola/Statystyka/RStudio/truskawki.csv", sep=";")

print(loty)
class(loty) #sprawdzenie typu
nazwy = names(loty)
#srednia
for(i in 1:6){
  print("Srednia")
  #Dla drugiej kolumny interpretacja: srednia liczba pasazerow w roku 1956 wynosila 328 osob
  print(nazwy[i])
  print(mean(loty[,i]))
}
#mediana
for(i in 1:6){
  print("Mediana")
  print(nazwy[i])
  print(quantile(loty[,i], probs=0.5))
  #Dla drugiej kolumny interpretacja: W 6 miesiacach liczba pasazerow pewnej lini lotniczej w roku 1956 byla mniejsza lub rowna 315 osob i w 6 miesiacach liczba pasazerow pewnej lini lotniczej w roku 1956 byla wieksza lub rowna 315 osob"
}
#pierwszy kwantyl
for(i in 1:6){
  print("Pierwszy")
  print(nazwy[i])
  print(quantile(loty[,i], probs=0.25))
  #Dla drugiej kolumnty interpretacja: W trzech miesiacach liczba pasazerow, w roku 1956 byla mniejsza lub rowna 301 osob i w 9 miesiacach byla wieksza lub rowna 301 osob
}
#trzeci kwantyl
for(i in 1:6){
  print("Trzeci kwanty;")
  print(nazwy[i])
  print(quantile(loty[,i], probs=0.75))
}
for(i in 1:6){
  print("Odchylenie standardowe")
  print(nazwy[i])
  print(sd(loty[,i]))
  #Przecietnie liczba pasazerow odchyla sie od sredniej o 48 osób
}
for(i in 1:6){
  print("Zmiennosc")
  print(nazwy[i])
  z = sd(loty[,i])/mean(loty[,i])*100
  print(z)
  #Wystepuje slabe zroznicowanie liczby pasazerow w roku 1956
}

#HISTOGRAMY
min(loty)
max(loty)
przedzialy = seq(200,650,length=10)
par(mfrow=c(2,3))
kolory = c("red", "yellow", "pink", "blue", "green", "orange")
for(i in 1:6){
  hist(loty[,i],main=paste('Loty w', nazwy[i]), breaks=przedzialy, col=kolory[i], xlab='liczba pasazerow')
}

boxplot(loty[,1],loty[,2],loty[,3],loty[,4],loty[,5],loty[,6])

#srednia
apply(na.omit(oceny), 2,mean)
mean(na.omit(oceny[,2]))
print(oceny[,2])
#kwantyle
apply(na.omit(oceny), 2,quantile)
#odchylenie
apply(na.omit(oceny), 2,sd)
#zmiennosc
par(mfrow=c(2,2))
grupy = names(oceny)
for(i in 1:4){
  discrete.histogram(oceny[,i], freq=TRUE, main=grupy[i], xlabel=oceny) 
}
boxplot(oceny[,1],oceny[,2],oceny[,3],oceny[,4])
par(mfrow=c(2,2))
for(i in 1:4){
  title=paste("wykres kolowy", grupy[i])
  pie(table(oceny[,i]))
}

print(truskawki)
print(mean(na.omit(truskawki[,2])))
print(mean(na.omit(truskawki[,1])))

print(quantile(na.omit(truskawki[,2])))   
print(quantile(na.omit(truskawki[,1])))  

print(sd(na.omit(truskawki[,2])))
print(sd(na.omit(truskawki[,1])))

#sporządź szeregi rozdzielcze przedziałowe plonów w poszczególnych latach (cut)
table(cut(truskawki[,1], 5))
table(cut(truskawki[,2], 5)) 

#przedstaw dane z szeregów rozdzielczych na wykresach kołowych;
par(mfrow=c(1,2))
for(i in 1:2){
  pie(table(cut(truskawki[,i], 5)))
}

przedzialy = seq(20,150, length=5)
for(i in 1:2){
  hist(truskawki[,i],,breaks=przedzialy,freq=FALSE)
}


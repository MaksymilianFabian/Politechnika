#Przyklad 5 z wykladuuuu
#P(phat<=232/100) 
p = 0.25
n = 1000
T =232
proba = pnorm(T/n,p,sqrt(p*(1-p)/n))

dane = read.csv("F:/Szkola/Statystyka/RStudio/dane_est.csv", sep=";",dec=",")
print(dane)
print(dane[,1])
diamenty = na.omit(dane$diamenty)
print(diamenty)
# Populacja - wszystkie syntentyczne diamenty wyprudkowane nowa metoda
# Proba - 12 syntentycznych diamentow wyprudkowanych nowa metoda
# Badana zmienna - karaty
srednia = mean(diamenty)
wariancja = var(diamenty)
odchylenie = sd(diamenty)

PrzedzialUfnosciMU=function(srednia,odchylenie,sigma,liczebnosc,ufnosc){
  #srednia próby-X, odchylenie próby- S(a sigma to odchylenie dla populacji), 
  #liczebosc-n,
  alfa=1-ufnosc
  Lt=srednia-qt(1-alfa/2,liczebnosc-1)*odchylenie/sqrt(liczebnosc)
  Pt=srednia+qt(1-alfa/2,liczebnosc-1)*odchylenie/sqrt(liczebnosc)
  Lz=srednia-qnorm(1-alfa/2)*odchylenie/sqrt(liczebnosc)
  Pz=srednia+qnorm(1-alfa/2)*odchylenie/sqrt(liczebnosc)
  return(
    if(liczebnosc<30){
      if(sigma==FALSE){print(paste("(",Lt,";",Pt,")"))}
      else {print(paste("(",Lz,";",Pz,")"))}
    }
    else {print(paste("(",Lz,";",Pz,")"))}
  )
}
PrzedzialUfnosciMU(srednia,odchylenie,FALSE,12,0.95)

t.test(diamenty, conf.level=0.95)

# Z ufnoscia 0.95 przedzial (0.499;0.569) pokrywa nieznana srednia populacyjna mu

PrzedzialUfnoscidlaSig2 = function(liczebnosc, odchylenie, ufnosc){
  alfa = 1 - ufnosc
  if(liczebnosc<30){
    x1 = (liczebnosc - 1)*odchylenie^2/qchisq(1-alfa/2,liczebnosc-1)
    x2 = (liczebnosc - 1)*odchylenie^2/qchisq(alfa/2,liczebnosc-1)
  }
  else{
    x1 = (liczebnosc - 1) + qnorm(1 - (1-ufnosc/2)) * sqrt(2*(liczebnosc-1))
    x2 = (liczebnosc - 1) - qnorm(1 - (1-ufnosc/2)) * sqrt(2*(liczebnosc-1))
    
  }
  return (print(paste(x1, x2)))
}
wynik = PrzedzialUfnoscidlaSig2(12, odchylenie, 0.95)

chi=sigma.test(diamenty,conf.level = 0.95)

#Z ufnoscia 0.95 przedzial (0.002;0.009) pokrywa nieznana prawdziwa wartosc warniacji dla populacji sigma^2

c=chi$conf.int
L=c[[1]]
P = c[[2]]
L_odchylenie = sqrt(L)
P_odchylenie = sqrt(P)
# Z ufnoscia 0.95 przedzial (0.039;0.094) pokrywa nieznana wartosc odchyelania standardowego dla popoulacji sigma


#ZAD2
mleko = na.omit(dane$mleko)
#populacja to wszystkie kobiety karmiace piersia
#proba to 20 kobiet karmiacych piersia
# badana zmienna to poziom pcb u kobiety
print(mleko)
srednia = mean(mleko)
wariancja = var(mleko)
odchylenie = sd(mleko)
t.test(mleko, conf.level=0.95)
PrzedzialUfnosciMU(srednia,odchylenie,FALSE,20,0.95)
#Z ufnoscia 0.95 przedzial (3.42;8.18) pokrywa nieznana rzeczywista srednia poziomu pcb w mleku wszystkich matek
chi = sigma.test(mleko,conf.level = 0.95)
#Z ufnoscia 0.95 przedzial (14.95;55.15) pokrywa nieznana rzeczywista wartosc warniacji zawartosci pcb w mleku wszystkich matek karmiacych piersias
c=chi$conf.int
L=c[[1]]
P = c[[2]]
L_odchylenie = sqrt(L)
P_odchylenie = sqrt(P)
# Z ufnoscia 0.95 przedzial (3.86;7.43) pokrywa nieznana rzeczywista wartosc odchyelnia standardowego zawartosci pcb w mleku wszystkich matek karmiacych piersia

#ZAD3
papierosy = na.omit(dane$papierosy)
print(papierosy)
srednia = mean(papierosy)
wariancja = var(papierosy)
odchylenie = sd(papierosy)
z.test(papierosy,sigma.x = 0.7,conf.level=0.95) #WYLACZYC TEACHING EMOS. WLACZYC BDSA
PrzedzialUfnosciMU(srednia,0.7,TRUE,15,0.95)
#PODPUNKT B) blad estymacji - x_, blad estymacji + x_ => 2z * sig/sqrt(n) <= 0.3
z = qnorm(1-0.05/2)
szukane = (2*z * 0.7/0.3)^2
#Odchylenie standardowe zawiera sie w tym przedziale
#ZAD4
wodorosty = na.omit(dane$wodorosty)
srednia = mean(wodorosty)
wariancja = var(wodorosty)
odchylenie = sd(wodorosty)
t.test(wodorosty, conf.level=0.90)
chi = sigma.test(wodorosty,conf.level = 0.90) #teaching demos

#ZAD5
sygnal = na.omit(dane$sygnal)
odchlenieB=3
srednia=0
n=10
alfa=0.05
mean(sygnal)
z.test(sygnal, sigma.x=3, conf.level=0.95)
#ZAD6 rozklad nie jest podany
n = 1200
alfa = 0.05
alfa2 = alfa/2
srednia = 4.7 #mi
odchylenie = 2.2 #sigma
zsum.test(4.7, odchylenie, n, conf.level = 0.95)
#z ufnoscia 0.95 przedzial (4.57;4.83) pokrywa nieznana rzeczywista srednia czasu wszystkich polaczen telefonicznych
#b) przedzial ufnosci dla odchylenia standardowego
L = sqrt((n-1)*(odchylenie)^2/qchisq(0.95,n-1))
P = sqrt((n-1)*odchylenie^2/qchisq(alfa/2,n-1))
# z ufnoscia 0.95 przedzial (2.11;2.3) pokrywa nieznana prawdziwa wartosc odchylenia standardowego dlugosci wszystkich polaczen telefonicznych

#zad7
n = 365
srednia = 102
wariancja = 81
alfa = 0.02
zsum.test(102, sqrt(wariancja), n, conf.level = 0.98)
# z ufnoscia 0.98 przedzial (100.9;103.1) pokrywa nieznana prawdziwa wartosc srednia zuzycia wody w fabryce
wariancja = 25
pewnosc = 0.95
L = sqrt((n-1)*81/qchisq(0.98,n-1))
P = sqrt((n-1)*81/qchisq(alfa/2,n-1))

#ZAD8 rozklad normalny
alfa = 0.05
sigma = sqrt(25)
#n=?
kw=qnorm(1-alfa/2)
(kw*sigma/1)^2

#ZAD9 rozklad normalny
odchylenie = 0.3
alfa = 0.1
kw=qnorm(1-alfa/2)
(kw*odchylenie/0.1)^2
alfa2 = 0.01
kw2=qnorm(1-alfa2/2)
(kw2*odchylenie/0.1)^2
#ZADd10
p = 0.015
phat = 4/100
n = 100
ufnosc = 0.95
L = phat - qnorm(1-alfa/2)*sqrt(phat*(1-phat))/sqrt(n)
P = phat + qnorm(1-alfa/2)*sqrt(phat*(1-phat))/sqrt(n)
prop.test(4,100,0.95)
#pokrywa nieznana rzeczywista proporcje wszystkich niedopelnionych puszek

#zad11
n = 120
blad = 24
alfa = 0.1
phat = 24/120
L = phat - qnorm(1-alfa/2)*sqrt(phat*(1-phat))/sqrt(n)
P = phat + qnorm(1-alfa/2)*sqrt(phat*(1-phat))/sqrt(n)

#zad12
alfa = 0.02
#a
p = 0.3
#blad oszacowania
#z * sqrt(phat(1-phat)/sqrt(n))
szukana = (qnorm(1-alfa/2) * sqrt(p*(1-p))/0.05)^2


#b
p = 0.5
szukana = (qnorm(1-alfa/2) * sqrt(p*(1-p))/0.05)^2

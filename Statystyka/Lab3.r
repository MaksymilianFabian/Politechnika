#ZAD1 rozklad dwumianowy, Bin(n,p)
n = 5
x = 0:5
p = 0.3
prob = dbinom(x,n,p)
rbind(x,prob)
plot(x,prob,type="h", lwd = 50) #lwd to grubosc
dbinom(2,n,p) #gestosc -> wartosc dla podanego n
pbinom(2,n,p) #dystrybuanta -> p(x = 0) + p(x=1) + p(x=2)
a = dbinom(3,n,p) #prawdopodobienstwo ze X = 3 -> P(X=3)
b = 1 - pbinom(2,n,p) # P(X>=3) = P(X>2)
c = pbinom(2,n,p) # P(X<3) = P(X<=2)

#ZAD2 rozklad dwumianowy, Bin(n,p)

n = 8
x = 0:8
p = 0.9
prob = dbinom(x,n,p)
rbind(x,prob)
a = dbinom(8,n,p)
b = dbinom(7,n,p)
c = 1 - pbinom(5,n,p)
d = sum(prob*x) #oczekiwana wartosc, jakiej mozemy sie spodziewac liczby zarowek lub n*p, przecietnie mozemy spodziewac sie ze 7 zarowek przekroczy zywotnosc 500h
variance = sum(x^2*prob)-d^2
f = sqrt(variance) #odchylenie standardowe to sqrt(n*p*(1-p)) 
f2 = sqrt(n*p*(1-p)) #mozemy spodziewac sie ze przecietne odchylenie od sredniej wynosi jedna zarowka

#ZAD3 rozklad wykladniczy, typu ciaglego exp(lambda)
lambda = 0.01
curve(dexp(x,lambda), 0, 1000)
a = 1 - pexp(200,lambda) #P(X>=200) = P(X>200)
b = pexp(100, lambda) #P(X<100) = P(X<=100)
c = pexp(500, lambda) 

#ZAD4 rozklad wykladniczy exp(lambda)
lambda = 1/2.4
curve(dexp(x,lambda), 0, 20)
a = 1 - pexp(3, lambda) #P(X>=3) = P(X>3)
b = pexp(3,lambda) - pexp(2,lambda)#P(a < X <= b) = F(b) - F(a)
f2 = function(x){x*lambda*exp(-lambda*x)}
integrate(f2,0,Inf)

#ZAD5 rozklad normalny, tez jest ciagly
mi = 0.13
sigma = 0.005
curve(dnorm(x,mi,sigma),mi-3*sigma,mi+3*sigma) #99,7% obserwacji na tym przedziale
pnorm(0.14,mi,sigma) - pnorm(0.12,mi,sigma)
#ZAD 6 I 7 DO DOMU BO CZEMU I NIE
mi = 120
sig = 15
curve(dnorm(x,mi,sig),mi-3*sig,mi+3*sig)
pnorm(135,mi,sig) - pnorm(111,mi,sig) #P(a < X <= b) = F(b) - F(a)
#ZAD7
mi = 46.8
sigma = 1.75
pnorm(50,mi,sigma) #P(X<=50)
1 - pnorm(48,mi,sigma) #P(X>=48)
#ZAD8 rozklad dwumianowy, gdy ponad 30 to duza próba s
p = 0.25
x = 0:100
n = 100 
pbinom(15,n,p) 
#przyblizenie rozkladem normalnym N(n*p, sqrt(n*p*q))
pnorm(15,n*p, sqrt(n*p*(1-p)))


#ZAD9 #Xsr ~ N(mi, sig/sqrt(n))
mi = 200
sigma = 10
n = 25
#P(199<xavr<202)
pnorm(202,mi,sigma/sqrt(25)) - pnorm(199,mi,sigma/sqrt(25))
#T = X1 + X2 +X3 +.... = N(n*mi, sqrt(n)* sigma)
pnorm(5100, n*mi, sqrt(n)*sigma)

#ZAD10
mi = 202
sigma = 14
n = 64
pnorm(206,mi,sigma/sqrt(n)) - pnorm(198,mi,sigma/sqrt(n))
#P(198<avR<206)

#ZAD11
mi = 0.5
sigma = 0.2
n = 100
1 - pnorm(47,mi*n,sigma*sqrt(n))
#suma zmiennych losowych
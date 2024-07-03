#Oblicz
sin(2*pi)
cos(3/4)
tan(pi)
tan(sin(pi)/cos(pi))
log(100, 10)
log(15)
log(1/7,7)
exp(3)
64^(1/3)

#wektory
wektor = seq(1,10)
x = seq(2,20,by=2)
length(x)
y = rev(x) #reverse
x*x
x^2
sqrt(sum(x^2)) #dlugosc euklidesowa
t(x)%*%y #mnozenie transpozycji przez wektor
x%*%t(y)

wektor2 = seq(5,10,length=13) 
wektor2
z = c(1,2)
z1 = rep(c(1,2), times=5) #5ciokrotna replikacja z
z2 = rep(c(1,2), each=5) #5ciokrotna replikacja skladowych z
z1 + 4
z3 = z2[-c(length(z2))] #usuniecie ostatniej
c = z1 + z3
d = z1[z1>1]

#macierz
A = rbind(c(2,3,0),c(1,-1,2),c(1,1,-1))
A^2
A%*%A
t(A)
det(A)
solve(A)
b = A[3,]
x1 = c(1,3,7,12,14,23,33,41,48,50)
y1 = c
plot(x1,y1)
f = data.frame(x1,y1)
plot(f)
c1 = rbind(x1,y1)
c2 = cbind(x1,y1)
plot(c1)
plot(c2)

curve(x^2+3*x-5, from = -3, to = 4 )

sum(diag(A))
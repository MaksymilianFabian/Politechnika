#Zad1
'''n = int(input())
a = [0] * (n+1)
a[0] = 1
for i in range(n):
    a[i+1] = 1 + a[i + 1 - a[a[i]]]
print(a[n])'''
#Zad2
'''n = input().split()
def wynik(a, tab):
    if a != 0:
        return int(tab[a - 1]) + wynik(a - 1, n)
    else:
        return 0
print(wynik(len(n), n))'''
#Zad 1
'''
list = list(map(int, input().split()))
sum = 0
temp = 0
for i in range(len(list)):
    for j in range(i, len(list)):
        temp += list[j]
        if temp > sum:
            sum = temp
    temp = 0
    print(sum)
print(sum)
'''

#Zad2
'''
n = int(input())
for i in range(2, n+1):
    if n % i == 0:
        print(i)
        break
'''

#Zad3
'''mądre rozwiązanie

def largestAreaInHistogram(height):
    stack = [-1]
    maxArea = 0
    for i in range(len(height)):
        while stack[-1] != -1 and height[stack[-1]] >= height[i]:
            currentHeight = height[stack.pop()]
            currentWidth = i - stack[-1] - 1
            maxArea = max(maxArea, currentHeight * currentWidth)
        stack.append(i)

    while stack[-1] != -1:
        currentHeight = height[stack.pop()]
        currentWidth = len(height) - stack[-1] - 1
        maxArea = max(maxArea, currentHeight * currentWidth)
    return maxArea

n = int(input())
height = []
for i in range(n):
    height.append(int(input()))
print("Maximum area is", largestAreaInHistogram(height))'''

#moje rozwiazanie
'''n = int(input())
height = []
for i in range(n):
    height.append(int(input()))
area = 0
for i in range(n):
    for j in range(i+1, n+1):
        w = height[i:j]
        maxh = min(w)
        area = max(area, maxh * len(w))
print(area)'''

#Zad4
'''w1,h1=input().split()
w1 = int(w1)
h1 = int(h1)
matryca1=[]
for i in range(h1):
    tab = input().split()
    for j in range(len(tab)):
        tab[j] = int(tab[j])
    matryca1.append(tab)
matryca2=[]
w2,h2=input().split()
w2 = int(w2)
h2 = int(h2)
for i in range(h2):
    tab = input().split()
    for j in range(len(tab)):
        tab[j] = int(tab[j])
    matryca2.append(tab)

wynik = []
for i in range(h1):
    matrycatemp = []
    for j in range(w2):
        liczba = 0
        for z in range(w1):
            liczba+=matryca1[i][z]*matryca2[z][j]
        matrycatemp.append(liczba)
    wynik.append(matrycatemp)

for i in range(len(wynik)):
    x= ""
    for j in range(len(wynik[i])):
        x+=str(wynik[i][j])+" "
    print(x.strip(),sep="",end="")
    print("\n",end="")'''

#Zad5
'''t = int(input())
tab = []
for i in range(t):
    tab.append(input().split())
    for j in range(2):
        tab[i][j] = int(tab[i][j])
print(tab)

for i in range(len(tab)):
    a = tab[i][0]
    M = tab[i][1]
    day = 0
    sum = 0
    while sum < M:
        sum += a
        a *= 2
        day += 1
    print(day)'''
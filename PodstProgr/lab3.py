#Zad 1
'''
H = input().split()
if int(H[0]) > int(H[1]):
    print("John")
else:
    if int(H[0]) < int(H[1]):
        print("Betty")
    else:
        print("NOBODY")
'''

#Zad 2
'''
t = int(input())
for i in range(t):
    n, m = input().split()
    if int(n) > int(m):
        print(n + "  is greater than  " + m)
    else:
        if int(n) < int(m):
            print(n + "  is smaller than  " + m)
        else:
            print("n is equal m:  " + n)
'''

#Zad 3
'''
n = int(input())
a = int(input())
t = 0
for i in range(n-1):
    b = int(input())
    if a != b:
        t = 1
if t == 0:
    print("True")
else:
    print("False")
'''

#Zad 4
'''
x1, y1 = input().split()
x2, y2 = input().split()
x3, y3 = input().split()
wekx = int(x1) - int(x2)
weky = int(y1) - int(y2)
wek2x = int(x2) - int(x3)
wek2y = int(y2) - int(y3)
if weky == 0 and wek2y == 0:
    print("True")
elif weky == 0 and wek2y != 0 or weky != 0 and wek2y ==0:
    print("False")
elif wekx/weky == wek2x/wek2y:
    print("True")
else:
    print("False")
'''

#Zad 5
'''
n = int(input())
if n == 2:
    print(2)
elif n <=1:
    print("False")
else:
    print(2)
    for i in range(2, n+1):
        for j in range(2, i):
            if i % j == 0:
                break
            elif j==i-1:
                print(i)
'''

#Zad 6
'''
n = int(input())
def cel_kel(m0, m1):
    if m1 == "Celsius" and float(m0) >= -273.15:
        x = float(m0) + 273.15
        print(format(round(x, 2), '.2f'))
    elif m1 == "Kelvin" and float(m0) >= 0:
        x = float(m0) - 273.15
        print(format(round(x, 2), '.2f'))
    else:
        print("NO")
def cel_far(m0, m1):
    if m1 == "Celsius" and float(m0) >= -273.15:
        x = float(m0) * 1.8 + 32
        print(format(round(x, 2), '.2f'))
    elif m1 == "Fahrenheit" and float(m0) >= -459.67:
        x = (float(m0) - 32) / 1.8
        print(format(round(x, 2), '.2f'))
    else:
        print("NO")
def kel_far(m0, m1):
    if m1 == "Kelvin" and float(m0) >= 0:
        x = float(m0) * 1.8 - 459.67
        print(format(round(x, 2), '.2f'))
    elif m1 == "Fahrenheit" and float(m0) >= -459.67:
        x = (float(m0) + 459.67) / 1.8
        print(format(round(x, 2), '.2f'))
    else:
        print("NO")

for i in range(n):
    M = input().split()
    if M[1] == "Celsius" and M[2] == "Kelvin" or M[1] == "Kelvin" and M[2] == "Celsius":
        cel_kel(M[0], M[1])
    elif M[1] == "Celsius" and M[2] == "Fahrenheit" or M[1] == "Fahrenheit" and M[2] == "Celsius":
        cel_far(M[0], M[1])
    elif M[1] == "Kelvin" and M[2] == "Fahrenheit" or M[1] == "Fahrenheit" and M[2] == "Kelvin":
        kel_far(M[0], M[1])
'''

#Zad 7
'''
n, x, y = input().split()
n = int(n)
x = int(x)
y = int(y)
p = 0
for a in range(n+1):
    for b in range(n+1):
        for c in range(n+1):
            for d in range(n+1):
                if x*(a**2-c**2) == y*(d**2-b**2):
                    p += 1
print(p)
'''
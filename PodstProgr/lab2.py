#Zad 3
'''
M = [1,2,3,4,5,6,7]
i, j = input().split()
i = int(i)
j = int(j)
p = 0
for n in range(j-i+1):
    p = p + int(M[i])
    i += 1
print(p)
'''

#Zad 4
'''
n = input()
A = input().split()
p = 0
for i in range(int(n)):
    p += 1/int(A[i])
print(1/p)
'''

#Zad 5
'''
h = int(input())
n = int(input())
j = 1
for i in range(n):
    for j in range(h):
        print("* " * (j + 1))
    h += 1
'''
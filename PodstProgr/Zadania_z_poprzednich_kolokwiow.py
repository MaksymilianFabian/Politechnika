#Students scores
'''
tab = []
n = int(input())
for i in range(n):
    tab.append(input().replace(":", " ").split())
wyn = []
for i in range(n):
    sum = 0
    a = 0
    for j in range(2, len(tab[i]), 2):
        sum += float(tab[i][j])
        a += 1
    wyn.append(tab[i][0] + " " + str(sum/a))
wyn = sorted(wyn)
for i in range(n):
    print(wyn[i])

naz = []
war = []
licz = []
for i in range(n):
    for j in range(1, len(tab[i]), 2):
        if tab[i][j] in naz:
            war[naz.index(tab[i][j])] += float(tab[i][j + 1])
            licz[naz.index(tab[i][j])] += 1
        else:
            naz.append(tab[i][j])
            war.append(float(tab[i][j + 1]))
            licz.append(1)

for i in range(len(naz)):
    war[i] = war[i]/licz[i]

naz2 = naz.copy()
war2 = [0] * len(war)
naz = sorted(naz)
for i in range(len(naz)):
    war2[naz.index(naz2[i])] = war[i]

for i in range(len(naz)):
    print(naz[i] + " " + str(war2[i]))
'''

#Can you get a palindrome?
'''
a = input().lower()
n = 0
if a == a[::-1] and len(a)>=1:
    print("YES")
else:
    for i in range(len(a)):
        b = a[:i]+a[i+1:]
        if b == b[::-1] and len(b)>=1:
            n = 1
            break
        for j in range(len(b)):
            c = b[:j]+b[j+1:]
            if c == c[::-1] and len(c)>=1:
                n = 1
                break
    if n > 0:
        print("YES")
    else:
        print("NO")
'''

#Find word in matrix
'''
n, m = input().split()
n = int(n)
m = int(m)
word = input()
matrix1 = []
x = 0
for i in range(n):
    matrix1.append(input())
matrix2 = []
for i in range(m):
    temp = ""
    for j in range(n):
        temp += matrix1[j][i]
    matrix2.append(temp)

if len(word) > 0:
    pass
    if len(word) > n and len(word) > m:
        pass
    else:
        for i in range(n):
            check1 = matrix1[i]
            if word in check1 or word in check1[::-1]:
                x = 1
                break
        for i in range(m):
            check1 = matrix2[i]
            if word in check1 or word in check1[::-1]:
                x = 1
                break
else:
    x = 1

if x == 0:
    print("NO")
else:
    print("YES")
'''

#Finding triangle
'''import itertools
n = int(input())
tab = []
for i in range(n):
    tab.append(input().split())
    tab[i][0] = int(tab[i][0])
    tab[i][1] = int(tab[i][1])
tri =[]
F = []
for wierzcholki in itertools.combinations(tab, 3):
    a = (wierzcholki[1][0]-wierzcholki[0][0]) * (wierzcholki[2][1]-wierzcholki[0][1]) - (wierzcholki[1][1]-wierzcholki[0][1]) * (wierzcholki[2][0]-wierzcholki[0][0])
    if a > 0:
        P = 0.5 * a
    elif a < 0:
        a = -a
        P = 0.5 * a
    F.append(P)
print(str(min(F)) + " " + str(max(F)))'''

#Diagonal sum
'''import numpy
n, m = input().split()
n = int(n)
m = int(m)
matrix1 = []
for i in range(n):
    matrix1.append(input().split())
    for j in range(m):
        matrix1[i][j] = int(matrix1[i][j])
for i in range(n):
    matrix2 = matrix1[::-1]
a = 0
for i in range(n+m-1):
    if sum(numpy.diagonal(matrix1, i-n+1)) > a:
        a = sum(numpy.diagonal(matrix1, i-n+1))
    print(numpy.diagonal(matrix1, i-n+1))
for i in range(n+m-1):
    if sum(numpy.diagonal(matrix2, i-n+1)) > a:
        a = sum(numpy.diagonal(matrix2, i-n+1))
print(a)

wyn1 = [0]*(m+n-1)
for i in range(m-n+1):
    for j in range(n):
        wyn1[i] += matrix1[j][j+i]
print(wyn1)


wyn2 = [0]*(m+n-1)
for i in range(m-n+1):
    for j in range(n):
        wyn2[i] += matrix2[j][j+i]
print(wyn2)'''

'''n, m = input().split()
n = int(n)
m = int(m)
matrix1 = []
for i in range(n):
    matrix1.append(input().split())
    for j in range(m):
        matrix1[i][j] = int(matrix1[i][j])
for i in range(n):
    matrix2 = matrix1[::-1]
def diag(matrix):
    ans = [0]*(m+n-1)
    for i in range(1, (n + m)):
        col = max(0, i - n)
        count = min(i, (m - col), n)
        for j in range(0, count):
            #print(matrix[min(n, i) - j - 1][col + j], end="\t")
            ans[i-1] += matrix[min(n, i) - j - 1][col + j]
    return ans
print(max(max(diag(matrix1)), max(diag(matrix2))))'''

#Setting zeroes
'''n, m = input().split()
n = int(n)
m = int(m)
matrix1 = []
for i in range(n):
    matrix1.append(input().split())
    for j in range(m):
        matrix1[i][j] = int(matrix1[i][j])
pos = []
for i in range(n):
    for j in range(m):
        if matrix1[i][j] == 0:
            pos.append([i,j])
for i in range(len(pos)):
    for j in range(m):
        matrix1[pos[i][0]][j] = 0
        for k in range(n):
            matrix1[k][pos[i][1]] = 0
for i in range(n):
    for j in range(m):
        print(matrix1[i][j], end="\t")
    print()'''

#Vertical sort
'''n, m = input().split()
n = int(n)
m = int(m)
matrix1 = []
for i in range(m):
    matrix1.append(input().split())
    for j in range(n):
        matrix1[i][j] = int(matrix1[i][j])
matrix2 = []
for i in range(n):
    temp = []
    for j in range(m):
        temp.append(matrix1[j][i])
    matrix2.append(sorted(temp))
for i in range(m):
    for j in range(n):
        print(matrix2[j][i], end="\t")
    print()
'''

#Primes in number
'''n = input()
tab = []
for i in range(len(n)):
    for j in range(i+1, len(n)+1):
        tab.append(n[i:j])
for i in range(len(tab)):
    tab[i]=int(tab[i])
tab = [i for i in tab if i != 0]
for i in range(len(tab)):
    tab[i]=str(tab[i])
tab = list(dict.fromkeys(tab))
tab.sort(reverse=True)

ans = []
for i in range(len(tab)):
    if int(tab[i])>1:
        for j in range(2,int(tab[i])):
            if int(tab[i]) % j == 0:
                break
        else:
            ans.append(tab[i])
    elif tab[i] == 2:
        ans.append(tab[i])
for i in ans:
    print(i)'''

#Sequence tranformation
'''N, M = input().split()
N = int(N)
M = int(M)
S = input()
op = []
for i in range(M):
    op.append(input().split(";"))

strings = []
strings.append(S)
for i in range(M):
    temp = S[:min(int(op[i][0]), int(op[i][1]))]
    temp += op[i][2]
    temp += S[max(int(op[i][0]), int(op[i][1]))+1:]
    S = temp
    strings.append(S)
print(S)
print(max(strings, key=len))'''

#Simple sudoku
'''sudoku = []
for i in range(9):
    sudoku.append([int(x) for x in input().split()])
tab = [1, 2, 3, 4, 5, 6, 7, 8, 9]
n = 0
sudoku2 = []
for i in range(9):
    temp = []
    for j in range(9):
        temp.append(sudoku[j][i])
    sudoku2.append(temp)
for i in range(9):
    for j in range(9):
        if tab[j] not in sudoku[i]:
            n = 1
            break
for i in range(9):
    for j in range(9):
        if tab[j] not in sudoku2[i]:
            n = 1
            break
diag1 = []
for i in range(9):
    diag1.append(sudoku[i][i])
diag2 = []
for i in range(9):
    diag2.append(sudoku[8-i][i])
m = 0
for i in range(len(diag1)):
    if tab[i] not in diag1:
        m = 1
        break
    if tab[i] not in diag2:
        m = 1
        break
if n == 1:
    print("False")
elif n == 0 and m == 0:
    print("X")
elif n == 0 and m ==1:
    print("True")'''

#Matrix transformations
'''m, n = input().split()
n=int(n)
m=int(m)
matrix = []
for i in range(m):
    matrix.append(input().split())
    for j in range(n):
        matrix[i][j] = int(matrix[i][j])
k = int(input())
operations=[]
for i in range(k):
    operations.append(input().split())

def ReverseRow(tab, row):
    tab[row]=tab[row][::-1]

def ReverseColumn(tab, col):
    temp = []
    for i in reversed(range(len(tab))):
        temp.append(tab[i][col])
    for i in range(len(tab)):
        tab[i][col]=temp[i]

def Transpose(tab):
    temp=[[0 for j in range(len(tab))] for i in range(len(tab[0]))]
    for i in range(len(tab)):
        for j in range(len(tab[0])):
            temp[j][i] = tab[i][j]
    return temp

for i in range(k):
    if operations[i][0]=="T":
        matrix = Transpose(matrix)
    elif operations[i][0]=="RR":
        ReverseRow(matrix,int(operations[i][1]))
    elif operations[i][0]=="RC":
        ReverseColumn(matrix, int(operations[i][1]))

for i in matrix:
    print(" ".join([str(k) for k in i]))'''

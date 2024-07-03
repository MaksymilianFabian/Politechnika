#Zad1
'''a = input()
def make_dict(sentence):
    dict = {}
    for i in range(len(sentence)):
        if sentence[i] in dict:
            dict[sentence[i]] += 1
        else:
            dict[sentence[i]] = 1
    if " " in dict:
        dict.pop(" ")
    if "-" in dict:
        dict.pop("-")
    if "," in dict:
        dict.pop(",")
    if "." in dict:
        dict.pop(".")
    return(dict)
print(max(make_dict(a.lower()), key=lambda key: make_dict(a.lower())[key]))'''

#Zad2
'''a = input().split()
for i in range(len(a)):
    a[i] = int(a[i])
a = sorted(a)
if len(a) > 1:
    ans = []
    for i in range(a[0], max(a)+1, a[1]-a[0]):
        ans.append(i)
    if ans == a:
        print("True")
    else:
        print("False")
else:
    print("True")'''

#Zad3
'''text = input()
new_text= text
vowels = ["a", "e", "i", "o", "u", "y", "A", "E", "I", "O", "U", "Y"]
a = 0
for i in range(len(text)):
    if text[i] in vowels:
        new_text = new_text.replace(text[i], "")
        i-=1
print(new_text)'''

#Zad4
'''n = int(input())
tab = input().split()
tab = [int(x) for x in tab]
tab = sorted(tab)
for i in range(n):
    print(tab[i], end=" ")'''

#Zad5
'''a = input()
b = input()
if b in a:
    print("YES")
else:
    print("NO")'''

#Zad6
'''n = int(input())
m = []
for i in range(n):
    m.append(input().split())
    for j in range(n):
        m[i][j] = int(m[i][j])
sum = 0
for row_min in range(0, len(m)):
    for col_min in range(0, len(m[0])):
        for row_max in range(row_min, len(m)):
            for col_max in range(col_min, len(m[0])):
                temp_sum = 0
                for i in range(row_min, row_max+1):
                    for j in range(col_min, col_max+1):
                        temp_sum += m[i][j]
                sum = max(temp_sum, sum)
print(sum)'''
#Zad7
'''n = int(input())
tab = []
for i in range(n):
    tab.append(input())
text = ""
for i in range(n):
    text += tab[i][i]
print(text)'''

#Zad8
'''n = int(input())
tab = input().split()
tab = [int(x) for x in tab]
a = 0
for i in range(n):
    for j in range(n):
        if tab[i]-1 in tab or tab[i]+1 in tab:
            a = 1
if a == 1:
    print("YES")
else:
    print("NO")'''

#Zad9
'''n = int(input())
tab = []
for i in range(n):
    tab.append(int(input()))
def make_dict(tab):
    dict = {}
    for i in range(len(tab)):
        if tab[i] in dict:
            dict[tab[i]] += 1
        else:
            dict[tab[i]] = 1
    return dict
if len(make_dict(tab)) == 1:
    print("True")
else:
    print("False")'''

#Zad10
'''s = int(input())
cipher = input()
decrypted = ""
for i in range(len(cipher)):
    if cipher[i].isupper():
        decrypted += chr((ord(cipher[i]) - s - 65) % 26 + 65)
    else:
        decrypted += chr((ord(cipher[i]) - s - 97) % 26 + 97)
print(decrypted)
'''
import random
n = int(input())
TAB = []
for i in range(n):
    TAB.append(random.randint(1, 100))
def find_med(list1):
    if 0 in list1:
        for i in range(list1.count(0)):
                list1.remove(0)
    list1.sort()
    if len(list1) % 2 !=0:
        x = list1[len(list1)//2]
    else:
        x = list1[len(list1)//2-1]
    return x
def reduce(list2, x):
    for i in range(len(list2)):
        if x != 0:
            list2[i] = list2[i]%x
    return list2
TEMP = TAB.copy()
print(TAB)
while TEMP:
    if all(item == 0 for item in TAB):
        break
    else:
        TEMP = TAB.copy()
        print(reduce(TAB, find_med(TEMP)))


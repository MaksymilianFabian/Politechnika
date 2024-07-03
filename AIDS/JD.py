import time
import random
import numpy as np

n = int(input("Choose number of elements: "))
randomlist = random.sample(range(0,50000), n)

#A = [7, 18, 4, 0, -3, 5555, 28, 39, 11, 20, 0, -2344]

def generator(n,typ):
    tab = []
    if typ == "losowe":
        for i in range(n):
            tab.append(random.randint(1,10*n))
        return tab
    elif typ == "rosnace":
        for i in range(n):
            tab.append(random.randint(1,10*n))
        tab.sort()
        return tab
    elif typ == "malejace":
        for i in range(n):
            tab.append(random.randint(1,10*n))
        tab.sort(reverse=True)
        return tab
    elif typ == "A":
        for i in range(n):
            tab.append(random.randint(1,10*n))
        left = tab[:n//2]
        right = tab[n//2:]
        left.sort()
        right.sort(reverse=True)
        tab = left+right
        return tab
    elif typ == "V":
        for i in range(n):
            tab.append(random.randint(1,10*n))
            left = tab[:n//2]
            right = tab[n//2:]
            left.sort(reverse=True)
            right.sort()
            tab = left+right
            return tab

# BubbleSort
def BubbleSort(array):
    for i in range(len(array)):
        for j in range(len(array) - i -1):
            if array[j] > array[j+1]:
                array[j], array[j+1] = array[j+1], array[j]
    return array

t1 = time.time()
BubbleSort(randomlist)
t2 = time.time()
et = t2-t1
print("Bubble sort execute time: {:f} \n".format(et))

# InsertSort
def InsertSort(array):
    for i in range(1, len(array)):
        key = array[i]
        j = i-1
        while j>=0 and key < array[j]:
            array[j+1] = array[j]
            j -= 1
        array[j+1] = key
    return array

t1 = time.time()
InsertSort(randomlist)
t2 = time.time()
et = t2-t1
print("Insert sort execute time: {:f} \n".format(et))

# HeapSort
def Heapify(array, n, i):
    n = len(array)
    largest = i
    l = 2*i+1
    r = 2*i+2
    if l < n and array[i] < array[l]:
        largest = l
    if r < n and array[largest] < array[r]:
        largest = r
    if largest != i:
        array[i], array[largest] = array[largest], array[i]
        Heapify(array, n, largest)

def HeapSort(array):
    n = len(array)
    for i in range(n // 2, -1, -1):
        Heapify(array, n, i)
    for i in range(n - 1, 0, -1):
        array[i], array[0] = array[0], array[i]
        Heapify(array, i, 0)

t1 = time.time()
HeapSort(randomlist)
t2 = time.time()
et = t2-t1
print("Heap sort execute time: {:f} \n".format(et))

# MergeSort

def MergeSort(array):
    if len(array) > 1:
        r = len(array)//2
        L = array[:r]
        M = array[r:]
        MergeSort(L)
        MergeSort(M)
        i = j = k = 0
        while i < len(L) and j < len(M):
            if L[i] < M[j]:
                array[k] = L[i]
                i += 1
            else:
                array[k] = M[j]
                j += 1
            k += 1
        while i < len(L):
            array[k] = L[i]
            i += 1
            k += 1
        while j < len(M):
            array[k] = M[j]
            j += 1
            k += 1

t1 = time.time()
MergeSort(randomlist)
t2 = time.time()
et = t2-t1
print("Merge sort execute time: {:f} \n".format(et))

# SelectionSort
def SelectionSort(array):
    size = len(array)
    for step in range(size):
        min_idx = step
        for i in range(step + 1, size):
            if array[i] < array[min_idx]:
                min_idx = i
        (array[step], array[min_idx]) = (array[min_idx], array[step])

t1 = time.time()
SelectionSort(randomlist)
t2 = time.time()
et = t2-t1
print("Selection sort execute time: {:f} \n".format(et))

# QuickSort

def Quicksort(array,left, right):
    swap = 0
    porownanie = 0
    i = left
    j = right
    mid = (left+right)//2
    pivot = array[mid]
    while i<=j:
        while array[i]<pivot:
            i += 1
            porownanie += 1
        while array[j]>pivot:
            j -= 1
            porownanie += 1
        if i<=j:
            porownanie += 1
            temp = array[i]
            array[i]=array[j]
            array[j]=temp
            swap += 1
            i = i+1
            j = j-1
    if left < j:
        Quicksort(array,left,j)
    if right > i:
        Quicksort(array,i,right)

def runquick(array):
    Quicksort(array, 0, len(array)-1)


t1 = time.time()
Quicksort(randomlist, 0, n-1)
t2 = time.time()
et = t2-t1
print("Quick sort execute time: {:f} \n".format(et))

elementy = [100, 200, 500, 1000] # 5000, 10000 ,15000, 20000, 30000, 40000]
algorytmy = [BubbleSort, SelectionSort, InsertSort, MergeSort, runquick, HeapSort]
generatory = ["losowe", "rosnace", "malejace", "A", "V"]

for i in algorytmy:
    for j in generatory:
        l = []
        for k in range(10):
            t = []
            for p in elementy:
                arr = generator(p, j)
                start = time.time()
                i(arr)
                end = time.time()
                t.append(end-start)
            x = np.asarray(t)
            l.append(x)
        y = np.mean(l,axis=0)
        print(y)




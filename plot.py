import matplotlib.pyplot as plt
import sys
import numpy as np

#the input file name
in_file = sys.argv[1]
in_file2 = sys.argv[2]
in_file3 = sys.argv[3]
in_file4 = sys.argv[4]
in_file5 = sys.argv[5]

#get the plot data into a single list
algo_list = open(in_file).read().split("\n")
algo_list2 = open(in_file2).read().split("\n")
algo_list3 = open(in_file3).read().split("\n")
algo_list4 = open(in_file4).read().split("\n")
algo_list5 = open(in_file5).read().split("\n")
del algo_list[-1]
del algo_list2[-1]
del algo_list3[-1]
del algo_list4[-1]
del algo_list5[-1]
print(algo_list2)
print(algo_list)

#get the algorithm name to title the plot
curve_title = in_file.split(".")[0]
curve2_title = in_file2.split(".")[0]
curve3_title = in_file3.split(".")[0]
curve4_title = in_file4.split(".")[0]
curve5_title = in_file5.split(".")[0]

#get a single plot
fig, ax = plt.subplots()

runtime = []
list_size = []
runtime2 = []
list_size2 = []
runtime3 = []
list_size3 = []
runtime4 = []
list_size4 = []
runtime5 = []
list_size5 = []

for i in range(0, len(algo_list), 2):
    runtime.append(int(algo_list[i + 1]))
    list_size.append(int(algo_list[i]))
    runtime2.append(int(algo_list2[i + 1]))
    list_size2.append(int(algo_list2[i]))
runtime2.sort()
list_size2.sort()
print(runtime)
print(list_size)
ax.plot(runtime, list_size, 'r*-' , label=curve_title)
ax.plot(runtime2, list_size2, 'g*-')
plt.show()
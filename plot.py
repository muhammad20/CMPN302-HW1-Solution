import matplotlib.pyplot as plt
import sys
import numpy as np

# the input file name
in_file = "selectionsort_time.txt"
in_file2 = "insertionsort_time.txt"
in_file3 = "mergesort_time.txt"
in_file4 = "quicksort_time.txt"
in_file5 = "hybridsort_time.txt"

# get the plot data into a single list
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

# get the algorithm name to title the plot
curve_title = in_file.split(".")[0]
curve2_title = in_file2.split(".")[0]
curve3_title = in_file3.split(".")[0]
curve4_title = in_file4.split(".")[0]
curve5_title = in_file5.split(".")[0]

# get a single plot
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

#put points to plot in arrays
for i in range(0, len(algo_list), 2):
    runtime.append(int(algo_list[i + 1]))
    list_size.append(int(algo_list[i]))
    runtime2.append(int(algo_list2[i + 1]))
    list_size2.append(int(algo_list2[i]))
    runtime3.append(int(algo_list3[i + 1]))
    list_size3.append(int(algo_list3[i]))
    runtime4.append(int(algo_list4[i + 1]))
    list_size4.append(int(algo_list4[i]))
    runtime5.append(int(algo_list5[i + 1]))
    list_size5.append(int(algo_list5[i]))

ax.plot(list_size, runtime, 'r--', label=curve_title)
ax.plot(list_size2, runtime2, 'g--', label=curve2_title)
ax.plot(list_size3, runtime3, 'b--', label=curve3_title)
ax.plot(list_size4, runtime4, 'y--', label=curve4_title)
ax.plot(list_size5, runtime5, 'c--', label=curve5_title)
ax.legend(loc = 0)
plt.yscale('symlog')
plt.xscale('symlog')
ax.set_xlabel('list size')
ax.set_ylabel('algorithm runtime (ms)')
plt.title('algorithms comparison')
plt.show()

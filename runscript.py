import sys
import os
import random

data_count = sys.argv[1]
out_file = sys.argv[2]
data = []
with open(out_file, "w") as file:
    for i in range(int(data_count)):
        randint = random.randint(1, 1000000)
        data.append(randint)
        line = str(randint) + '\n'
        file.write(line)

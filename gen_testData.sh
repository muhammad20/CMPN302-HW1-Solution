#!/bin/bash

#randomly generate datasets of different sizes 
python runscript.py 1000 data1k.txt
python runscript.py 5000 data5k.txt
python runscript.py 10000 data10k.txt
python runscript.py 50000 data50k.txt
python runscript.py 75000 data75k.txt
python runscript.py 100000 data100k.txt
python runscript.py 500000 data500k.txt

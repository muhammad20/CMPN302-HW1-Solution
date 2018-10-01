# Hybrid Sorting Algorithm 

Firstly, I didn't have much time to think of a good hybrid algorithm,
however I see that the divide and conquer strategy is a very good strategy that I should
include it in my hybrid algorithm. <br>
First thing that came to my mind is to know how much the array is sorted (a percentage). If the array is 100% sorted We will just return the array as is in this case it would be O(n). <br>
Secondly, if the array is not nearly sorted we should use quick sort (best performer on random data). <br>
Then if the array is sufficiently small, we should use insertion sort. <br>
I searched the internet about a hybrid mergesort and it got me to a method for combining the insertion sort with merge sort, same idea that came to my mind. <br>
In that way the algorithm would perform better on nearly sorted data and also small data would take lesser space complexity. <br> <br>
here is the link https://web.stanford.edu/class/archive/cs/cs106b/cs106b.1138/lectures/13/Slides13.pdf <br>

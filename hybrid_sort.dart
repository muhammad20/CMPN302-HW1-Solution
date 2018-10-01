part of 'sorter.dart';

enum sortedState { notSorted, nearlySorted, sorted }

class _HybridSort {
  static sortedState _sortedState(List<int> unsortedList) {
    int count = 0;
    for (int i = 1; i < unsortedList.length; i++) {
      if (unsortedList[i] >= unsortedList[i - 1]) {
        count++;
      }
    }
    num ratio = count / (unsortedList.length - 1);
    if (ratio.toInt() == 1) {
      return sortedState.sorted;
    }
    if (ratio > 0.66) {
      return sortedState.nearlySorted;
    }
    return sortedState.notSorted;
  }

  static void _sort(List<int> unsortedList) {
    var state = _sortedState(unsortedList);
    if (state == sortedState.sorted) return;
    if (unsortedList.length <= 1000) {
      //to save memory use a simple algorithm for small data
      _SelectionSort._sort(unsortedList);
      return;
    }

    if (state == sortedState.nearlySorted) {
      //should work on data that is nearly sorted (more than 66% sorted)
      _hybridSort(unsortedList);
    }
    //quick sort performs best on random data (expectedly sorted with percentage less than 60%)
    else {
      _QuickSort._sort(unsortedList, 0, unsortedList.length - 1);
    }
  }

  // minimum size for the array to use insertion sort,
  // number picked by experimenting to take time less than 1 millisecond
  static int minSize = 80;

  //same like merge sort but use 2 external arrays outside of function to
  //perform insertion sort on them
  static void _hybridSort(List<int> unsortedList) {
    if (unsortedList.length <= minSize) {
      _InsertionSort._sort(unsortedList);
    } else {
      List<int> leftList = List<int>();
      List<int> rightList = List<int>();
      for (int i = 0; i < (unsortedList.length / 2).floor(); i++) {
        leftList.add(unsortedList[i]);
      }
      for (int i = (unsortedList.length / 2).floor();
          i < unsortedList.length;
          i++) {
        rightList.add(unsortedList[i]);
      }
      _hybridSort(leftList);
      _hybridSort(rightList);
      _hybridMerge(unsortedList, leftList, rightList);
    }
  }

  static void _hybridMerge(
      List<int> unsortedList, List<int> leftList, List<int> rightList) {
    int l = 0;
    int r = 0;
    int k = 0;
    while (l < leftList.length && r < rightList.length) {
      if (leftList[l] <= rightList[r]) {
        unsortedList[k] = leftList[l];
        l++;
      } else {
        unsortedList[k] = rightList[r];
        r++;
      }
      k++;
    }

    while (l < leftList.length) {
      unsortedList[k] = leftList[l];
      l++;
      k++;
    }

    while (r < rightList.length) {
      unsortedList[k] = rightList[r];
      r++;
      k++;
    }
  }
}

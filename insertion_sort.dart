part of 'sorter.dart';

class _InsertionSort {
  static void _sort(List<int> unsortedList) {
    for (int i = 1; i < unsortedList.length; i++) {
      int j = i - 1;
      int key = unsortedList[i];
      while (j >= 0 && key <= unsortedList[j]) {
        unsortedList[j + 1] = unsortedList[j];
        unsortedList[j] = key;
        j--;
      }
    }
  }
}

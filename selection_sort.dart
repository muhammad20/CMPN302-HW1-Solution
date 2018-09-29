part of 'sorter.dart';

class _SelectionSort {
  static void _sort(List<int> unsortedList) {
    int pivotIndex;
    int temp;
    for (int i = 0; i < unsortedList.length; i++) {
      pivotIndex = i;
      for (int j = i + 1; j < unsortedList.length; j++) {
        if (unsortedList[j] <= unsortedList[pivotIndex]) {
          pivotIndex = j;
        }
      }
      temp = unsortedList[pivotIndex];
      unsortedList[pivotIndex] = unsortedList[i];
      unsortedList[i] = temp;
    }
  }
}

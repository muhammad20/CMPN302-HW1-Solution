part of 'sorter.dart';

/// have a static function for `QuickSort` to be called by Sorter
/// in [_quickSort] `sortingAlgorithm` function in `Sorter` class.
class _QuickSort {
  static int _partition(List<int> unsortedList, int left, int pivot) {
    int x = unsortedList[pivot];
    int i = left - 1;
    int temp;
    for (int j = left; j < pivot; j++) {
      if (unsortedList[j] <= x) {
        i++;
        temp = unsortedList[j];
        unsortedList[j] = unsortedList[i];
        unsortedList[i] = temp;
      }
    }
    temp = unsortedList[i + 1];
    unsortedList[i + 1] = unsortedList[pivot];
    unsortedList[pivot] = temp;
    return ++i;
  }

  static void _sort(List<int> unsortedList, int left, int pivot) {
    if(left < pivot) {
      int wall = _partition(unsortedList, left, pivot);
      _sort(unsortedList, left, wall - 1);
      _sort(unsortedList, wall + 1, pivot);
    }
  }
}

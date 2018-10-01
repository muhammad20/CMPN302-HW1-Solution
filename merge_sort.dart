part of 'sorter.dart';

/// have a static function for `MergeSort` to be called by Sorter
/// in [_sort] `sortingAlgorithm` function in `Sorter` class.
class _MergeSort {
  static void _merge(List<int> unsortedList, int left, int mid, int right) {
    //left and right lists lengths
    int n_leftList = mid - left + 1;
    int n_rightList = right - mid;

    List<int> leftList = List<int>(n_leftList);
    List<int> rightList = List<int>(n_rightList);

    for (int i = 0; i < n_leftList; i++) {
      leftList[i] = unsortedList[i + left];
    }
    for (int i = 0; i < n_rightList; i++) {
      rightList[i] = unsortedList[mid + 1 + i];
    }

    int l = 0;
    int r = 0;
    int k = left;
    while (l < n_leftList && r < n_rightList) {
      if (leftList[l] <= rightList[r]) {
        unsortedList[k] = leftList[l];
        l++;
      } else {
        unsortedList[k] = rightList[r];
        r++;
      }
      k++;
    }

    while (l < n_leftList) {
      unsortedList[k] = leftList[l];
      l++;
      k++;
    }

    while (r < n_rightList) {
      unsortedList[k] = rightList[r];
      r++;
      k++;
    }
  }

  static void _sort(List<int> unsortedList, int start, int end) {
    if (start >= end) return;
    num mid_double = (start + end) / 2;
    int mid = mid_double.floor();
    _sort(unsortedList, start, mid);
    _sort(unsortedList, mid + 1, end);
    _merge(unsortedList, start, mid, end);
  }
}

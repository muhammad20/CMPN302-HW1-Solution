part 'merge_sort.dart';
part 'selection_sort.dart';
part 'hybrid_sort.dart';
part 'insertion_sort.dart';
part 'quick_sort.dart';

//takes a list of integers
typedef sortingFunction = num Function(List<int> unsortedList);

class Sorter {
  Map<num, Function> sortingAlgorithms;

  sortingFunction _mergeSort = (unsortedList) {
    Stopwatch stopwatch = Stopwatch()..start();
    _MergeSort._mergeSort(unsortedList, 0, unsortedList.length - 1);
    return stopwatch.elapsedMilliseconds;
  };

  sortingFunction _hybridSort = (unsortedList) {
    Stopwatch stopwatch = Stopwatch()..start();
    return stopwatch.elapsedMilliseconds;
  };

  sortingFunction _quickSort = (unsortedList) {
    Stopwatch stopwatch = Stopwatch()..start();
    _QuickSort._sort(unsortedList, 0, unsortedList.length - 1);
    return stopwatch.elapsedMilliseconds;
  };

  sortingFunction _insertionSort = (unsortedList) {
    Stopwatch stopwatch = Stopwatch()..start();
    _InsertionSort._sort(unsortedList);
    return stopwatch.elapsedMilliseconds;
  };

  sortingFunction _selectionSort = (unsortedList) {
    Stopwatch stopwatch = Stopwatch()..start();
    _SelectionSort._sort(unsortedList);
    return stopwatch.elapsedMilliseconds;
  };

  Sorter() {
    sortingAlgorithms = <num, Function>{
      2: _mergeSort,
      3: _quickSort,
      1: _insertionSort,
      0: _selectionSort,
      4: _hybridSort
    };
  }

  String getAlgorithmName(int key) {
    switch (key) {
      case 0:
        return 'selection sort';
      case 1:
        return 'insertion sort';
      case 2:
        return 'merge sort';
      case 3:
        return 'quick sort';
      case 4:
        return 'hybrid sort';
      default:
        return null;
    }
  }

  sortAll(List list) {
    sortingAlgorithms.forEach((key, sortingAlgorithm) {
      sortingAlgorithm(list);
    });
  }
}

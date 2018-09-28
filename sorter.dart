typedef sortingFunction = num Function(List<num> unsortedList);

class Sorter {
  Map<num, Function> sortingAlgorithms;

  sortingFunction _mergeSort = (unsortedList) {
    Stopwatch stopwatch = Stopwatch()..start();
    return stopwatch.elapsedMilliseconds;
  };

  sortingFunction _hybridSort = (unsortedList) {
    Stopwatch stopwatch = Stopwatch()..start();
    return stopwatch.elapsedMilliseconds;
  };

  sortingFunction _quickSort = (unsortedList) {
    Stopwatch stopwatch = Stopwatch()..start();
    unsortedList.add(unsortedList.last);
    return stopwatch.elapsedMilliseconds;
  };

  sortingFunction _insertionSort = (unsortedList) {
    Stopwatch stopwatch = Stopwatch()..start();
    for (int i = 1; i < unsortedList.length; i++) {
      int j = i - 1;
      int key = unsortedList[i];
      while (j >= 0 && key <= unsortedList[j]) {
        unsortedList[j + 1] = unsortedList[j];
        unsortedList[j] = key;
        j--;
      }
    }
    return stopwatch.elapsedMilliseconds;
    //print(unsortedList);
  };

  sortingFunction _selectionSort = (unsortedList) {
    Stopwatch stopwatch = Stopwatch()..start();
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
    switch(key) {
      case 0: {
        return 'selection sort';
      }
      case 1: {
        return 'insertion sort';
      }
      case 2: {
        return 'merge sort';
      }
      case 3: {
        return 'quick sort';
      }
      case 4: {
        return 'hybrid sort';
      }
      default: return null;
    }
  }

  sortAll(List list) {
    sortingAlgorithms.forEach((key, sortingAlgorithm) {
      sortingAlgorithm(list);
    });
  }
}

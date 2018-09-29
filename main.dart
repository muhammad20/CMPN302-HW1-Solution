import 'dart:io';
import 'file_handler.dart';
import 'sorter.dart';

void main(List<String> args) async {
  /// check that CL arguments are 4 or more
  /// discard the rest.
  if (args.length < 4) {
    print('missing argument(s)\n'
        'should contain 4 arguments:\n'
        '1: algorithm code: \n'
        '  0 - selection sort\n'
        '  1 - insertion sort\n'
        '  2 - merge sort\n'
        '  3 - quick sort\n'
        '  4 - hybrid sort\n'
        '2: input data file\n'
        '3: output filename of sorted data\n'
        '4: output filename for time taken by the algorithm to finish\n');
    exit(1);
  }

  /// parse first argument to algorithm code.
  int algorithmCode = int.tryParse(args[0]);
  if (algorithmCode == null || algorithmCode < 0 || algorithmCode > 4) {
    print('error! algorithm code shoud be a number:\n'
        '  0 - selection sort\n'
        '  1 - insertion sort\n'
        '  2 - merge sort\n'
        '  3 - quick sort\n'
        '  4 - hybrid sort\n');
    exit(2);
  }

  String inputFilename = args[1];
  List<int> data = await FileHandler.readInputData(inputFilename);

  if(data == null) exit(3);

  if (data.length < 2) {
    print('error! file only contains 1 element, no need to sort!\n');
    exit(4);
  }

  String sortedDataFilename = args[2];

  Sorter sorter = Sorter();

  int executionTime = sorter.sortingAlgorithms[algorithmCode](data);

  print('execution time in milliseconds: ${executionTime}');

  FileHandler.writeDataToFile(data, sortedDataFilename);

  String algorithmExecutionTimeFilename = args[3];

  FileHandler.writeDataToFile(
      '${data.length} elements sorted '
      'in: ${executionTime} milliseconds.\n',
      algorithmExecutionTimeFilename);
}

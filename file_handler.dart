import 'dart:async';
import 'dart:io';
import 'dart:convert';

class FileHandler {
  /// returns a `List<int>` initialized with unsorted data from [filename].
  static Future<List<int>> readInputData(String filename) async {
    // check that the file exists in the current working directory.
    if (FileSystemEntity.typeSync(filename) == FileSystemEntityType.notFound) {
      print('error! file not found.');
      return null;
    }

    var file;
    file = File(filename);
    Completer<List<int>> futureData = Completer<List<int>>();
    List<int> data = List<int>();

    /// read data from file, encode to utf-8 format,
    /// convert stream to individual line,
    /// parse to int then add to list of data to be returned.
    Stream<List<int>> inputStream = file.openRead();
    inputStream.transform(utf8.decoder).transform(LineSplitter()).listen(
        (String line) {
      data.add(int.parse(line));
    }, onDone: () => futureData.complete(data));
    return futureData.future;
  }

  /// writes all values in [data] each value in a separate line
  /// to a file with [filename].
  static void writeDataToFile(dynamic data, String filename, {FileMode mode, bool isAlreadySorted}) async {
    var file = File(filename);
    var sink = file.openWrite(mode: mode ?? FileMode.write);
    if (data is List) {
      for (int value in data) {
        sink.write(value);
        sink.write('\n');
      }
    }
    else if (data is String) {
      sink.write(data);
      await sink.write('\n');
    }
    await sink.close();
  }
}

import 'package:path_provider/path_provider.dart';
import 'dart:io';

class CacheService {
  Future<void> writeData(String data) async {
    final directory = await getApplicationDocumentsDirectory();
    final file = File('${directory.path}/data.txt');
    await file.writeAsString(data);
  }

  Future<String> readData() async {
    try {
      final directory = await getApplicationDocumentsDirectory();
      final file = File('${directory.path}/data.txt');
      return await file.readAsString();
    } catch (e) {
      return 'Error reading data';
    }
  }
}

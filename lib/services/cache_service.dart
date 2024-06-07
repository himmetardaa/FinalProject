import 'dart:io';
import 'package:path_provider/path_provider.dart';

class CacheService {
  Future<void> saveImageToCache(String fileName, File image) async {
    try {
      final Directory appCacheDir = await getApplicationCacheDirectory();
      final File file = File("${appCacheDir.path}/$fileName");
      await file.writeAsBytes(await image.readAsBytes(), flush: true);
    } catch (e) {
      print('Error saving image to cache: $e');
    }
  }

  Future<File?> readImageFromCache(String fileName) async {
    try {
      final Directory appCacheDir = await getApplicationCacheDirectory();
      final File file = File("${appCacheDir.path}/$fileName");
      if (await file.exists()) {
        return file;
      } else {
        return null;
      }
    } catch (e) {
      print('Error reading image from cache: $e');
      return null;
    }
  }
}

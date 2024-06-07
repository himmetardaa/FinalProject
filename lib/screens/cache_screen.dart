import 'dart:io';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';
import '../services/cache_service.dart';

class CacheScreen extends StatefulWidget {
  @override
  _CacheScreenState createState() => _CacheScreenState();
}

class _CacheScreenState extends State<CacheScreen> {
  final CacheService _cacheService = CacheService();
  String _cacheData = "No data";
  File? _image;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Cache Screen'),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            _image != null
                ? kIsWeb
                    ? Image.network(_image!.path,
                        height: 200) // Web için Image.network
                    : Image.file(_image!, height: 200) // Mobil için Image.file
                : const Text('No image selected'),
            // Resim yoksa mesaj
            const SizedBox(height: 20),
            ElevatedButton(
              onPressed: () async {
                // Resim seçme işlemi
                final pickedFile =
                    await ImagePicker().getImage(source: ImageSource.gallery);
                if (pickedFile != null) {
                  setState(() {
                    _image = File(pickedFile.path);
                    _cacheData = "Image selected";
                  });
                  // Seçilen resmi önbelleğe kaydetme
                  await _cacheService.saveImageToCache(
                      "cached_image.jpg", _image!);
                }
              },
              child: const Text('Select Image'),
            ),

            ElevatedButton(
              onPressed: () async {
                // Önbellekten resmi okuma
                File? image =
                    await _cacheService.readImageFromCache("cached_image.jpg");
                if (image != null) {
                  setState(() {
                    _image = image;
                    _cacheData = "Image loaded from cache";
                  });
                } else {
                  setState(() {
                    _cacheData = "No image in cache";
                  });
                }
              },
              child: const Text('Read from Cache'),
            ),
            const SizedBox(height: 20),
            Text(_cacheData),
          ],
        ),
      ),
    );
  }
}

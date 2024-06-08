import 'dart:io';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';
import '../localization/app_localization.dart';
import '../services/cache_service.dart';

class CacheScreen extends StatefulWidget {
  @override
  _CacheScreenState createState() => _CacheScreenState();
}

class _CacheScreenState extends State<CacheScreen> {
  final CacheService _cacheService = CacheService();
  String _cacheData = '';
  File? _image;

  @override
  void didChangeDependencies() {
    super.didChangeDependencies();
    _cacheData = AppLocalizations.of(context).getTranslate('no_image');
  }

  @override
  Widget build(BuildContext context) {
    var localizations = AppLocalizations.of(context);
    return Scaffold(
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Container(
              width: 300,
              height: 300,
              color: Colors.grey[800],
              child: _image != null
                  ? kIsWeb
                      ? Image.network(_image!.path,
                          height: 200,
                          fit: BoxFit.cover) // Web için Image.network
                      : Image.file(_image!,
                          height: 200,
                          fit: BoxFit.cover) // Mobil için Image.file
                  : Center(
                      child: Text(
                        _cacheData,
                        style: const TextStyle(color: Colors.white),
                        textAlign: TextAlign.center,
                      ),
                    ), // Resim yoksa mesaj
            ),
            const SizedBox(height: 20),
            ElevatedButton(
              onPressed: () async {
                // Resim seçme işlemi
                final pickedFile =
                    await ImagePicker().getImage(source: ImageSource.gallery);
                if (pickedFile != null) {
                  setState(() {
                    _image = File(pickedFile.path);
                    // _cacheData = "Image selected";
                  });
                  // Seçilen resmi önbelleğe kaydetme
                  await _cacheService.saveImageToCache(
                      "cached_image.jpg", _image!);
                }
              },
              style: ElevatedButton.styleFrom(
                backgroundColor: Colors.purple,
                padding:
                    const EdgeInsets.symmetric(horizontal: 50, vertical: 15),
              ),
              child: Text(localizations.getTranslate('select_image')),
            ),
            const SizedBox(height: 10),
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
                    // _cacheData = "No image in cache";
                  });
                }
              },
              style: ElevatedButton.styleFrom(
                backgroundColor: Colors.red,
                padding:
                    const EdgeInsets.symmetric(horizontal: 50, vertical: 15),
              ),
              child: Text(localizations.getTranslate('read_cache')),
            ),
            const SizedBox(height: 20),
            Text(
              _cacheData,
              style: const TextStyle(color: Colors.white),
            ),
          ],
        ),
      ),
    );
  }
}

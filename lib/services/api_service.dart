// Gerekli Flutter paketlerini içe aktarıyoruz.
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'dart:convert'; // JSON işlemleri için.
import 'dart:typed_data'; // Uint8List kullanımı için.
import 'package:http/http.dart' as http; // HTTP istekleri için.

// Riverpod provider tanımlıyoruz.
// HomeProvider sınıfını ChangeNotifierProvider ile sağlayarak, state yönetimini sağlıyoruz.
final api_provider =
    ChangeNotifierProvider<ApiProvider>((ref) => ApiProvider());

class ApiProvider extends ChangeNotifier {
  // State değişkenleri tanımlıyoruz.
  bool isLoading = false; // Yüklenme durumunu tutar.
  bool isSearching = false; // Arama durumunu tutar.
  Uint8List? imageData; // API'den gelen görüntü verilerini tutar.

  // Yüklenme durumunu değiştiren fonksiyon.
  void loadingChange(bool val) {
    isLoading = val;
    notifyListeners(); // Değişikliği dinleyicilere bildirir.
  }

  // Arama durumunu değiştiren fonksiyon.
  void searchingChange(bool val) {
    isSearching = val;
    notifyListeners(); // Değişikliği dinleyicilere bildirir.
  }

  // Kullanıcının girdiği metni alıp, API'ye göndererek görüntü oluşturur.
  Future<dynamic> textToImage(String prompt, BuildContext context) async {
    // API ile ilgili gerekli bilgiler.
    String engineId = "stable-diffusion-v1-6";
    String apiHost = 'https://api.stability.ai';
    String apiKey = 'sk-6jFnGeUiNpmNXCnx1z43WJkRySWl9DHMWTrf5sjiqJppN4a7';

    // Kullanıcıdan alınan metni debug konsoluna yazdırıyoruz.
    debugPrint(prompt);

    // API'ye POST isteği gönderiyoruz.
    final response = await http.post(
        Uri.parse('$apiHost/v1/generation/$engineId/text-to-image'),
        headers: {
          "Content-Type": "application/json", // İstek türü JSON olacak.
          "Accept": "image/png", // Yanıt türü PNG olacak.
          "Authorization": "Bearer $apiKey" // API anahtarımız.
        },
        body: jsonEncode({
          "text_prompts": [
            {
              "text": prompt, // Kullanıcının girdiği metin.
              "weight": 1, // Metnin ağırlığı.
            }
          ],
          "cfg_scale": 7, // CFG ölçeği.
          "height": 1024, // Görüntü yüksekliği.
          "width": 1024, // Görüntü genişliği.
          "samples": 1, // Örnek sayısı.
          "steps": 30, // Adım sayısı.
        }));

    // API yanıtını kontrol ediyoruz.
    if (response.statusCode == 200) {
      try {
        debugPrint(
            response.statusCode.toString()); // Durum kodunu yazdırıyoruz.
        imageData = response.bodyBytes; // Yanıtı byte array olarak alıyoruz.
        loadingChange(true); // Yüklenme durumunu değiştiriyoruz.
        searchingChange(false); // Arama durumunu değiştiriyoruz.
        notifyListeners(); // Değişiklikleri dinleyicilere bildiriyoruz.
      } on Exception {
        debugPrint(
            "failed to generate image"); // Hata durumunda mesaj yazdırıyoruz.
      }
    } else {
      debugPrint(
          "failed to generate image"); // Yanıt başarısızsa hata mesajı yazdırıyoruz.
    }
  }
}

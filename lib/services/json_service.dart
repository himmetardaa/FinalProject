import 'dart:convert';
import 'package:flutter/services.dart' show rootBundle;

class JsonService {
  Future<Map<String, dynamic>> loadJson() async {
    final String response = await rootBundle.loadString('assets/data.json');
    return json.decode(response);
  }
}

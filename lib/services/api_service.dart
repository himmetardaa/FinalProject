import 'package:http/http.dart' as http;

class ApiService {
  Future<void> fetchData() async {
    final response = await http.get(Uri.parse('https://api.example.com/data'));
    // İşlem yapılacak.
  }
}

import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:go_router/go_router.dart';

class SplashScreen extends StatefulWidget {
  const SplashScreen({Key? key}) : super(key: key);

  @override
  _SplashScreenState createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  @override
  void initState() {
    super.initState();
    _navigate();
  }

  void _navigate() async {
    await Future.delayed(const Duration(seconds: 2)); // Simulate a splash screen delay

    SharedPreferences prefs = await SharedPreferences.getInstance();
    bool isFirstTime = prefs.getBool('isFirstTime') ?? true;

    print(isFirstTime); /*BURADA FİRST TİME ADAM AKILLI KAYDEDİLMİŞMİ DİYE KONTROL EDİYORUM*/
    // true döndürüyor!!!
    // false döndürmesi lazım
    // ama boarding_Screen.dart ta done a basıldığı zaman false olarak güncellemesi gerektiğini göreceksin
    if (isFirstTime) {
      context.go('/boarding');
    } else {
      context.go('/home');
    }
  }

  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      body: Center(
        child: Text('Splash Screen'),
      ),
    );
  }
}

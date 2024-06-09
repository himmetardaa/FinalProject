import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart' show rootBundle;
import 'package:shared_preferences/shared_preferences.dart';
import 'package:go_router/go_router.dart';

class SplashScreen extends StatefulWidget {
  const SplashScreen({Key? key}) : super(key: key);

  @override
  _SplashScreenState createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  late String logoPath;
  late Color backgroundColor;
  late int duration;

  @override
  void initState() {
    super.initState();
    _loadConfig();
  }

  Future<void> _loadConfig() async {
    final String response =
        await rootBundle.loadString('assets/splash_config.json');
    final Map<String, dynamic> configData = json.decode(response);

    setState(() {
      logoPath = configData['logo'];
      backgroundColor = _hexToColor(configData['backgroundColor']);
      duration = configData['duration'];
    });

    await Future.delayed(
        Duration(milliseconds: duration)); // Use the duration from JSON

    SharedPreferences prefs = await SharedPreferences.getInstance();
    bool isFirstTime = prefs.getBool('isFirstTime') ?? true;

    if (isFirstTime) {
      context.go('/boarding');
    } else {
      context.go('/home');
    }
  }

  Color _hexToColor(String hex) {
    hex = hex.replaceFirst('#', '');
    if (hex.length == 6) {
      hex = 'FF' + hex;
    }
    return Color(int.parse(hex, radix: 16));
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: backgroundColor,
      body: Center(
        child: logoPath.isNotEmpty
            ? Image.asset(logoPath)
            : CircularProgressIndicator(),
      ),
    );
  }
}

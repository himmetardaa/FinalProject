import 'package:flutter/material.dart';
import 'package:final_project/router.dart';
import 'package:final_project/themes/app_themes.dart';

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp.router(
      theme: AppThemes.lightTheme,
      darkTheme: AppThemes.darkTheme,
      routerConfig: router,
    );
  }
}

import 'package:final_project/screens/cache_screen.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:final_project/screens/home_screen.dart';
import 'package:final_project/screens/setting_screen.dart';
import 'package:final_project/screens/splash_screen.dart';
import 'package:final_project/screens/boarding_screen.dart';
import 'package:final_project/screens/photo_upload_screen.dart';

import 'localization/app_localization.dart';
import 'screens/textoimage_screen.dart';
import 'widgets/burger_menu.dart';

final GoRouter router = GoRouter(
  routes: [
    ShellRoute(
      builder: (context, state, child) {
        return Scaffold(
          appBar: AppBar(
              title:
                  Text(AppLocalizations.of(context).getTranslate("appTitle"))),
          drawer: BurgerMenu(),
          body: child,
        );
      },
      routes: [
        GoRoute(
          path: '/',
          builder: (context, state) => SplashScreen(),
        ),
        GoRoute(
          path: '/home',
          builder: (context, state) => HomeScreen(),
        ),
        GoRoute(
          path: '/settings',
          builder: (context, state) => SettingsScreen(),
        ),
        GoRoute(
          path: '/boarding',
          builder: (context, state) => BoardingScreen(),
        ),
        GoRoute(
          path: '/upload',
          builder: (context, state) => PhotoUploadScreen(),
        ),
        GoRoute(
          path: '/textoimage',
          builder: (context, state) => TexttoImage(),
        ),
        GoRoute(
          path: '/cache',
          builder: (context, state) => CacheScreen(),
        ),
      ],
    ),
  ],
);

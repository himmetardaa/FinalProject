import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_localizations/flutter_localizations.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:permission_handler/permission_handler.dart';
import 'cubit/app_cubit.dart';
import 'cubit/app_state.dart';
import 'localization/app_localization.dart';
import 'router.dart';
import 'themes/app_themes.dart';

// Cache Provider
final cacheProvider = ChangeNotifierProvider((ref) => CacheProvider());

class CacheProvider extends ChangeNotifier {
  final Map<String, String> _cache = {};

  void addToCache(String key, String value) {
    _cache[key] = value;
    notifyListeners();
  }

  String? getFromCache(String key) {
    return _cache[key];
  }

  void clearCache() {
    _cache.clear();
    notifyListeners();
  }
}

void main() async {
  WidgetsFlutterBinding.ensureInitialized();

  await Permission.notification.isDenied.then((value) {
    if (value) {
      Permission.notification.request();
    }
  });

  await SystemChrome.setPreferredOrientations([DeviceOrientation.portraitUp]);

  runApp(ProviderScope(child: MainApp()));
}

class MainApp extends StatelessWidget {
  const MainApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => AppCubit(AppState(language: "en", darkMode: false)),
      child: BlocBuilder<AppCubit, AppState>(
        builder: (context, state) {
          return MaterialApp.router(
            routerConfig: router,
            debugShowCheckedModeBanner: false,
            localizationsDelegates: const [
              AppLocalizations.delegate,
              GlobalMaterialLocalizations.delegate,
              GlobalCupertinoLocalizations.delegate,
              GlobalWidgetsLocalizations.delegate,
            ],
            supportedLocales: const [
              Locale('en', 'US'),
              Locale('tr', 'TR'),
            ],
            themeMode: state.darkMode ? ThemeMode.dark : ThemeMode.light,
            theme: AppThemes.lightTheme,
            darkTheme: AppThemes.darkTheme,
            locale: Locale(state.language),
          );
        },
      ),
    );
  }
}

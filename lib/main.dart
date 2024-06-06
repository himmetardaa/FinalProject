import 'package:final_project/themes/app_themes.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:final_project/app.dart';
import 'package:final_project/cubit/app_cubit.dart';
import 'package:flutter_localizations/flutter_localizations.dart';
import 'package:permission_handler/permission_handler.dart';
import 'cubit/app_state.dart';
import 'localization/app_localization.dart';
import 'router.dart';

void main() async {
  // Flutter framework'ünü başlat
  WidgetsFlutterBinding.ensureInitialized();

  // Bildirim iznini kontrol et ve gerekirse iste
  await Permission.notification.isDenied.then((value) {
    if (value) {
      Permission.notification.request();
    }
  });

  // Cihazın yönünü yalnızca dikey olarak ayarlayın
  await SystemChrome.setPreferredOrientations([DeviceOrientation.portraitUp]);

  // Uygulamayı başlat
  runApp(const MainApp());
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

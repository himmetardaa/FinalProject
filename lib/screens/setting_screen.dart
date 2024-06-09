import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:go_router/go_router.dart';

import '../cubit/app_cubit.dart';
import '../cubit/app_state.dart';
import '../localization/app_localization.dart';

class SettingsScreen extends StatelessWidget {
  const SettingsScreen({Key? key}) : super(key: key);

  Future<void> _resetOnboarding(BuildContext context) async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    await prefs.clear();

    // Navigate back to the splash screen
    context.go('/');
  }

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<AppCubit, AppState>(
      builder: (context, state) {
        return Scaffold(
          appBar: AppBar(
            title: Text(
              AppLocalizations.of(context).getTranslate("settings"),
            ),
          ),
          body: Padding(
            padding: const EdgeInsets.all(16.0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  AppLocalizations.of(context).getTranslate("language"),
                  style: const TextStyle(
                    fontSize: 20,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    ElevatedButton(
                      onPressed: state.language == "en"
                          ? null
                          : () {
                              context
                                  .read<AppCubit>()
                                  .changeLanguage(language: "en");
                            },
                      child: const Text("English"),
                    ),
                    const SizedBox(width: 20),
                    ElevatedButton(
                      onPressed: state.language == "tr"
                          ? null
                          : () {
                              context
                                  .read<AppCubit>()
                                  .changeLanguage(language: "tr");
                            },
                      child: const Text("Türkçe"),
                    ),
                  ],
                ),
                const SizedBox(height: 20),
                Text(
                  AppLocalizations.of(context).getTranslate("theme"),
                  style: const TextStyle(
                    fontSize: 20,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                SwitchListTile(
                  title: Text(
                      AppLocalizations.of(context).getTranslate("dark_mode")),
                  value: state.darkMode,
                  onChanged: (bool value) {
                    context.read<AppCubit>().changeDarkMode(darkMode: value);
                  },
                ),
              ],
            ),
          ),
        );
      },
    );
  }
}

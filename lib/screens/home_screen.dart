import 'package:flutter/material.dart';
import '../localization/app_localization.dart';

class HomeScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    var localizations = AppLocalizations.of(context);

    return Scaffold(
      appBar: AppBar(
        title: Text(localizations.getTranslate('homeScreenTitle')),
      ),
      body: Center(
        child: Text(localizations.getTranslate('homeScreenTitle')),
      ),
    );
  }
}

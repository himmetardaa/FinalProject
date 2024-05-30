import 'package:flutter/material.dart';

import '../localization/app_localization.dart';

class BoardingScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Center(
        child:
            Text(AppLocalizations.of(context).getTranslate("boarding_screen")));
  }
}

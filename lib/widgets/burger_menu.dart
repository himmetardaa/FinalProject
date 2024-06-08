import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

import '../localization/app_localization.dart';

class BurgerMenu extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    var localizations = AppLocalizations.of(context);
    return Drawer(
      child: ListView(
        children: [
          DrawerHeader(
            child: Text(localizations.getTranslate('menu')),
          ),
          ListTile(
            title: Text(localizations.getTranslate('home')),
            onTap: () => context.go('/home'),
          ),
          ListTile(
            title: Text(localizations.getTranslate('settings')),
            onTap: () => context.go('/settings'),
          ),
          ListTile(
            title: Text('Boarding'),
            onTap: () => context.go('/boarding'),
          ),
          ListTile(
            title: Text(localizations.getTranslate('upload_photo')),
            onTap: () => context.go('/upload'),
          ),
          ListTile(
            title: Text(localizations.getTranslate('texttoimage')),
            onTap: () => context.go('/textoimage'),
          ),
          ListTile(
            title: Text(localizations.getTranslate('cache')),
            onTap: () => context.go('/cache'),
          ),
        ],
      ),
    );
  }
}

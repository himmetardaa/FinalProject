import 'package:final_project/localization/app_localization.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

class BurgerMenu extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Drawer(
      child: ListView(
        children: [
          DrawerHeader(
            child: Text(AppLocalizations.of(context).getTranslate('menu')),
          ),
          ListTile(
            title: Text(AppLocalizations.of(context).getTranslate('home')),
            onTap: () => context.go('/home'),
          ),
          ListTile(
            title: Text(AppLocalizations.of(context).getTranslate('settings')),
            onTap: () => context.go('/settings'),
          ),
          ListTile(
            title: Text(AppLocalizations.of(context).getTranslate('board')),
            onTap: () => context.go('/boarding'),
          ),
          ListTile(
            title: Text(AppLocalizations.of(context).getTranslate('upload_photo')),
            onTap: () => context.go('/upload'),
          ),
          ListTile(
            title: const Text('Text to Image'),
            onTap: () => context.go('/textoimage'),
          ),
        ],
      ),
    );
  }
}

import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

class BurgerMenu extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Drawer(
      child: ListView(
        children: [
          DrawerHeader(
            child: Text('Menu'),
          ),
          ListTile(
            title: Text('Home'),
            onTap: () => context.go('/home'),
          ),
          ListTile(
            title: Text('Settings'),
            onTap: () => context.go('/settings'),
          ),
          ListTile(
            title: Text('Boarding'),
            onTap: () => context.go('/boarding'),
          ),
          ListTile(
            title: Text('Upload Photo'),
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

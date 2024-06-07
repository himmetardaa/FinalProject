import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

class BurgerMenu extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Drawer(
      child: ListView(
        children: [
          const DrawerHeader(
            child: Text('Menu'),
          ),
          ListTile(
            title: const Text('Home'),
            onTap: () => context.go('/home'),
          ),
          ListTile(
            title: const Text('Settings'),
            onTap: () => context.go('/settings'),
          ),
          ListTile(
            title: const Text('Boarding'),
            onTap: () => context.go('/boarding'),
          ),
          ListTile(
            title: const Text('Upload Photo'),
            onTap: () => context.go('/upload'),
          ),
          ListTile(
            title: const Text('Text to Image'),
            onTap: () => context.go('/textoimage'),
          ),
          ListTile(
            title: const Text('Cache Screen'),
            onTap: () => context.go('/cache'),
          ),
        ],
      ),
    );
  }
}

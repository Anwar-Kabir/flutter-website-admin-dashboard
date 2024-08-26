import 'package:flutter/material.dart';

class Header extends StatelessWidget {
  final GlobalKey<ScaffoldState> drawerKey;

  const Header({required this.drawerKey, super.key});

  @override
  Widget build(BuildContext context) {
    return AppBar(
      title: const Text("Dashboard"),
      leading: IconButton(
        icon: const Icon(Icons.menu),
        onPressed: () {
          drawerKey.currentState?.openDrawer();
        },
      ),
    );
  }
}

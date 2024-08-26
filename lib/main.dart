import 'package:dashboard/controller/side_bar_controller.dart';
import 'package:dashboard/shared/navigation/routes.dart';
import 'package:dashboard/theme/app_theme.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

void main() {
  runApp(const MainApp());
}

class MainApp extends StatelessWidget {
  const MainApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        ChangeNotifierProvider(create: (context) => SideBarController()),
      ],
      child: MaterialApp.router(
        theme: AppTheme.light(context),
        routerConfig: routerConfig,
      ),
    );
  }
}

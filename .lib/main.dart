import 'package:dashboard/app_routes.dart';
import 'package:dashboard/views/registration_page.dart';
import 'package:dashboard/views/welcome.dart';
import 'package:flutter/material.dart';
import 'package:get/get_navigation/src/root/get_material_app.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
     return GetMaterialApp(
      title: 'School Registration',
       initialRoute: '/',
       getPages: AppRoutes.routes,
      //home: RegistrationPage(),
      home: const WelcomePage(),
    );
  }
}

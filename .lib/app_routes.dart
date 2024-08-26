import 'package:dashboard/views/login_page.dart';
import 'package:dashboard/views/registration_page.dart';
import 'package:get/get.dart';


class AppRoutes {
  static final routes = [
    GetPage(name: '/', page: () => RegistrationPage()),  
    GetPage(name: '/login', page: () => const LoginPage()),  
    
  ];
}
import 'package:flutter/animation.dart';
import 'package:flutter/material.dart';
import 'package:flutter_web_service/screens/login_screen.dart';
import '../screens/dashboard.dart';
class Routes {
  //static const String profesor = '/profesor';
  static const String dashboard = '/dashboard';
}

Map<String, WidgetBuilder> GetRoutes() {
  return <String, WidgetBuilder>{
    '/': (BuildContext context) => const LoginScreen(),
    //Routes.profesor: (BuildContext context) => const ProfesorScreen(),
    Routes.dashboard: (BuildContext context) => DashboardScreen(),
  };
}

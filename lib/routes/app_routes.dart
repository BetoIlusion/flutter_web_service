// lib/routes/app_routes.dart
import 'package:flutter/material.dart';
import '../screens/login_screen.dart';
import '../screens/menu_principal_screen.dart';

class AppRoutes {
  static final navigatorKey = GlobalKey<NavigatorState>();

  // Definir rutas
  static const login = '/login';
  static const menu = '/menu';
  static const menuPrincipal = '/menu-principal';

  static const listarCortes = '/listarCortes';
  static const listarCortesDetalle = '/listarCortesDetalle';
  

  static Map<String, Widget Function(BuildContext)> get routes => {
    login: (_) => const LoginScreen(),
    menu: (_) => const MenuPrincipalScreen(),
  };

  static Route<dynamic>? generateRoute(RouteSettings settings) {
    switch (settings.name) {
      case login:
        return MaterialPageRoute(builder: (_) => const LoginScreen());
      case menu:
        return MaterialPageRoute(builder: (_) => const MenuPrincipalScreen());
      default:
        return MaterialPageRoute(builder: (_) =>  Scaffold(
          body: Center(
            child: Text('No route defined for ${settings.name}'),
          ),
        )); 
      
      
    }
  }
}
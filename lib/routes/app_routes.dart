
import 'package:flutter/widgets.dart';
import 'package:flutter_web_service/screens/cortes_screen.dart';
import 'package:flutter_web_service/screens/importar_cortes_screen.dart';
import 'package:flutter_web_service/screens/login_screen.dart';
import 'package:flutter_web_service/screens/menu_principal_screen.dart';
import 'package:flutter_web_service/screens/registrar_cortes_screen.dart';

///aqui manejamos todas las rutas de la aplicacion

class AppRoutes {
  static const String login = '/login';
  static const String mainMenu = '/main-menu';
  static const String cortes = '/cortes';
  static const String importarCortes = '/importar-cortes';
  static const String registrarCortes = '/registrar-cortes';

  static Map<String, WidgetBuilder> get routes => {
    login: (context) => const LoginScreen(),
    mainMenu: (context) => const MenuPrincipalScreen(),
    cortes: (context) => const CortesScreen(),
    importarCortes: (context) => const ImportarCortesScreen(),
    registrarCortes: (context) => const RegistrarCortesScreen(),
  };
}



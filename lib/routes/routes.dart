import 'package:flutter/animation.dart';
import 'package:flutter/material.dart';
import 'package:flutter_web_service/screens/login_screen.dart';
class Routes {
  
}

Map<String, WidgetBuilder> GetRoutes(){
  return <String, WidgetBuilder>{
    '/': (BuildContext context) => const LoginScreen(),
  };
}
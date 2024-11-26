import 'package:flutter/material.dart';
import 'package:flutter_web_service/routes/routes.dart';
import 'dart:io';

void main() {
  runApp(const MainApp());
}

class MainApp extends StatelessWidget {
  const MainApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Web Services',
      debugShowCheckedModeBanner: false,
      routes: GetRoutes(),
      initialRoute:'/dashboard',
    );
  }
}

import 'package:flutter/material.dart';
import '../screens/cortes_screen.dart';

class DashboardScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('Dashboard')),
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          ElevatedButton(
            onPressed: () {}, 
            child: Text('Lectura'),
          ),
          ElevatedButton(
            onPressed: () {
              Navigator.push(
                context,
                MaterialPageRoute(builder: (_) => CortesScreen()),
              );
            }, 
            child: Text('Cortes'),
          ),
          ElevatedButton(
            onPressed: () {}, 
            child: Text('Reconexión'),
          ),
          ElevatedButton(
            onPressed: () {}, 
            child: Text('Salir/Volver'),
          ),
        ],
      ),
    );
  }
}

import 'package:flutter/material.dart';
import '../screens/cortes_screen.dart';

class MenuPrincipalScreen extends StatelessWidget {
  const MenuPrincipalScreen({super.key});

  void _botonLectura(context) {
    Navigator.push(
      context,
      MaterialPageRoute(builder: (_) => CortesScreen()),
    );
  }

  void _botonCortes(context) {
    Navigator.push(
      context,
      MaterialPageRoute(builder: (_) => CortesScreen()),
    );
  }

  void _botonReconexion(context) {
    Navigator.push(
      context,
      MaterialPageRoute(builder: (_) => CortesScreen()),
    );
  }


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Dashboard')),
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          ElevatedButton(
            onPressed: () {
              _botonLectura(context);
            },
            child: const Text('Lectura'),
          ),
          ElevatedButton(
            onPressed: () {
              _botonCortes(context);
            },
            child: const Text('Cortes'),
          ),
          ElevatedButton(
            onPressed: () {
              _botonReconexion(context);
            },
            child: const Text('Reconexión'),
          ),
          ElevatedButton(
            onPressed: () {},
            child: const Text('Salir/Volver'),
          ),
        ],
      ),
    );
  }
}

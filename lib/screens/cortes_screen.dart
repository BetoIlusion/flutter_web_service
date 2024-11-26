import 'package:flutter/material.dart';
import '../screens/importar_cortes_screen.dart';
class CortesScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('Cortes')),
      body: Center(
        child: ElevatedButton(
          onPressed: () {
            Navigator.push(
              context,
              MaterialPageRoute(builder: (_) => ImportarCortesScreen()),
            );
          }, 
          child: Text('Importar Cortes desde el Servidor'),
        ),
      ),
    );
  }
}

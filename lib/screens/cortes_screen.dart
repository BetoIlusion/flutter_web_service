import 'package:flutter/material.dart';
import '../screens/importar_cortes_screen.dart';

class CortesScreen extends StatelessWidget {
  final String Cper;

  const CortesScreen({Key? key, required this.Cper}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Cortes')),
      body: Center(
        child: ElevatedButton(
          onPressed: () {
            Navigator.push(
              context,
              MaterialPageRoute(builder: (_) => ImportarCortesScreen(Cper: Cper)),
            );
          },
          child: const Text('Importar Cortes desde el Servidor'),
        ),
      ),
    );
  }
}

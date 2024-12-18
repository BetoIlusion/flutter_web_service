import 'package:flutter/material.dart';
import 'package:flutter_web_service/screens/registrar_cortes_screen.dart';
import '../screens/importar_cortes_screen.dart';

class CortesScreen extends StatelessWidget {
  final String Cper;

  const CortesScreen({super.key, required this.Cper});

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

  Widget _buildButton({
    required VoidCallback onPressed,
    required String text,
    required IconData icon,
    Color color = Colors.blueAccent,
  }) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 8.0),
      child: SizedBox(
        width: double.infinity,
        height: 56,
        child: ElevatedButton.icon(
          onPressed: onPressed,
          icon: Icon(icon, color: Colors.white),
          label: Text(
            text,
            style: const TextStyle(
              color: Colors.white,
              fontSize: 16,
            ),
          ),
          style: ElevatedButton.styleFrom(
            backgroundColor: color,
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(30),
            ),
            elevation: 3,
          ),
        ),
      ),
    );

    ///   body: Center(
    ///     child: ElevatedButton(
    ///    onPressed: () {
    ///   Navigator.push(
    ///  context,
    /// MaterialPageRoute(builder: (_) => ImportarCortesScreen()),
    ///);
    /// },
    /// child: const Text('Importar Cortes desde el Servidor'),
    ///),
    ///),
  }
}

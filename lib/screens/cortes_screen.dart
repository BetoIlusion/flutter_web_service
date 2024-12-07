import 'package:flutter/material.dart';
import 'package:flutter_web_service/screens/exportar_cortes_screen.dart';
import 'package:flutter_web_service/screens/listar_cortes_screen.dart';
import 'package:flutter_web_service/screens/registrar_cortes_screen.dart';
import '../screens/importar_cortes_screen.dart';

class CortesScreen extends StatelessWidget {
  const CortesScreen({super.key});

  void _navegarAImportarCortes(BuildContext context) {
    Navigator.push(
      context,
      MaterialPageRoute(builder: (_) => const ImportarCortesScreen()),
    );
  }

  void _navegarARegistrarCortes(BuildContext context) {
    Navigator.push(
      context,
      MaterialPageRoute(builder: (_) => const RegistrarCortesScreen()),
    );
  }

  void _navegarAExportarCortes(BuildContext context) {
    Navigator.push(
      context,
      MaterialPageRoute(builder: (_) => const ExportarCortesScreen()),
    );
  }

  void _navegarAListaCortes(BuildContext context) {
    Navigator.push(
      context,
      MaterialPageRoute(builder: (_) => const ListarCortesScreen()),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Cortes')),
      backgroundColor: Colors.blueAccent,
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          children: [
            // Botón Importar cortes
            _buildButton(
              onPressed: () => _navegarAImportarCortes(context),
              text: 'Importar cortes desde el servidor',
              icon: Icons.cloud_download,
            ),

            // Botón Registrar Cortes
            _buildButton(
              onPressed: () => _navegarARegistrarCortes(context),
              text: 'Registrar Cortes',
              icon: Icons.edit,
            ),

            // Botón Exportar cortes
            _buildButton(
              onPressed: () => _navegarAExportarCortes(context),
              text: 'Exportar cortes al servidor',
              icon: Icons.cloud_upload,
            ),

            // Botón Lista de cortes
            _buildButton(
              onPressed: () => _navegarAListaCortes(context),
              text: 'Lista de cortes realizados',
              icon: Icons.list,
            ),

            // Botón Salir
            _buildButton(
              onPressed: () => Navigator.pop(context),
              text: 'Salir',
              icon: Icons.exit_to_app,
              color: Colors.red,
            ),

            // Logo COOSIV
            const Spacer(),
            Image.asset(
              'assets/coosiv_logo.png',
              height: 60,
              errorBuilder: (context, error, stackTrace) => const Icon(
                Icons.water_drop,
                size: 60,
                color: Colors.blue,
              ),
            ),
          ],
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

import 'package:flutter_web_service/export.dart';

class CortesFormScreen extends StatefulWidget {
  const CortesFormScreen({super.key});

  @override
  State<CortesFormScreen> createState() => _CortesFormScreenState();
}


///extendes form cortes 
class _CortesFormScreenState extends State<CortesFormScreen> {
  @override
 Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.all(16.0),
          child: Column(
            children: [
              // Título verde en la parte superior
              Container(
                width: double.infinity,
                padding: const EdgeInsets.all(12),
                decoration: BoxDecoration(
                  color: Colors.green,
                  borderRadius: BorderRadius.circular(8),
                ),
                child: const Text(
                  'Cortes',
                  style: TextStyle(
                    color: Colors.white,
                    fontSize: 18,
                    fontWeight: FontWeight.bold,
                  ),
                  textAlign: TextAlign.center,
                ),
              ),
              
              const SizedBox(height: 20),
              
              // Botones azules
              _buildButton('Importar cortes desde el servidor', () {
                // TODO: Implementar función de importación
              }),
              
              const SizedBox(height: 10),
              
              _buildButton('Registrar Cortes', () {
                // TODO: Implementar función de registro
              }),
              
              const SizedBox(height: 10),
              
              _buildButton('Exportar cortes al servidor', () {
                // TODO: Implementar función de exportación
              }),
              
              const SizedBox(height: 10),
              
              _buildButton('Lista de cortes realizados', () {
                // TODO: Implementar función de lista
              }),
              
              const SizedBox(height: 10),
              
              _buildButton('Salir', () {
                Navigator.of(context).pop();
              }),
              
              const Spacer(),
              
              // Logo en la parte inferior
              Image.asset(
                'assets/logo_gosiv.png', // Asegúrate de tener este asset en tu pubspec.yaml
                height: 60,
              ),
            ],
          ),
        ),
      ),
    );
  }

  Widget _buildButton(String text, VoidCallback onPressed) {
    return SizedBox(
      width: double.infinity,
      child: ElevatedButton(
        onPressed: onPressed,
        style: ElevatedButton.styleFrom(
          backgroundColor: Colors.blue[300],
          padding: const EdgeInsets.symmetric(vertical: 15),
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(8),
          ),
        ),
        child: Text(
          text,
          style: const TextStyle(
            color: Colors.white,
            fontSize: 16,
          ),
        ),
      ),
    );
  }  
}
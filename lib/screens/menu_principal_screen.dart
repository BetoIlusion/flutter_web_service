import 'package:flutter/material.dart';
import '../screens/cortes_screen.dart';

class MenuPrincipalScreen extends StatelessWidget {
  final String Cper;

  const MenuPrincipalScreen({Key? key, required this.Cper}) : super(key: key);

  void _botonLectura(BuildContext context) {
    ScaffoldMessenger.of(context).showSnackBar(
      const SnackBar(content: Text('Lectura seleccionada')),
    );
  }

  void _botonCortes(BuildContext context) {
    Navigator.push(
      context,
      MaterialPageRoute(builder: (_) => CortesScreen(Cper: Cper)),
    );
  }

  void _botonReconexion(BuildContext context) {
    ScaffoldMessenger.of(context).showSnackBar(
      const SnackBar(content: Text('Reconexión seleccionada')),
    );
  }

  void _botonSalir(BuildContext context) {
    Navigator.pop(context);
  }

  //botn salir si no les gusta lo borran :v
  

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Dashboard'),
        centerTitle: true,
        backgroundColor: Colors.lightBlueAccent,
      ),
      body: Container(
        decoration: const BoxDecoration(
          gradient: LinearGradient(
            colors: [Colors.white, Colors.lightBlueAccent],
            begin: Alignment.topCenter,
            end: Alignment.bottomCenter,
          ),
        ),
        child: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              const Text(
                'Menú Principal',
                style: TextStyle(
                  fontSize: 24,
                  fontWeight: FontWeight.bold,
                  color: Colors.lightBlue,
                ),
              ),
              const SizedBox(height: 20),
              _buildButton(
                text: 'Lectura',
                onPressed: () => _botonLectura(context),
              ),
              const SizedBox(height: 10),
              _buildButton(
                text: 'Cortes',
                onPressed: () => _botonCortes(context),
              ),
              const SizedBox(height: 10),
              _buildButton(
                text: 'Reconexión',
                onPressed: () => _botonReconexion(context),
              ),
              const SizedBox(height: 10),
              _buildButton(
                text: 'Salir/Volver',
                onPressed: () => _botonSalir(context),
              ),
              const SizedBox(height: 20),
              Text(
                'Cper: $Cper',
                style: const TextStyle(
                  fontSize: 16,
                  fontWeight: FontWeight.bold,
                  color: Colors.blueAccent,
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }

  Widget _buildButton({required String text, required VoidCallback onPressed}) {
    return ElevatedButton(
      style: ElevatedButton.styleFrom(
        backgroundColor: Colors.blueAccent,
        foregroundColor: Colors.white, // Texto de color blanco
        padding: const EdgeInsets.symmetric(horizontal: 32, vertical: 12),
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(20),
        ),
        elevation: 5,
      ),
      onPressed: onPressed,
      child: Text(
        text,
        style: const TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
      ),
    );
  }
}

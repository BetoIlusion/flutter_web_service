import 'package:flutter/material.dart';
import 'package:flutter_web_service/services/web_service.dart';

class MyHomePage extends StatefulWidget {
  const MyHomePage({super.key});

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  List<Map<String, dynamic>> _rutas = [];
  bool _isLoading = true;

  @override
  void initState() {
    super.initState();
    _fetchRutas();
  }

  Future<void> _fetchRutas() async {
    try {
      // final rutas = await WebService.fetchRutas();
      // setState(() {
      //   _rutas = rutas;
      //   _isLoading = false;
      // });
     
      
    } catch (error) {
      print('Error fetching rutas: $error');
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Rutas'),
      ),
      body: _isLoading
          ? const Center(child: CircularProgressIndicator())
          : ListView.builder(
              itemCount: _rutas.length,
              itemBuilder: (context, index) {
                final ruta = _rutas[index];
                return ListTile(
                  title: Text(ruta['bsrutdesc']),
                  subtitle: Text('Ruta: ${ruta['bsrutabrv']}'),
                );
              },
            ),
    );
  }
}

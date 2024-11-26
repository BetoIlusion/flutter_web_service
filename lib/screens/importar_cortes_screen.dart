import 'package:flutter/material.dart';
import '../services/soap_service.dart';
class ImportarCortesScreen extends StatefulWidget {
  @override
  _ImportarCortesScreenState createState() => _ImportarCortesScreenState();
}

class _ImportarCortesScreenState extends State<ImportarCortesScreen> {
  String? selectedRuta;
  List<String> rutas = [];
  bool isLoading = true;

  @override
  void initState() {
    super.initState();
    _loadRutas();
  }

  Future<void> _loadRutas() async {
    rutas = await SoapService().obtenerRutas(); // Consumir SOAP
    setState(() {
      isLoading = false;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('Importar Cortes')),
      body: isLoading
          ? Center(child: CircularProgressIndicator())
          : Padding(
              padding: const EdgeInsets.all(16.0),
              child: Column(
                children: [
                  DropdownButton<String>(
                    value: selectedRuta,
                    hint: Text('Selecciona una ruta'),
                    onChanged: (value) {
                      setState(() {
                        selectedRuta = value;
                      });
                    },
                    items: rutas
                        .map((ruta) => DropdownMenuItem(
                              value: ruta,
                              child: Text(ruta),
                            ))
                        .toList(),
                  ),
                  SizedBox(height: 16),
                  Text('CODIGO FIJO', style: TextStyle(fontSize: 18)),
                  SizedBox(height: 16),
                  ElevatedButton(
                    onPressed: () async {
                      if (selectedRuta != null) {
                        await SoapService().importarCortes(selectedRuta!);
                        // Manejo de resultado
                      }
                    },
                    child: Text('Importar Cortes'),
                  ),
                ],
              ),
            ),
    );
  }
}

import 'package:flutter/material.dart';
import '../services/soap_service.dart';


class ImportarCortesScreen extends StatefulWidget {
  const ImportarCortesScreen({super.key});

  @override
  _ImportarCortesScreenState createState() => _ImportarCortesScreenState();
}

class _ImportarCortesScreenState extends State<ImportarCortesScreen> {
  String? selectedRuta;
  String? codigofijo;

  List<String> rutas = [];
  bool isLoading = true;
  //final TextEditingController _controller = TextEditingController();

  @override
  void initState() {
    super.initState();
    _loadRutas();
  }

  Future<void> _loadRutas() async {
    // rutas = await SoapService().obtenerRutas(0); // Consumir SOAP
    // setState(() {
    //   isLoading = false;
    // });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Importar Cortes')),
      body: isLoading
          ? const Center(child: CircularProgressIndicator())
          : Padding(
              padding: const EdgeInsets.all(16.0),
              child: Column(
                children: [
                  DropdownButton<String>(
                    value: selectedRuta,
                    hint: const Text('Selecciona una ruta'),
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
                  const SizedBox(height: 16),
                  const Text('CODIGO FIJO', style: TextStyle(fontSize: 18)),
                  const SizedBox(height: 16),
                  ElevatedButton(
                    onPressed: () async {
                      // if (selectedRuta != null) {
                      //   await SoapService().importarCortes(selectedRuta!);
                      //   // Manejo de resultado
                      // }
                    },
                    child: const Text('Importar Cortes'),
                  ),
                ],
              ),
            ),
    );
  }
}

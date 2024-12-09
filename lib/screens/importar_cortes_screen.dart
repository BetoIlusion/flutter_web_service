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
/*
      usuarios = [
      {
        'nombre': 'BARTELEMI YOIVO CARMEN',
        'clu': '00000',
        'latitud': '-16.39800000000',
        'longitud': '-70.95440000000'
      },
      {
        'nombre': 'PARIA MERCADO MILTON',
        'clu': '00000',
        'latitud': '-16.37800000000',
        'longitud': '-70.87755000000'
      },
      // Añade más usuarios según necesites
    ];    */
  }

  Future<void> _loadRutas() async {
    // rutas = await SoapService().obtenerRutas(0); // Consumir SOAP
    // setState(() {
    //   isLoading = false;
    // });

  }

  ///importa cortes 
   Future<void> _importarCortes() async {
    if (selectedRuta == null) return;

    setState(() {
      isLoading = true;
    });

    try {
      // Aquí implementarías la llamada real al servicio SOAP
      // await SoapService().importarCortes(selectedRuta!);
      await Future.delayed(const Duration(seconds: 2)); // Simulación
      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(content: Text('Cortes importados exitosamente')),
      );
    } catch (e) {
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(content: Text('Error al importar cortes: $e')),
      );
    } finally {
      setState(() {
        isLoading = false;
      });
    }
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

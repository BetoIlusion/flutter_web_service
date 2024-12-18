import 'package:flutter_web_service/export.dart';

class ImportarCortesScreen extends StatefulWidget {
  final String Cper; // Recibe un id como parámetro de tipo String

  const ImportarCortesScreen({super.key, required this.Cper});

  @override
  _ImportarCortesScreenState createState() => _ImportarCortesScreenState();
}

class _ImportarCortesScreenState extends State<ImportarCortesScreen> {
  String? selectedRuta;
  List<String> rutas = [];
  bool isLoading = true;
  late final List<Rutas> rutasSoap;

  @override
  void initState() {
    super.initState();
    _loadRutas();
  }

  Future<void> _loadRutas() async {
    rutasSoap = await WebService.ObtenerRutas(0);
    print(rutasSoap);
    setState(() {
      isLoading = false;
    });
  }

  void _botonListReporte(BuildContext context, Rutas ruta) {
    // Navigator.push(
    //   context,
    //   MaterialPageRoute(
    //     builder: (_) => ReporteRutaScreen(Cper: ruta.getCper);
    //   ),
    // );
  }
  void _accionAdicional() {
    ScaffoldMessenger.of(context).showSnackBar(
      const SnackBar(content: Text('Acción adicional ejecutada')),
    );
  }

  void _otraAccion() {
    ScaffoldMessenger.of(context).showSnackBar(
      const SnackBar(content: Text('Otra acción ejecutada')),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Importar Cortes'),
      ),
      body: isLoading
          ? const Center(child: CircularProgressIndicator())
          : Center(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Expanded(
                    child: ListView.builder(
                      shrinkWrap: true,
                      itemCount: rutasSoap.length,
                      itemBuilder: (context, index) {
                        final ruta = rutasSoap[index];
                        return Card(
                          elevation: 4,
                          margin: const EdgeInsets.symmetric(
                              vertical: 8, horizontal: 16),
                          child: ListTile(
                            contentPadding: const EdgeInsets.all(16),
                            title: Text(
                              ruta.getNombreRuta,
                              style: const TextStyle(
                                fontWeight: FontWeight.bold,
                                fontSize: 18,
                              ),
                            ),
                            subtitle: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Text('ID Ruta: ${ruta.getIdRuta}'),
                                Text('Nombre: ${ruta.getNombre}'),
                                Text('Zona: ${ruta.getZona}'),
                              ],
                            ),
                            onTap: () {
                              //_botonListReporte(context, ruta);
                            },
                          ),
                        );
                      },
                    ),
                  ),
                  const SizedBox(height: 16),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    children: [
                      ElevatedButton(
                        onPressed: _accionAdicional,
                        child: const Text('Acción 1'),
                      ),
                      ElevatedButton(
                        onPressed: _otraAccion,
                        child: const Text('Acción 2'),
                      ),
                    ],
                  ),
                  const SizedBox(height: 16),
                ],
              ),
            ),
    );
  }
}

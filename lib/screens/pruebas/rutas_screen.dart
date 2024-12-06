import 'package:flutter_web_service/export.dart';

class RutasScreen extends StatefulWidget {
  @override
  _RutasScreenState createState() => _RutasScreenState();
}

class _RutasScreenState extends State<RutasScreen> {
  List<String> rutas = [];

  @override
  void initState() {
    super.initState();
    cargarRutas();
  }

  void cargarRutas() async {
    // try {
    //   SoapService soap = SoapService();
    //   final listaRutas = await soap.obtenerRutas(1); // Cambia 1 por el ID necesario
    //   setState(() {
    //     rutas = listaRutas;
    //   });
    // } catch (e) {
    //   print(e);
    // }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('Rutas')),
      body: rutas.isEmpty
          ? Center(child: CircularProgressIndicator())
          : ListView.builder(
              itemCount: rutas.length,
              itemBuilder: (context, index) {
                return ListTile(title: Text(rutas[index]));
              },
            ),
    );
  }
}

import 'package:flutter_web_service/export.dart';

class ReporteCorte {
  late int nroCorte;
  late double _longitud;
  late double _latitud;
  late Rutas rutas;
  late String _estado;
  late DateTime _fecha;
  late int _idObservacion;
  late int _idDpto;
  late int _idFactura;
  ReporteCorte();

  Future<List<ReporteCorte>> getListReportes() async {
    List<ReporteCorte> _listReportes = [];
    final ReporteIterativo = await WebService.fetchReporteParaCortesSIG(
        nroCorte, int.parse(rutas.getIdRuta), rutas.getCper);

    try {
      for (var i = 0; i < 4; i++) {
        ReporteCorte reporte = ReporteCorte();
        if (ReporteIterativo[i]['bscntlati'] == 0.0000000 &&
            ReporteIterativo[i]['bscntlogi'] == 0.0000000) {
          reporte.rutas.setCper = ReporteIterativo[i]['bscoccper'];
          print('Cper: ${ReporteIterativo[i]['bscoccper']}');
          reporte.rutas.setIdRuta = ReporteIterativo[i]['bscocnrut'];
          print('IdRuta: ${ReporteIterativo[i]['bscocnrut']}');
          reporte.rutas.setNombre = ReporteIterativo[i]['dNomb'];
          print('Nombre: ${ReporteIterativo[i]['dNomb']}');
          reporte.nroCorte = ReporteIterativo[i]['bscocncoc'];
          print('NroCorte: ${ReporteIterativo[i]['bscocncoc']}');
          reporte._latitud = ReporteIterativo[i]['bscntlati'];
          print('Latitud: ${ReporteIterativo[i]['bscntlati']}');
          reporte._longitud = ReporteIterativo[i]['bscntlogi'];
          print('Longitud: ${ReporteIterativo[i]['bscntlogi']}');
          reporte._estado = ReporteIterativo[i]['dStad'];
          print('Estado: ${ReporteIterativo[i]['dStad']}');
          reporte._fecha = DateTime.now();
          print('Fecha: ${DateTime.now()}');
          reporte._idObservacion = ReporteIterativo[i]['bscoccobc'];
          print('IdObservacion: ${ReporteIterativo[i]['bscoccobc']}');
          reporte._idDpto = ReporteIterativo[i]['bscntdpto'];
          print('IdDpto: ${ReporteIterativo[i]['bscntdpto']}');
          reporte._idFactura = ReporteIterativo[i]['bscntcodf'];
          print('IdFactura: ${ReporteIterativo[i]['bscntcodf']}');
          _listReportes.add(reporte);
        }
      }
    } catch (e) {
      print("error de fetch de reporte de cortes en ReporteCorte");
    }
    return _listReportes;
  }
}

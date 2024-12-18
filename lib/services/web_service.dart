import 'package:flutter_web_service/model/web_service_model.dart/ruta_reporte.dart';
import 'package:http/http.dart' as http;
import 'package:xml/xml.dart' as xml;
import 'package:flutter_web_service/export.dart';

class WebService {
  static const String baseUrl1 =
      'http://190.171.244.211:8080/wsVarios/wsBS.asmx';
  static const String baseUrl2 =
      'http://190.171.244.211:8080/wsVarios/wsAd.asmx';

  static Future<List<Rutas>> ObtenerRutas(int Cper) {
    Rutas ruta = Rutas(Cper);
    return ruta.getListaRuta;
  }

  static Future<List<ReporteCorte>> ObtenerReporteCorte(
      int Nrut, int Nm, int Cper) {
    Rutas ruta = Rutas(Cper);
    ruta.setIdRuta = Nrut.toString();
    ReporteCorte reporteCorte = ReporteCorte();
    reporteCorte.rutas = ruta;
    reporteCorte.nroCorte = Nm;
    return reporteCorte.getListReportes();
  }

  static Future<String> ValidarLogin(String email, String password) async {
    final List<String> fetchValidacion =
        await _fetchValidarLoginPassword(email, password);
    if (fetchValidacion.isNotEmpty) {
      return fetchValidacion[3];
    }
    print("fetchValidacion no tiene datos");
    return "";
  }

  static Future<List<Map<String, dynamic>>> fetchRutas(int Cper) async {
    final url = Uri.parse('$baseUrl1?op=W0Corte_ObtenerRutas');
    final headers = {
      'Content-Type': 'application/soap+xml; charset=utf-8',
      'SOAPAction': 'http://activebs.net/W0Corte_ObtenerRutas',
    };
    final body = '''<?xml version="1.0" encoding="utf-8"?>
                          <soap12:Envelope xmlns:xsi="http://www.w3.org/2001/XMLSchema-instance" xmlns:xsd="http://www.w3.org/2001/XMLSchema" xmlns:soap12="http://www.w3.org/2003/05/soap-envelope">
                            <soap12:Body>
                              <W0Corte_ObtenerRutas xmlns="http://activebs.net/">
                                <liCper>$Cper</liCper>
                              </W0Corte_ObtenerRutas>
                            </soap12:Body>
                          </soap12:Envelope>''';

    final response = await http.post(url, headers: headers, body: body);

    if (response.statusCode == 200) {
      final xmlDocument = xml.XmlDocument.parse(response.body);
      final elements = xmlDocument.findAllElements('Table');

      return elements.map((element) {
        final Map<String, dynamic> data = {};
        element.children.whereType<xml.XmlElement>().forEach((child) {
          data[child.localName] = child.text;
        });
        return data;
      }).toList();
    } else {
      throw Exception('Failed to load data');
    }
  }

  static Future<List<Map<String, dynamic>>> fetchReporteParaCortesSIG(
      int Nrut, int Ncnt, int Cper) async {
    final url = Uri.parse('$baseUrl1?op=W0Corte_ObtenerRutas');
    final headers = {
      'Content-Type': 'application/soap+xml; charset=utf-8',
      'SOAPAction': 'http://activebs.net/W0Corte_ObtenerRutas',
    };
    final body = '''<?xml version="1.0" encoding="utf-8"?>
                    <soap12:Envelope xmlns:xsi="http://www.w3.org/2001/XMLSchema-instance" xmlns:xsd="http://www.w3.org/2001/XMLSchema" xmlns:soap12="http://www.w3.org/2003/05/soap-envelope">
                      <soap12:Body>
                        <W2Corte_ReporteParaCortes xmlns="http://activebs.net/">
                          <liNrut>$Nrut</liNrut>
                          <liNcnt>$Ncnt</liNcnt>
                          <liCper>$Cper</liCper>
                        </W2Corte_ReporteParaCortes>
                      </soap12:Body>
                    </soap12:Envelope>''';

    final response = await http.post(url, headers: headers, body: body);

    if (response.statusCode == 200) {
      final xmlDocument = xml.XmlDocument.parse(response.body);
      final elements = xmlDocument.findAllElements('Table');

      return elements.map((element) {
        final Map<String, dynamic> data = {};
        element.children.whereType<xml.XmlElement>().forEach((child) {
          data[child.localName] = child.text;
        });
        return data;
      }).toList();
    } else {
      throw Exception('Failed to load data');
    }
  }

  static Future<List<String>> _fetchValidarLoginPassword(
      String email, String password) async {
    final url = Uri.parse('$baseUrl2?op=ValidarLoginPassword');
    final headers = {
      'Content-Type': 'application/soap+xml; charset=utf-8',
      'SOAPAction': 'http://activebs.net/ValidarLoginPassword',
    };
    final body = '''<?xml version="1.0" encoding="utf-8"?>
                  <soap12:Envelope xmlns:xsi="http://www.w3.org/2001/XMLSchema-instance" xmlns:xsd="http://www.w3.org/2001/XMLSchema" xmlns:soap12="http://www.w3.org/2003/05/soap-envelope">
                    <soap12:Body>
                      <ValidarLoginPassword xmlns="http://tempuri.org/">
                        <lsLogin>$email</lsLogin>
                        <lsPassword>$password</lsPassword>
                      </ValidarLoginPassword>
                    </soap12:Body>
                  </soap12:Envelope>''';

    final response = await http.post(url, headers: headers, body: body);

    if (response.statusCode == 200) {
      final xmlDocument = xml.XmlDocument.parse(response.body);
      final resultElement =
          xmlDocument.findAllElements('ValidarLoginPasswordResult').first;

      // Decodifica el resultado en una lista de valores
      final result = resultElement.text.split('|');
      return result;
    } else {
      throw Exception('Failed to load data: ${response.statusCode}');
    }
  }
}

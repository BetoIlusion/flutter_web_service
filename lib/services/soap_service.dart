import 'package:http/http.dart' as http;

class SoapService {
  final String _endpoint = 'http://190.171.244.211:8080/wsVarios/wsBS.asmx';

  /// Método para obtener rutas
  Future<List<String>> obtenerRutas() async {
    final String soapRequest = '''
      <?xml version="1.0" encoding="utf-8"?>
      <soap:Envelope xmlns:xsi="http://www.w3.org/2001/XMLSchema-instance" xmlns:xsd="http://www.w3.org/2001/XMLSchema" xmlns:soap="http://schemas.xmlsoap.org/soap/envelope/">
        <soap:Body>
          <W0Corte_ObtenerRutas xmlns="http://tempuri.org/">
            <parameterName>0</parameterName>
          </W0Corte_ObtenerRutas>
        </soap:Body>
      </soap:Envelope>
    ''';

    final response = await http.post(
      Uri.parse(_endpoint),
      headers: {
        'Content-Type': 'text/xml; charset=utf-8',
        'SOAPAction': 'http://tempuri.org/W0Corte_ObtenerRutas',
      },
      body: soapRequest,
    );

    if (response.statusCode == 200) {
      // Procesa la respuesta SOAP
      return _parseSoapResponse(response.body);
    } else {
      throw Exception('Error en la solicitud SOAP: ${response.statusCode}');
    }
  }

  /// Método para importar cortes
  Future<void> importarCortes(String ruta) async {
    final String soapRequest = '''
      <?xml version="1.0" encoding="utf-8"?>
      <soap:Envelope xmlns:xsi="http://www.w3.org/2001/XMLSchema-instance" xmlns:xsd="http://www.w3.org/2001/XMLSchema" xmlns:soap="http://schemas.xmlsoap.org/soap/envelope/">
        <soap:Body>
          <W2Corte_ReporteParaCortesSIG xmlns="http://tempuri.org/">
            <parameter1>1</parameter1>
            <parameter2>0</parameter2>
            <parameter3>0</parameter3>
          </W2Corte_ReporteParaCortesSIG>
        </soap:Body>
      </soap:Envelope>
    ''';

    final response = await http.post(
      Uri.parse(_endpoint),
      headers: {
        'Content-Type': 'text/xml; charset=utf-8',
        'SOAPAction': 'http://tempuri.org/W2Corte_ReporteParaCortesSIG',
      },
      body: soapRequest,
    );

    if (response.statusCode != 200) {
      throw Exception('Error en la solicitud SOAP: ${response.statusCode}');
    }
  }

  /// Parsear la respuesta SOAP
  List<String> _parseSoapResponse(String responseBody) {
    // Aquí puedes usar paquetes como xml para analizar la respuesta SOAP
    // Este ejemplo básico devuelve una lista vacía
    return [];
  }
}

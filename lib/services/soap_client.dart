import 'package:http/http.dart' as http;
import 'dart:convert';
import 'dart:async';

class SoapClient {
  final String endpoint;
  final String namespace;

  SoapClient({required this.endpoint, required this.namespace});

  Future<String> sendRequest(String action, String bodyContent) async {
    // Construir el envelope SOAP
    final envelope = '''
      <?xml version="1.0" encoding="utf-8"?>
      <soap12:Envelope xmlns:xsi="http://www.w3.org/2001/XMLSchema-instance" 
                        xmlns:xsd="http://www.w3.org/2001/XMLSchema" 
                        xmlns:soap12="http://www.w3.org/2003/05/soap-envelope">
        <soap12:Body>
          $bodyContent
        </soap12:Body>
      </soap12:Envelope>
    ''';

    // Configurar headers
    final headers = {
      'Content-Type': 'application/soap+xml; charset=utf-8',
      'SOAPAction': '$namespace/$action',
    };

    // Enviar la solicitud
    final response = await http.post(
      Uri.parse(endpoint),
      headers: headers,
      body: utf8.encode(envelope),
    );

    if (response.statusCode != 200) {
      throw Exception(
          'Error en la solicitud SOAP: ${response.statusCode} ${response.body}');
    }

    return response.body;
  }
}

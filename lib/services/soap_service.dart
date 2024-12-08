import 'package:flutter_web_service/export.dart';
import 'package:http/http.dart' as http;

class SoapService {
  final SoapClient client;

  SoapService({required this.client});

 Future<String> validarLoginPassword(String lsLogin, String lsPassword) async {
    try {
      final response = await http.post(
        Uri.parse('http://190.171.244.211:8080/wsVarios/wsGB.asmx'),   ///esto puede variar /WSad.asmx
        headers: {
          'Content-Type': 'text/xml; charset=utf-8',
          'SOAPAction': 'http://tempuri.org/ValidarLoginPassword'
        },
        body: '''
          <?xml version="1.0" encoding="utf-8"?>
          <soap:Envelope xmlns:xsi="http://www.w3.org/2001/XMLSchema-instance" xmlns:xsd="http://www.w3.org/2001/XMLSchema" xmlns:soap="http://schemas.xmlsoap.org/soap/envelope/">
            <soap:Body>
              <ValidarLoginPassword xmlns="http://tempuri.org/">
                <lsLogin>$lsLogin</lsLogin>
                <lsPassword>$lsPassword</lsPassword>
              </ValidarLoginPassword>
            </soap:Body>
          </soap:Envelope>
        '''
      );

      // Procesar respuesta
      if (response.statusCode == 200) {
        // Extraer resultado
        return 'Success'; // Ajusta según la respuesta real
      }
      return 'Error';
    } catch (e) {
      return 'Error: $e';
    }
  }

  // Añadir método para obtener código del oficial
  Future<String> obtenerRegistroPorCUsuario(String usuario) async {
    // Implementar llamada a GBOFN_ObtenerRegistroPorCUsuario
    // URL: http://190.171.244.211:8080/wsVarios/wsGB.asmx
    return '';
  }










///codigo anterior  ver modificaciones de arriba 
 /* Future<String> validarLoginPassword(String lsLogin, String lsPassword) async {
    final bodyContent = '''
      <ValidarLoginPassword xmlns="http://tempuri.org/">
        <lsLogin>$lsLogin</lsLogin>
        <lsPassword>$lsPassword</lsPassword>
      </ValidarLoginPassword>
    ''';

    return await client.sendRequest("ValidarLoginPassword", bodyContent);
  }*/
}

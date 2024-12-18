import 'package:http/http.dart' as http;

class UserController {
  
  Future<bool> loginUser(String email, String password) async {
    // Construcción del XML para la solicitud SOAP
    final String soapRequest = '''
    <?xml version="1.0" encoding="utf-8"?>
    <soap:Envelope xmlns:xsi="http://www.w3.org/2001/XMLSchema-instance" xmlns:xsd="http://www.w3.org/2001/XMLSchema" xmlns:soap="http://schemas.xmlsoap.org/soap/envelope/">
      <soap:Body>
        <ValidarLoginPassword xmlns="http://tempuri.org/">
          <lsLogin>$email</lsLogin>
          <lsPassword>$password</lsPassword>
        </ValidarLoginPassword>
      </soap:Body>
    </soap:Envelope>
    ''';

    // Dirección del servicio web
    const String url = 'http://190.171.244.211:8080/wsVarios/wsAD.asmx';

    // Cabeceras para la solicitud SOAP
    final Map<String, String> headers = {
      'Content-Type': 'text/xml; charset=utf-8',
      'SOAPAction': 'http://tempuri.org/ValidarLoginPassword',
    };

    // Realizar la solicitud POST
    final response = await http.post(
      Uri.parse(url),
      headers: headers,
      body: soapRequest,
    );

    if (response.statusCode == 200) {
      // Si la respuesta es exitosa, analizar la respuesta SOAP
      String responseBody = response.body;

      // Buscar el contenido dentro de ValidarLoginPasswordResult
      final RegExp regExp = RegExp(r'<ValidarLoginPasswordResult>(.*?)</ValidarLoginPasswordResult>');
      final match = regExp.firstMatch(responseBody);
      
      if (match != null && match.group(1) != null) {
        String result = match.group(1)!;
        // Dependiendo del valor devuelto, puedes hacer algo
        if (result == 'Success') {
          return true;
        } else {
          return false;
        }
      }
    }
    return false;
  }
}


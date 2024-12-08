import '../services/soap_service.dart';
import '../services/soap_client.dart';

class AuthController {
  final SoapService _soapService = SoapService(
    client: SoapClient(
      endpoint: 'http://190.171.244.211:8080/wsVarios/wsAD.asmx',
      namespace: 'http://tempuri.org/',    //aqui se añade el namespace que se requiera para el servicio
    ),
  );

  Future<bool> login(String email, String password) async {
    try {
      // Aquí llamamos al servicio SOAP ValidarLoginPassword
      final response = await _soapService.validarLoginPassword(email, password);
      return response == 'Success';
    } catch (e) {
      print('Error en login: $e');
      return false;
    }
  }
}
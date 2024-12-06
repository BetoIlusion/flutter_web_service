import 'package:flutter_web_service/export.dart';

class SoapService {
  final SoapClient client;

  SoapService({required this.client});

  Future<String> validarLoginPassword(String lsLogin, String lsPassword) async {
    final bodyContent = '''
      <ValidarLoginPassword xmlns="http://tempuri.org/">
        <lsLogin>$lsLogin</lsLogin>
        <lsPassword>$lsPassword</lsPassword>
      </ValidarLoginPassword>
    ''';

    return await client.sendRequest("ValidarLoginPassword", bodyContent);
  }
}

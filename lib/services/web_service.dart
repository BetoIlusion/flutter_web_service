import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'package:xml/xml.dart' as xml;

class WebService {
  static const String baseUrl =
      'http://190.171.244.211:8080/wsVarios/wsBS.asmx';

  static Future<List<Map<String, dynamic>>> fetchRutas() async {
    final url = Uri.parse(baseUrl + '?op=W0Corte_ObtenerRutas');
    final headers = {
      'Content-Type': 'application/soap+xml; charset=utf-8',
      'SOAPAction': 'http://activebs.net/W0Corte_ObtenerRutas',
    };
    final body = '''<?xml version="1.0" encoding="utf-8"?>
<soap12:Envelope xmlns:xsi="http://www.w3.org/2001/XMLSchema-instance" xmlns:xsd="http://www.w3.org/2001/XMLSchema" xmlns:soap12="http://www.w3.org/2003/05/soap-envelope">
  <soap12:Body>
    <W0Corte_ObtenerRutas xmlns="http://activebs.net/">
      <liCper>0</liCper>
    </W0Corte_ObtenerRutas>
  </soap12:Body>
</soap12:Envelope>''';

    final response = await http.post(url, headers: headers, body: body);

    if (response.statusCode == 200) {
      print(
          'Respuesta exitosa: ${response.body}'); // Imprime la respuesta completa
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
      print('Error: ${response.statusCode}'); // Imprime el código de estado
      print(
          'Cuerpo de respuesta: ${response.body}'); // Imprime el cuerpo de la respuesta
      throw Exception('Failed to load data');
    }
  }
}

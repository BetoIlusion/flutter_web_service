import 'dart:ffi';

import 'package:flutter_web_service/services/web_service.dart';

class Rutas {
  late String _idRuta;
  late int _Cper;
  late String _nombreRuta;
  late String _nombrePersona;
  late String _zonaString;
  List<Rutas> _ListaRuta = [];


  String get getIdRuta => _idRuta;
  set setIdRuta(String id) => _idRuta = id;
  String get getNombreRuta => _nombreRuta;
  set setNombreRuta(String id) => _nombreRuta = id;

  String get getNombre => _nombrePersona;
  set setNombre(String nombre) => _nombrePersona = nombre;

  String get getZona => _zonaString;
  set setZona(String zona) => _zonaString = zona;

  Future<List<Rutas>> get getListaRuta => _llenarDatos(_Cper);
  set setListaRuta(List<Rutas> lista) => _ListaRuta = lista;
  int get getCper => _Cper;
  set setCper(int Cper) => _Cper = Cper;
  // Constructor que llama a la función para asignar valores
  Rutas(int Cper) {
    _Cper = Cper;
  }

  // Método privado para asignar valores a las variables
  Future<List<Rutas>> _llenarDatos(int Cper) async {
    final rutasIterativo = await WebService.fetchRutas(Cper);
    //print(rutasIterativo);
    try {
      int i = 0;
      for (var contenido in rutasIterativo) {
        Rutas ruta = Rutas(Cper);
        ruta.setIdRuta = contenido['bsrutnrut'];
        ruta.setNombreRuta = contenido['bsrutdesc'];
        //ruta.setCper = contenido['bsrutcper'];
        ruta.setNombre = contenido['dNomb'];
        ruta.setZona = contenido['dNzon'];
        _ListaRuta.add(ruta);
        if (i == 20) {
          return _ListaRuta;
        }
        i++;
      }
    } catch (e) {
      print(e);
    }
    return _ListaRuta;
  }

  // Método para mostrar los valores como cadena
  @override
  String toString() {
    return '';
  }
}

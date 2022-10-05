// ignore_for_file: public_member_api_docs, unnecessary_null_checks
import 'dart:developer';

import 'package:app_front_dark_solution/src/models/datos_models.dart';
import 'package:app_front_dark_solution/src/services/http_services.dart';
import 'package:flutter/cupertino.dart';
// import 'package:prueba/src/models/models_library.dart';

class DatosProvider extends ChangeNotifier {
  DatosProvider() {
    _data = null;
  }

  late List<Datos>? _data;
  bool get isEmpty => _data == null;

  void clear() => _data = null;

  void notify() => notifyListeners();

  set grupos(List<Datos>? value) {
    _data = value;
    notifyListeners();
  }

  List<Datos>? get grupos => _data;

  Future<List<Datos>?> obtenerGrups() async {
    if (_data != null) {
      print('if $_data');
    }

    final service = HttpService();
    _data = await service.getListado();

    notifyListeners();
    log('Provider: $_data');
    return _data;
  }
}

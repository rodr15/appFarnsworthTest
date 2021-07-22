import 'package:flutter/material.dart';

class Avisos with ChangeNotifier {
  String _Aviso = 'OJO DERECHO';
  String _Image = 'warning.png';

  set set_Image(String n_Image) {
    this._Image = n_Image;
    notifyListeners();
  }

  get get_Image {
    return _Image;
  }

  set set_Aviso(String n_Aviso) {
    this._Aviso = n_Aviso;
    notifyListeners();
  }

  get get_Aviso {
    return _Aviso;
  }
}

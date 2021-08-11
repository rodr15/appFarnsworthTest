import 'package:flutter/material.dart';

class ObjectiveData with ChangeNotifier {
  List _acepted = [];
  List<Offset> _positions = [];
  int _numChips = 16;
  int _opcion = 0;
  double _len = 50;
  double _screenWidth = 0.0;
  double _screenHeight = 0.0;
  int _id = 0;

  List<Offset> cajaPosition = [];

  void clearall() {
    _acepted.clear();
    _positions.clear();
  }

  set set_id(n_id) {
    this._id = n_id;
  }

  get get_id {
    return _id;
  }

  set set_screenWidth(double screenWidth) {
    this._screenWidth = screenWidth;
    notifyListeners();
  }

  set set_screenHeigth(double screenHeigth) {
    this._screenHeight = screenHeigth;
    notifyListeners();
  }

  get get_numChips {
    return _numChips;
  }

  set set_numChips(int n_numChips) {
    this._numChips = n_numChips;
    notifyListeners();
  }

  get get_opcion {
    return _opcion;
  }

  set set_opcion(int n_opcion) {
    this._opcion = n_opcion;
    notifyListeners();
  }

  get get_accepted {
    int cols = 0;
    if (_id < 24) {
      cols = 0;
    } else if (_id < 47) {
      cols = 1;
    } else if (_id < 70) {
      cols = 2;
    } else if (_id < 92) {
      cols = 3;
    }
    _acepted = List.generate(24, (index) => cols * 23 + index);

    return _acepted;
  }

  get get_len {
    if (_numChips < 25) {
      _len = (_screenWidth * (4 / 5) - _numChips * 10) / (_numChips);
    } else {
      _len = (_screenWidth * (4 / 5) - 250) / 25;
    }
    if (_len < 1) {
      _len = 50;
    }
    return _len;
  }

  void init_positions() {
    get_len;
    _positions.clear();
    cajaPosition.clear();
    if (_numChips < 25) {
      for (int i = 0; i <= _numChips; i++) {
        _positions.add(Offset(
            _screenHeight * 3 / 10, 61 + i * (_len + 10) + _screenWidth / 10));
      }
      cajaPosition.add(_positions.first);
      cajaPosition.add(_positions.last);
    } else {
      int y = 3;
      int x = 0;
      for (int i = 0; i <= _numChips; i++) {
        if (i < 24) {
          x = i;
        } else if (i < 47) {
          x = i - 24;
        } else if (i < 70) {
          x = i - 47;
        } else {
          x = i - 70;
        }

        _positions.add(Offset(
            _screenHeight * y / 10, 61 + x * (_len + 10) + _screenWidth / 10));
      }
    }

    notifyListeners();
  }

  get get_positions {
    return _positions[_id];
  }

  get getCajaPosition {
    return cajaPosition;
  }
}

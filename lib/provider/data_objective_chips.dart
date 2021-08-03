import 'package:flutter/material.dart';

class ObjectiveData with ChangeNotifier {
  List _acepted = [];
  List<Offset> _positions = [];
  int _numChips = 15;
  int _opcion = 0;
  double _len = 50;
  double _screenWidth = 0.0;
  double _screenHeight = 0.0;
  int _id = 0;

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
    if (_id < 25) {
      cols = 0;
    } else if (_id < 50) {
      cols = 1;
    } else if (_id < 75) {
      cols = 2;
    } else if (_id < 100) {
      cols = 3;
    }
    _acepted = List.generate(25, (index) => cols * 25 + index);
    return _acepted;
  }

  get get_len {
    if (_numChips < 25) {
      _len = (_screenWidth * (4 / 5) - _numChips * 10) / (_numChips);
    } else {
      _len = (_screenWidth * (4 / 5)) / (_numChips / 4);
    }
    if (_len < 1) {
      _len = 50;
    }
    return _len;
  }

  void init_positions() {
    get_len;
    _positions.clear();
    if (_numChips < 24) {
      for (int i = 0; i <= _numChips; i++) {
        _positions.add(Offset(
            _screenHeight * 3 / 10, i * (_len + 10) + _screenWidth / 10));
      }
    } else {
      int cols = 4;
      for (int j = 0; j < cols; j++) {
        for (int i = 0; i <= (_numChips / cols) - 1; i++) {
          _positions.add(Offset(j * _len + (_screenHeight * 2 * j / 10),
              i * _len + _screenWidth / 10));
        }
      }
    }
    notifyListeners();
  }

  get get_positions {
    return _positions[_id];
  }
}

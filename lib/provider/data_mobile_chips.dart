import 'dart:math';

import 'package:farnsworth/provider/test_data.dart';
import 'package:flutter/material.dart';

class ChipsData with ChangeNotifier {
  List notMove = [];
  int _repeticion = 3;
  bool _tradicional = false;
  List<Color> _colores = [];
  List<Offset> _positions = [];
  List<Offset> _initPositions = [];
  int _numChips = 16;
  int _opcion = 0;
  double _len = 61;
  double _screenWidth = 0.0;
  double _screenHeight = 0.0;
  int _id = 0;

  set setTradicional(bool n_trad) {
    this._tradicional = n_trad;
    notifyListeners();
  }

  get getTradicional {
    return _tradicional;
  }

  void clearall() {
    _colores.clear();
    _positions.clear();
    _initPositions.clear();
  }

  set set_id(n_id) {
    this._id = n_id;
    //notifyListeners();
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

  get get_repeticion {
    return _repeticion;
  }

  set set_repeticion(int n_repet) {
    this._repeticion = n_repet;
    notifyListeners();
  }

  get get_colores {
    _colores.clear();
    if (_tradicional) {
      _colores = [
        Color.fromARGB(255, 54, 130, 191),
        Color.fromARGB(255, 51, 132, 179),
        Color.fromARGB(255, 56, 135, 167),
        Color.fromARGB(255, 61, 133, 154),
        Color.fromARGB(255, 54, 137, 143),
        Color.fromARGB(255, 60, 137, 128),
        Color.fromARGB(255, 89, 132, 117),
        Color.fromARGB(255, 107, 131, 97),
        Color.fromARGB(255, 129, 124, 97),
        Color.fromARGB(255, 145, 120, 96),
        Color.fromARGB(255, 156, 110, 109),
        Color.fromARGB(255, 160, 109, 124),
        Color.fromARGB(255, 156, 110, 137),
        Color.fromARGB(255, 146, 114, 153),
        Color.fromARGB(255, 142, 114, 164),
        Color.fromARGB(255, 127, 117, 176),
      ];
    } else {
      //List c = [Colors.blue,Colors.cyan,Colors.green,Colors.brown,Colors.red,Colors.purple,Colors.];
      List<dynamic> Po = [
        [178, 118, 111], // ROJO
        [151, 145, 75],
        [78, 150, 135],
        [132, 132, 163],
      ]; // Rojo ladrillo - Verde - Azul(verdoso) - Violeta
      List<dynamic> P = [
        [151, 145, 75],
        [82, 150, 135],
        [123, 132, 163],
        [179, 118, 115],
      ]; // Verde-Azul(verdoso)-Violeta-Rojoladrillo
      List<int> v = [];
      List<int> rgb = [];
      if (_numChips < 25) {
        for (int i = 0; i <= 2; i++) {
          v.add(P[_opcion][i] - Po[_opcion][i]);
        }
        for (int i = 0; i < _numChips + 1; i++) {
          for (int j = 0; j <= 2; j++) {
            rgb.add((Po[_opcion][j] + v[j] * (i / (_numChips + 1))).round());
          }
          _colores.add(Color.fromARGB(255, rgb[0], rgb[1], rgb[2]));
          rgb.clear();
        }
      } else {
        for (int opcion = 0; opcion < 4; opcion++) {
          for (int i = 0; i <= 2; i++) {
            v.add(P[opcion][i] - Po[opcion][i]);
          }
          int num = 0;
          if (opcion == 0) {
            num = 24;
          } else {
            num = 23;
          }
          for (int i = 0; i < num; i++) {
            for (int j = 0; j <= 2; j++) {
              rgb.add((Po[opcion][j] + v[j] * (i / (num + 1))).round());
            }
            _colores.add(Color.fromARGB(255, rgb[0], rgb[1], rgb[2]));
            rgb.clear();
          }
        }
      }
    }

    return _colores[_id];
  }

  get get_len {
    if (_numChips < 25) {
      _len = (_screenWidth * (4 / 5) - _numChips * 10) / (_numChips);
    } else {
      _len = (_screenWidth * (4 / 5) - 25 * 10) / 25;
    }
    if (_len < 1) {
      _len = 50;
    }
    return _len;
  }

  void init_hundred_positions() {
    _positions.clear();
    _initPositions.clear();
    get_len;
    int y = 3;
    int x = 0;
    for (int i = 0; i <= _numChips; i++) {
      if (i < 24) {
        y = 3;
        x = i;
      } else if (i < 47) {
        y = 4;
        x = i - 24;
      } else if (i < 70) {
        y = 5;
        x = i - 47;
      } else {
        y = 6;
        x = i - 70;
      }

      _positions.add(Offset(
          _screenHeight * y / 10, 61 + x * (_len + 10) + _screenWidth / 10));
      _initPositions.add(Offset(
          _screenHeight * y / 10, 61 + x * (_len + 10) + _screenWidth / 10));
    }
    notifyListeners();
  }

  void init_positions() {
    get_len;
    _positions.clear();
    _initPositions.clear();
    if (_numChips < 25) {
      for (int i = 0; i <= _numChips; i++) {
        _positions.add(Offset(
            _screenHeight * 5 / 10, 61 + i * (_len + 10) + _screenWidth / 10));
        _initPositions.add(Offset(
            _screenHeight * 5 / 10, 61 + i * (_len + 10) + _screenWidth / 10));
      }
    } else {
      int y = 5;
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
        _initPositions.add(Offset(
            _screenHeight * y / 10, 61 + x * (_len + 10) + _screenWidth / 10));
      }
    }
    notifyListeners();
  }

  get get_initalPositions {
    return _initPositions[_id];
  }

  set set_position(Offset n_position) {
    this._positions[_id] = n_position;
    notifyListeners();
  }

  get get_positions {
    return _positions[_id];
  }

  void shuffle() {
    var random = Random();

    for (int i = _initPositions.length - 2; i > 0; i--) {
      var n = random.nextInt(i + 1);
      notMove.clear();
      notMove = [0, 23, 24, 46, 47, 69, 70, 92];
      if (_numChips > 25) {
        switch (_repeticion) {
          case 3:
            for (int x = 24; x < _numChips; x++) {
              notMove.add(x);
            }

            break;
          case 2:
            for (int x = 0; x < 24; x++) {
              notMove.add(x);
            }
            for (int x = 47; x < _numChips; x++) {
              notMove.add(x);
            }
            break;
          case 1:
            for (int x = 0; x < 47; x++) {
              notMove.add(x);
            }
            for (int x = 70; x < _numChips; x++) {
              notMove.add(x);
            }
            break;
          case 0:
            for (int x = 0; x < 70; x++) {
              notMove.add(x);
            }
            break;

          default:
        }
      }

      if (!(notMove.contains(n) || notMove.contains(i))) {
        var temp = _initPositions[i];

        _initPositions[i] = _initPositions[n];
        _initPositions[n] = temp;
      }
    }

    _positions.clear();
    _positions = List.from(_initPositions);
    notifyListeners();
  }
}

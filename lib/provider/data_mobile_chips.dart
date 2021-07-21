import 'package:flutter/material.dart';

class ChipsData with ChangeNotifier {
  List<Color> _colores = [];
  List<Offset> _positions = [];
  List<Offset> _initPositions = [];
  int _numChips = 15;
  int _opcion = 0;
  double _len = 61;
  double _screenWidth = 0.0;
  double _screenHeight = 0.0;
  int _id = 0;

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

  get get_colores {
    _colores.clear();
    List<int> rojoLadrillo = [203, 65, 84];
    List<int> verde = [0, 80, 0];
    List<int> azulVerdoso = [93, 193, 185];
    List<int> violeta = [76, 40, 130];
    List<dynamic> Po = [
      rojoLadrillo,
      verde,
      azulVerdoso,
      violeta
    ]; // Rojo ladrillo - Verde - Azul(verdoso) - Violeta
    List<dynamic> P = [
      verde,
      azulVerdoso,
      violeta,
      rojoLadrillo
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
      for (int i = 0; i < 4; i++) {
        for (int a = 0; a < 3; a++) {
          v.add(P[i][a] - Po[i][a]);
        }

        for (int j = 0; j < (_numChips / 4); j++) {
          for (int a = 0; a < 3; a++) {
            rgb.add((Po[i][a] + v[a] * (j / ((_numChips / 4) + 1))).round());
          }
          _colores.add(Color.fromARGB(255, rgb[0], rgb[1], rgb[2]));
          rgb.clear();
        }
        v.clear();
      }
    }

    return _colores[_id];
  }

  get get_len {
    if (_numChips < 25) {
      _len = (_screenWidth * (4 / 5)) / (_numChips);
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
    if (_numChips < 25) {
      for (int i = 0; i <= _numChips; i++) {
        _positions
            .add(Offset(_screenHeight * 5 / 10, i * _len + _screenWidth / 10));
        _initPositions
            .add(Offset(_screenHeight * 5 / 10, i * _len + _screenWidth / 10));
      }
    } else {
      int cols = 4;
      for (int j = 0; j < cols; j++) {
        for (int i = 0; i <= (_numChips / cols) - 1; i++) {
          _positions.add(Offset(j * _len + (_screenHeight * (2 * j + 1) / 10),
              i * _len + _screenWidth / 10));
          _initPositions.add(Offset(
              j * _len + (_screenHeight * (2 * j + 1) / 10),
              i * _len + _screenWidth / 10));
        }
      }
    }
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
}

import 'dart:html';

import 'package:flutter/material.dart';

class ChipsData with ChangeNotifier {
  List<Color> _colores = [];
  List<Offset> _positions = [];
  int _numChips = 0;
  int _opcion = 0;
  double _len = 0.0;
  double _screenWidth = 0.0;
  double _screenHeight = 0.0;

  set set_screenWidth(double screenWidth) {
    this._screenWidth = screenWidth;
  }

  set set_screenHigth(double screenHeigth) {
    this._screenHeight = screenHeigth;
  }

  get get_numChips {
    return _numChips;
  }

  set set_numChips(int n_numChips) {
    this._numChips = n_numChips;
  }

  get get_opcion {
    return _opcion;
  }

  set set_opcion(int n_opcion) {
    this._opcion = n_opcion;
  }

  get get_colores {
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

    return _colores;
  }

  get get_len {
    _len = (_screenWidth * (4 / 5)) / (_numChips);
    if (_len < 1) {
      _len = 10;
    }
    return _len;
  }

  get get_positions {
    /*for (int i = 0; i <= _numChips; i++) {
        objectivePositions.add(Offset(
            _screenHeight * 25 / 100, _len * i + 75));
        if (i == 0 || i == _numChips) {
          _positions.add(objectivePositions[i]);
        } else {
          _positions.add(Offset(
              _screenHeight * 60 / 100, _len * i + 75));
        }
      }*/
  }
}

import 'dart:ffi';

import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';

class ConfigProvider with ChangeNotifier {
  List<Offset> blackChipsPositions = [];
  List<Offset> blackObjectivesPositions = [];
  List<Offset> whiteChipsPositions = [];
  List<Offset> whiteObjectivesPositions = [];
  List<Offset> blackCajaPosition = [];
  List<Offset> whiteCajaPosition = [];
  bool black = false;
  bool chip = false;
  int id = 0;

  bool chipForma = false;
  bool chipContorno = false;
  bool objectiveForma = false;
  bool objectiveContorno = false;
  bool caja = false;
  bool cajaForma = false;
  bool cajaContorno = false;

  bool cajaBlack = false;

  void init_positions(
      double _screenWidth, double _screenHeight, double _len, int _numChips) {
    _len = (_screenWidth * (4 / 5) - _numChips * 10) / (_numChips);
    blackChipsPositions.clear();
    blackObjectivesPositions.clear();
    whiteChipsPositions.clear();
    whiteObjectivesPositions.clear();
    for (int i = 0; i <= _numChips; i++) {
      blackObjectivesPositions.add(
          Offset(_screenHeight * 1 / 10, i * (_len + 10) + _screenWidth / 6));
      blackChipsPositions.add(
          Offset(_screenHeight * 3 / 10, i * (_len + 10) + _screenWidth / 6));
      whiteObjectivesPositions.add(
          Offset(_screenHeight * 6 / 10, i * (_len + 10) + _screenWidth / 6));
      whiteChipsPositions.add(
          Offset(_screenHeight * 8 / 10, i * (_len + 10) + _screenWidth / 6));
    }
    blackCajaPosition.add(blackObjectivesPositions.first);
    blackCajaPosition.add(blackObjectivesPositions.last);
    whiteCajaPosition.add(whiteObjectivesPositions.first);
    whiteCajaPosition.add(whiteObjectivesPositions.last);
  }

  void setPositionParameters(bool black, bool chip, int id) {
    this.black = black;
    this.chip = chip;
    this.id = id;
  }

  get getPosition {
    Offset position;
    position = (black && chip
        ? blackChipsPositions[id]
        : (black && !chip
            ? blackObjectivesPositions[id]
            : !black && chip
                ? whiteChipsPositions[id]
                : whiteObjectivesPositions[id]));
    return position;
  }

  void setCajaParameters(bool n_cajaBlack) {
    this.cajaBlack = n_cajaBlack;
  }

  get getCajaPosition {
    return (cajaBlack ? blackCajaPosition : whiteCajaPosition);
  }

  set setCaja(bool n_Caja) {
    this.caja = n_Caja;
    notifyListeners();
  }

  get getCaja {
    return this.caja;
  }

  set setCajaForma(bool n_cajaForma) {
    this.cajaForma = n_cajaForma;
    notifyListeners();
  }

  get getCajaForma {
    return cajaForma;
  }

  set setCajaContorno(bool n_cajaContorno) {
    this.cajaContorno = n_cajaContorno;
    notifyListeners();
  }

  get getCajaContorno {
    return cajaContorno;
  }

  set setChipForma(bool n_chipForma) {
    this.chipForma = n_chipForma;
    notifyListeners();
  }

  get getChipForma {
    return chipForma;
  }

  set setChipContorno(bool n_chipContorno) {
    this.chipContorno = n_chipContorno;
    notifyListeners();
  }

  get getChipContorno {
    return chipContorno;
  }

  set setObjectiveForma(bool n_objectiveForma) {
    this.objectiveForma = n_objectiveForma;
    notifyListeners();
  }

  get getObjectiveForma {
    return objectiveForma;
  }

  set setObjectiveContorno(bool n_objectiveContorno) {
    this.objectiveContorno = n_objectiveContorno;
    notifyListeners();
  }

  get getObjectiveContorno {
    return objectiveContorno;
  }
}

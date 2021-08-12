import 'dart:async';

import 'package:flutter/material.dart';

class TestData with ChangeNotifier {
  int opcion = 4;
  bool _showCronometer = true;
  bool _modify = false; // true -> Modificar // false -> No Modificar
  bool _continue = false; // true -> Continuar // false -> REordenar
  bool _full = false;
  bool _finished = false;
  bool _notification = false;
  int _repeticion = 4;
  List _data = [[], [], [], [], []]; // data = [chip_ids];
  List _tiempo = []; // tiempo = [min,sec];
  List _tiempoData = [];
  bool _start = false;
  int _cronometerSeconds = 0;
  int _cronometerMinutes = 0;
  Timer _cronometer = Timer(Duration(seconds: 0), () {});
  /////////////////////////////////////////////////////7
  List _positions = [[], [], [], [], []];
  int _numChips = 0;
  double _len = 0;
  double _screenHeight = 0;
  double _screenWidth = 0;
  int _id = 0;
  ////////////////////////////////////////////77

  void initTestData() {
    _showCronometer = false;
    _modify = false; // true -> Modificar // false -> No Modificar
    _continue = false; // true -> Continuar // false -> REordenar
    _full = false;
    _finished = false;
    _notification = false;
    _repeticion = 4;
    _data = [[], [], [], [], []]; // data = [chip_ids];
    _tiempo = []; // tiempo = [min,sec];
    List _tiempoData = [];
    _start = false;
    _cronometerSeconds = 0;
    _cronometerMinutes = 0;
    _cronometer = Timer(Duration(seconds: 0), () {});
    _positions = [[], [], [], [], []];
    _numChips = 0;
    _len = 0;
    _screenHeight = 0;
    _screenWidth = 0;
    _id = 0;
  }

  set setshowcronometer(bool n_show) {
    this._showCronometer = n_show;
    notifyListeners();
  }

  get showcronometer {
    return _showCronometer;
  }

  void initState(int _numChips) {
    _data.clear();
    _data = [[], [], [], [], []];

    if (_numChips < 25) {
      for (int j = 0; j <= _repeticion; j++) {
        for (int i = 0; i < _numChips; i++) {
          if (i == 0) {
            this._data[j].add(0);
          } else {
            this._data[j].add(null);
          }
        }
      }
    } else {
      List notMove = [0, 23, 24, 46, 47, 69, 70, 92];
      for (int i = 0; i < _numChips; i++) {
        if (notMove.contains(i)) {
          this._data[0].add(i);
        } else {
          this._data[0].add(null);
        }
      }
    }
  }

  set modifyData(List ids) {
    // List ids = [objetivo_id, chip_id];

    this._data[_repeticion][ids[0]] = ids[1];

    notifyListeners();
  }

  set modifyTiempoData(List n_tiempo) {
    for (int i = 0; i < n_tiempo.length; i++) {
      this._tiempoData.add(n_tiempo[i]);
    }
  }

  get getTiempoData {
    return _tiempoData;
  }

  set setObjectivesFull(bool n_full) {
    this._full = n_full;

    notifyListeners();
  }

  set set_opcion(n_opc) {
    this.opcion = n_opc;
    notifyListeners();
  }

  get get_opcion {
    return opcion;
  }

  void isObjectiveFull() {
    if (_numChips < 25) {
      if (!_data[_repeticion].contains(null)) {
        _full = true;
      } else {
        _full = false;
      }
    } else {
      _repeticion = 0;
      switch (opcion) {
        case 3:
          for (int i = 0; i < 24; i++) {
            if (_data[0][i] == null) {
              _full = false;
              break;
            } else {
              _full = true;
            }
          }

          break;
        case 2:
          for (int i = 24; i < 47; i++) {
            if (_data[0][i] == null) {
              _full = false;
              break;
            } else {
              _full = true;
            }
          }
          break;
        case 1:
          for (int i = 47; i < 70; i++) {
            if (_data[0][i] == null) {
              _full = false;
              break;
            } else {
              _full = true;
            }
          }
          break;
        case 0:
          for (int i = 70; i < _numChips; i++) {
            if (_data[0][i] == null) {
              _full = false;
              break;
            } else {
              _full = true;
            }
          }
          break;
        default:
      }
    }

    //notifyListeners();
  }

  get getObjectivesFull {
    return _full;
  }

  set setContinue(bool n_cont) {
    this._continue = n_cont;
    notifyListeners();
  }

  get getContinue {
    return _continue;
  }

  set setModify(bool n_mod) {
    this._modify = n_mod;
    notifyListeners();
  }

  get getModify {
    return _modify;
  }

  get consult {
    return _data;
  }

  set set_tiempo(List n_tiempo) {
    this._tiempo = n_tiempo;
    if (!_start) {
      _cronometerMinutes = _tiempo[0];
      _cronometerSeconds = _tiempo[1];
    }
    notifyListeners();
  }

  get get_minutes {
    return _tiempo[0];
  }

  get get_seconds {
    return _tiempo[1];
  }

  get get_Cronometerminutes {
    return _cronometerMinutes;
  }

  get get_Cronomterseconds {
    return _cronometerSeconds;
  }

  set set_Cronometertiempo(List n_Cronometertime) {
    this._cronometerMinutes = n_Cronometertime[0];
    this._cronometerSeconds = n_Cronometertime[1];
    notifyListeners();
  }

  set startCronometer(bool n_start) {
    this._start = n_start;
    if (!_start) {
      _cronometerMinutes = _tiempo[0];
      _cronometerSeconds = _tiempo[1];
    }
    notifyListeners();
  }

  get isactiveCronometer {
    return this._start;
  }

  set set_Notification(bool n_notification) {
    this._notification = n_notification;
    notifyListeners();
  }

  get get_Notification {
    return _notification;
  }

  void disminuirRepeticion() {
    this._repeticion--;
    /*if (this._repeticion < 0) {
      this._repeticion = 0;
    }*/
    notifyListeners();
  }

  get get_repeticion {
    return _repeticion;
  }

  set set_repeticion(int n_repeticion) {
    this._repeticion = n_repeticion;

    //notifyListeners();
  }

  void testfinished() {
    _finished = true;
    notifyListeners();
  }

  get get_testfinished {
    return _finished;
  }

  set set_id(int n_id) {
    this._id = n_id;
  }

  set set_numChips(int n_num) {
    this._numChips = n_num;
  }

  set set_parameters_results(List parameters) {
    this._numChips = parameters[0];
    this._len = parameters[1];
    this._screenHeight = parameters[2];
    this._screenWidth = parameters[3];
    notifyListeners();
  }

  void results_positions() {
    int cols = 4;

    for (int j = cols; j >= 0; j--) {
      for (int i = 0; i < _numChips; i++) {
        _positions[cols - j].add(Offset(
            (_screenHeight / 10) + ((j / cols) * _screenHeight * 9 / 10),
            (_screenWidth / 10) + i * (_len + 10)));
      }
    }

    notifyListeners();
  }

  get get_results_positions {
    return _positions[_repeticion + 1][_id];
  }
}

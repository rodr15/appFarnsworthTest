import 'dart:async';

import 'package:flutter/material.dart';

class TestData with ChangeNotifier {
  bool _finished = false;
  bool _notification = false;
  int _repeticion = 4;
  List _data = [[], [], [], [], []]; // data = [chip_ids];
  List _tiempo = []; // tiempo = [min,sec];
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
  void initState(int _numChips) {
    _data.clear();
    _data = [[], [], [], [], []];
    for (int j = 0; j <= _repeticion; j++) {
      for (int i = 0; i < _numChips; i++) {
        this._data[j].add(null);
      }
    }
  }

  set modifyData(List ids) {
    // List ids = [objetivo_id, chip_id];

    this._data[_repeticion][ids[0]] = ids[1];

    notifyListeners();
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
    if (this._repeticion < 0) {
      this._repeticion = 0;
    }
    notifyListeners();
  }

  get get_repeticion {
    return _repeticion;
  }

  set set_repeticion(int n_repeticion) {
    this._repeticion = n_repeticion;
    print(_repeticion);
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
            (_screenWidth / 10) + i * _len));
        print((_screenHeight / 10) + ((j / cols) * _screenHeight * 9 / 10));
      }
    }
    print(' Heig -> ${_screenHeight}');
    print(_positions);
    notifyListeners();
  }

  get get_results_positions {
    return _positions[_repeticion + 1][_id];
  }
}

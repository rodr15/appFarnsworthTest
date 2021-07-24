import 'dart:async';

import 'package:flutter/material.dart';

class TestData with ChangeNotifier {
  bool _finished = false;
  bool _notification = false;
  int _repeticion = 0;
  List _data = []; // data = [chip_ids];
  List _tiempo = []; // tiempo = [min,sec];
  bool _start = false;
  int _cronometerSeconds = 0;
  int _cronometerMinutes = 0;
  Timer _cronometer = Timer(Duration(seconds: 0), () {});
  void initState(int _numChips) {
    _data.clear();
    for (int i = 0; i < _numChips; i++) {
      this._data.add(null);
    }
  }

  set modifyData(List ids) {
    // List ids = [objetivo_id, chip_id];
    this._data[ids[0]] = ids[1];
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

  void aumentarRepeticion() {
    this._repeticion++;
    notifyListeners();
  }

  get get_repeticion {
    return _repeticion;
  }

  void testfinished() {
    _finished = true;
    notifyListeners();
  }

  get get_testfinished {
    return _finished;
  }
}

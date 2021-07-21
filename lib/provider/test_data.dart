import 'package:flutter/material.dart';

class TestData with ChangeNotifier {
  List data = []; // data = [chip_ids];
  List tiempo = []; // tiempo = [min,sec];
  bool start = false;
  void initState(int _numChips) {
    data.clear();
    for (int i = 0; i < _numChips; i++) {
      this.data.add(null);
    }
  }

  set modifyData(List ids) {
    // List ids = [objetivo_id, chip_id];
    this.data[ids[0]] = ids[1];
    notifyListeners();
  }

  get consult {
    return data;
  }

  set set_tiempo(List n_tiempo) {
    this.tiempo = n_tiempo;
    notifyListeners();
  }

  get get_minutes {
    return tiempo[0];
  }

  get get_seconds {
    return tiempo[1];
  }

  set startCronometer(bool _start) {
    this.start = _start;
    notifyListeners();
  }

  get isactiveCronometer {
    return this.start;
  }
}

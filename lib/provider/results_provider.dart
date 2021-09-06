import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';

class ResultsProvider with ChangeNotifier {
  List<String> _dataObjective = [];
  int _numChips = 0;
  List<String> _Tiempo = [];
  bool _tradicional = false;

  SharedPreferences? _preferences;

  ResultsProvider() {
    _loadSettingsFromPrefs();
  }

  _initializePrefs() async {
    if (_preferences == null) {
      _preferences = await SharedPreferences.getInstance();
    }
  }

  _loadSettingsFromPrefs() async {
    await _initializePrefs();
    _dataObjective = _preferences?.getStringList('dataObjective') ?? ['empty'];
    _Tiempo = _preferences?.getStringList('tiempo') ??
        ['0', '0', '0', '0', '0', '0', '0', '0'];
    _numChips = _preferences?.getInt('numChips') ?? 16;
    _tradicional = _preferences?.getBool('tradicional') ?? true;
    notifyListeners();
  }

  _saveSettingsToPrefs() async {
    await _initializePrefs();
    _preferences?.setStringList('dataObjective', _dataObjective);
    _preferences?.setStringList('tiempo', _Tiempo);
    _preferences?.setInt('numChips', _numChips);
    _preferences?.setBool('tradicional', _tradicional);
  }

  void savingConfigurations() {
    _saveSettingsToPrefs();
    notifyListeners();
  }

  set setNumChips(int n_chips) {
    this._numChips = n_chips;
    notifyListeners();
  }

  get getNumChips {
    return _numChips;
  }

  set setTradicional(bool n_trad) {
    this._tradicional = n_trad;
    notifyListeners();
  }

  get getTradicional {
    return _tradicional;
  }

  set setTiempoData(List Tiempo) {
    List<String> n_Tiempo = [];
    for (int i = 0; i < Tiempo.length; i++) {
      n_Tiempo.add(Tiempo[i].toString());
    }
    print(_Tiempo);
    print(n_Tiempo);
    this._Tiempo = n_Tiempo;
    notifyListeners();
  }

  get getTiempoData {
    return _Tiempo;
  }

  void eraseTiempo() {
    this._Tiempo.clear();
    this._Tiempo = ['0', '0', '0', '0', '0', '0', '0', '0'];
    notifyListeners();
  }

  set setResults(List n_Results) {
    print('PROVIDER RESULTS');
    print(n_Results);
    List<String> str_nResults = [];
    if (_numChips > 25) {
      List notMove = [0, 23, 24, 46, 47, 69, 70, 92];
      int less = 0;
      if (n_Results[0][1] == null) {
        n_Results[0] = [
          0,
          1,
          2,
          3,
          4,
          5,
          6,
          7,
          8,
          9,
          10,
          11,
          12,
          13,
          14,
          15,
          16,
          17,
          18,
          19,
          20,
          21,
          22,
          23,
          24,
          25,
          26,
          27,
          28,
          29,
          30,
          31,
          32,
          33,
          34,
          35,
          36,
          37,
          38,
          39,
          40,
          41,
          42,
          43,
          44,
          45,
          46,
          47,
          48,
          49,
          50,
          51,
          52,
          53,
          54,
          55,
          56,
          57,
          58,
          59,
          60,
          61,
          62,
          63,
          64,
          65,
          66,
          67,
          68,
          69,
          70,
          71,
          72,
          73,
          74,
          75,
          76,
          77,
          78,
          79,
          80,
          81,
          82,
          83,
          84,
          85,
          86,
          87,
          88,
          89,
          90,
          91,
          92
        ];
      }
      for (int i = 0; i < notMove.length; i++) {
        n_Results[0].remove(notMove[i]);
      }

      n_Results[0][0] = 85;

      for (int i = 1; i < n_Results[0].length; i++) {
        if (i < 22) {
          less = 1;
        } else if (i < 43) {
          less = 3;
        } else if (i < 64) {
          less = 5;
        } else {
          less = 7;
        }

        n_Results[0][i] = n_Results[0][i] - less;
      }
    }
    for (int j = 0; j < 4; j++) {
      for (int i = 0; i < n_Results[j].length; i++) {
        str_nResults.add(n_Results[j][i].toString());
      }
    }
    this._dataObjective = str_nResults;
  }

  get getResults {
    return _dataObjective;
  }
}

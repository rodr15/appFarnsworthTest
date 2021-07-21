import 'package:flutter/material.dart';

class AppColors with ChangeNotifier {
  Color _backGroundColors = Colors.black;
  Color _letterColors = Colors.white;
  Color _borderColors = Colors.amber;

  set setAppColor(bool tema) {
    if (tema) {
      this._backGroundColors = Colors.black;
      this._letterColors = Colors.white;
      this._borderColors = Colors.amber;
    } else {
      this._backGroundColors = Colors.white;
      this._letterColors = Colors.black;
      this._borderColors = Colors.amber;
    }
    notifyListeners();
  }

  get getBackgroundColor {
    return _backGroundColors;
  }

  get getLetterColor {
    return _letterColors;
  }

  get getBorderColor {
    return _borderColors;
  }
}

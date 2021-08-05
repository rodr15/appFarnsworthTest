import 'package:shared_preferences/shared_preferences.dart';

class UserSimplePreferences {
  Future<void> guardarConfiguracion(
      bool chipForma,
      bool chipContorno,
      bool objectiveForma,
      bool objectiveContorno,
      bool caja,
      bool cajaForma,
      bool cajaContorno) async {
    SharedPreferences _preferences = await SharedPreferences.getInstance();

    const _keychipForma = 'chipForma';
    const _keychipCotorno = 'chipContorno';
    const _keyobjectiveForma = 'objectiveForma';
    const _keyobjectiveCotorno = 'objectiveCotorno';
    const _keyCaja = 'caja';
    const _keycajaForma = 'cajaForma';
    const _keycajaCotorno = 'cajaCotorno';
    _preferences = await SharedPreferences.getInstance();

    await _preferences.setBool(_keychipForma, chipForma);
    await _preferences.setBool(_keychipCotorno, chipContorno);
    await _preferences.setBool(_keyobjectiveForma, objectiveForma);
    await _preferences.setBool(_keyobjectiveCotorno, objectiveContorno);
    await _preferences.setBool(_keyCaja, caja);
    await _preferences.setBool(_keycajaForma, cajaForma);
    await _preferences.setBool(_keycajaCotorno, cajaContorno);
  }

  Future<void> configuracion() async {
    SharedPreferences _preferences = await SharedPreferences.getInstance();

    const _keychipForma = 'chipForma';
    const _keychipCotorno = 'chipContorno';
    const _keyobjectiveForma = 'objectiveForma';
    const _keyobjectiveCotorno = 'objectiveCotorno';
    const _keyCaja = 'caja';
    const _keycajaForma = 'cajaForma';
    const _keycajaCotorno = 'cajaCotorno';

    _preferences.getBool(_keychipForma);
    _preferences.getBool(_keychipCotorno);
    _preferences.getBool(_keyobjectiveForma);
    _preferences.getBool(_keyobjectiveCotorno);
    _preferences.getBool(_keychipCotorno);
    _preferences.getBool(_keycajaForma);
    _preferences.getBool(_keycajaCotorno);
  }
}

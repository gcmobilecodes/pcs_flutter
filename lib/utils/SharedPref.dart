import 'package:shared_preferences/shared_preferences.dart';

import 'app_keys.dart';

class SharedPref {
  late SharedPreferences _preferences;
  static SharedPref? sharedPref;

  Future<void> init() async {
    _preferences = await SharedPreferences.getInstance();
    sharedPref = this;
    return;
  }

  static SharedPref? getInstance() {
    return sharedPref;
  }

  Future addStringToSF(String key, String value) async {
    return _preferences.setString(key, value);
  }

  Future addToken(String key, String value) async {
    return _preferences.setString(key, value);
  }

  Future addIntToSF(String key, int value) async {
    return _preferences.setInt(key, value);
  }

  Future addDoubleToSF(String key, double value) async {
    return _preferences.setDouble(key, value);
  }

  addBoolToSF(String key, bool value) {
    _preferences.setBool(key, value);
  }

  String getAccessToken() {
    return getStringValuesSF(AppKeys.loginId);
  }

  String getStringValuesSF(String key) {
    String? stringValue = _preferences.getString(key);
    return stringValue ?? '';
  }

  bool getBoolValuesSF(String key) {
    //Return bool
    bool? boolValue = _preferences.getBool(key);
    return boolValue ?? false;
  }

  int? getIntValuesSF(String value) {
    //Return int
    int? intValue = _preferences.getInt(value);
    return intValue;
  }

  double? getDoubleValuesSF(String value) {
    //Return double
    double? doubleValue = _preferences.getDouble(value);
    return doubleValue;
  }

  void clearSF() {
    _preferences.clear();
  }
}

import 'package:shared_preferences/shared_preferences.dart';

class LocalStorage {
  SharedPreferences? _sharedPrefrence;

  Future<SharedPreferences?> init() async {
    if (_sharedPrefrence == null) {
      _sharedPrefrence = await SharedPreferences.getInstance();
    }
    return _sharedPrefrence;
  }

  String? getData(String key) {
    if (_sharedPrefrence!.containsKey(key)) {
      return _sharedPrefrence!.get(key).toString();
    }
    return null;
  }

  Future<bool> deleteDataByKey(String key) {
    return _sharedPrefrence!.remove(key);
  }

  void saveData(String key, dynamic value) {
    _sharedPrefrence!.setString(key, value.toString());
  }

  void saveBooleanData(String key, bool value) {
    _sharedPrefrence!.setBool(key, value);
  }

  bool? getBooleanData(String key) {
    return _sharedPrefrence?.getBool(key) ?? null;
  }

  bool containsKey(String keyDate) {
    return _sharedPrefrence!.containsKey(keyDate);
  }
}

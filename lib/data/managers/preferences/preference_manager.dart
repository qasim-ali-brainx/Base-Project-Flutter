import 'package:shared_preferences/shared_preferences.dart';

class PreferenceManager {
  static final PreferenceManager _instance = PreferenceManager._internal();

  PreferenceManager._internal();

  static PreferenceManager get instance => _instance;
  SharedPreferences? preferences;

  setString({required String key, required String value}) async {
    preferences ??= await SharedPreferences.getInstance();
    await preferences!.setString(key, value);
  }

  clearValue({required String key}) async {
    preferences ??= await SharedPreferences.getInstance();
    await preferences!.remove(key);
  }

  Future<String?> getString({required String key}) async {
    preferences ??= await SharedPreferences.getInstance();
    String? result = preferences!.getString(key);
    return result;
  }

  setInt({required String key, required int value}) async {
    preferences ??= await SharedPreferences.getInstance();
    await preferences!.setInt(key, value);
  }

  Future<int?> getInt({required String key}) async {
    preferences ??= await SharedPreferences.getInstance();
    int? result = preferences!.getInt(key);
    return result;
  }

  setBool({required String key, required bool value}) async {
    preferences ??= await SharedPreferences.getInstance();
    await preferences!.setBool(key, value);
  }

  Future<bool?> getBool({required String key}) async {
    preferences ??= await SharedPreferences.getInstance();
    bool? result = preferences!.getBool(key);
    return result;
  }

}

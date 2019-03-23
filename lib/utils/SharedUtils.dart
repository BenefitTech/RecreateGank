import 'package:shared_preferences/shared_preferences.dart';

class SharedUtils {
  static saveString(String key ,value) async {
    SharedPreferences shared =await SharedPreferences.getInstance();
    shared.setString(key, value);
  }

  static saveList(String key , List<String> value) async {
    SharedPreferences shared =await SharedPreferences.getInstance();
    return shared.setStringList(key, value);
  }

  static get(String key) async {
    SharedPreferences shared =await SharedPreferences.getInstance();
    return shared.get(key);
  }

  static remove(String key) async {
    SharedPreferences shared =await SharedPreferences.getInstance();
    return shared.remove(key);
  }
}
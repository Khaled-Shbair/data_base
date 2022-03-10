import 'package:data_base/models/users.dart';
import 'package:shared_preferences/shared_preferences.dart';

enum pref_Key { id, name, email, login }

class SharedPreferencesController {
  static final _instance = SharedPreferencesController._();
  late SharedPreferences _sharedPreferences;

  factory SharedPreferencesController() {
    return _instance;
  }

  SharedPreferencesController._();

  Future<void> initPref() async {
    _sharedPreferences = await SharedPreferences.getInstance();
  }

  Future<void> save(Users users) async {
    await _sharedPreferences.setInt(pref_Key.id.toString(), users.id);
    await _sharedPreferences.setString(pref_Key.name.toString(), users.name);
    await _sharedPreferences.setString(pref_Key.email.toString(), users.email);
    await _sharedPreferences.setBool(pref_Key.login.toString(), true);
  }

  bool get login =>
      _sharedPreferences.getBool(pref_Key.login.toString()) ?? false;

  Future<bool> clear() async => await _sharedPreferences.clear();

  T? getKey<T>({required String key}) {
    return _sharedPreferences.get(key) as T?;
  }
}

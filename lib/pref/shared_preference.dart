import 'package:shared_preferences/shared_preferences.dart';

enum prefKey { email, login }

class SharedPrefController {
  static final SharedPrefController _instance = SharedPrefController._();
  late SharedPreferences _sharedPreferences;

  factory SharedPrefController() {
    return _instance;
  }

  SharedPrefController._();

  Future<void> initSharedPreferences() async {
    _sharedPreferences = await SharedPreferences.getInstance();
  }

  Future<void> save({required String email}) async {
    await _sharedPreferences.setBool(prefKey.login.toString(), true);
    await _sharedPreferences.setString(prefKey.email.toString(), email);
  }

  bool get login =>
      _sharedPreferences.getBool(prefKey.login.toString()) ?? false;

  String get email =>
      _sharedPreferences.getString(prefKey.email.toString()) ?? '';

  Future<bool> remove({required String key}) async {
    if (_sharedPreferences.containsKey(key)) {
      return await _sharedPreferences.remove(key);
    }
    return false;
  }

  Future<bool> clear() async {
    return await _sharedPreferences.clear();
  }
}

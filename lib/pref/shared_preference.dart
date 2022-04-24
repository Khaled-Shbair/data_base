import 'package:shared_preferences/shared_preferences.dart';

enum prefKey { email, login, language }

class SharedPrefController {
  static final SharedPrefController _instance = SharedPrefController._();

  late SharedPreferences _sharedPreferences;

  SharedPrefController._();

  factory SharedPrefController() {
    return _instance;
  }

  Future<void> initSharedPreferences() async {
    _sharedPreferences = await SharedPreferences.getInstance();
  }

  Future<void> save({required String email}) async {
    await _sharedPreferences.setBool(prefKey.login.toString(), true);
    await _sharedPreferences.setString(prefKey.email.toString(), email);
  }

  Future<bool> changeLanguage(String language) async {
    return _sharedPreferences.setString(prefKey.language.toString(), language);
  }

  String get language =>
      _sharedPreferences.getString(prefKey.language.toString()) ?? 'en';

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

  Future<bool> cleared() async {
    return await _sharedPreferences.clear();
  }
}

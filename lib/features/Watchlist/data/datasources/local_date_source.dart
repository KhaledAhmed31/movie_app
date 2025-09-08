import 'package:injectable/injectable.dart';
import 'package:shared_preferences/shared_preferences.dart';
@singleton
class LocalDateSource {
  final SharedPreferences _sharedPreferences;
  LocalDateSource(this._sharedPreferences);
  Future<void> saveUserId(String userId) async =>
      await _sharedPreferences.setString('userId', userId);

  String getUserId() => _sharedPreferences.getString('userId') ?? '';
  Future<void> deleteUserId() => _sharedPreferences.remove('userId');
}

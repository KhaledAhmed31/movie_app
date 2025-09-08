import 'package:dio/dio.dart';
import 'package:injectable/injectable.dart';
import 'package:movie_app/core/api/consts/api_consts.dart';
import 'package:shared_preferences/shared_preferences.dart';

@module
abstract class RegisterModule {
  @lazySingleton
  Dio dio() => Dio(
    BaseOptions(
      baseUrl: ApiConsts.baseUrl,
      headers: {"Authorization": ApiConsts.apiKey},
      
    ),
  );

  @preResolve
  Future<SharedPreferences> get sharedPreferences async=> await SharedPreferences.getInstance();
}

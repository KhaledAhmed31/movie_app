import 'package:dio/dio.dart';
import 'package:hive/hive.dart';
import 'package:injectable/injectable.dart';
import 'package:movie_app/core/db/db_config.dart';
import 'package:path_provider/path_provider.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:sqflite/sqflite.dart';

import '../api/consts/api_consts.dart';

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
  Future<SharedPreferences> get sharedPreferences async =>
      await SharedPreferences.getInstance();

  @preResolve
  Future<BoxCollection> get myStorage async => await BoxCollection.open(
    'MyFirstFluffyBox',
    {"watchlist"},
    path: (await getApplicationDocumentsDirectory()).path,
  );

  @preResolve
  Future<CollectionBox<Map>> get watchlistBox async =>
      (await myStorage).openBox<Map>("watchlist");


  @preResolve
  Future<Database> get myDb async => await getDb;
}

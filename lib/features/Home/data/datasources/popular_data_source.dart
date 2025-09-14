import 'package:dio/dio.dart';
import 'package:injectable/injectable.dart';

import '../../../../core/api/consts/api_consts.dart';
import '../../../../core/errors/remote/popular_exception.dart';
import '../../../../core/errors/remote/remote_exception.dart';
import '../models/movies_sections_response.dart';
import 'movies_data_source.dart';
@lazySingleton

class PopularDataSource implements MoviesDataSource {
  PopularDataSource(this._dio);
  final Dio _dio;
  @override
  Future<SectionsMoviesResponse> getMovies([int page=1]) async {
    try {
      final response = await _dio.get(ApiConsts.popularEndpoint,queryParameters: {"page":page});
      return SectionsMoviesResponse.fromJson(response.data);
    } catch (e) {
      if (e is DioException) {
        if (e.response != null) {
          if (e.response?.statusCode == 401) {
            throw RemoteException(message: "Invalid api key");
          } else if (e.response?.statusCode == 404) {
            throw RemoteException(
              message: "The resource you requested could not be found.",
            );
          } else {
            throw RemoteException(
              message: "Something went wrong, please try again later.",
            );
          }
        } else {
          throw RemoteException(
            message: "Please check your internet connection and try again.",
          );
        }
      }
      throw const PopularException();
    }
  }
}

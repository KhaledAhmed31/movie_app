import 'package:dio/dio.dart';
import 'package:injectable/injectable.dart';

import '../../../../core/api/consts/api_consts.dart';
import '../../../../core/errors/remote/remote_exception.dart';
import '../../../../core/errors/remote/search_exception.dart';
import '../../../Home/data/models/movies_sections_response.dart';

@lazySingleton
class SearchDataSource {
  final Dio _dio;
  SearchDataSource(this._dio);
  Future<SectionsMoviesResponse> getSearchMovies(
    String query, [
    int page = 1,
  ]) async {
    if (query.isEmpty) return SectionsMoviesResponse.fromJson({"results": []});
    try {
      final response = await _dio.get(
        ApiConsts.searchEndpoint,
        queryParameters: {"query": query, "page": page},
      );
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
      throw SearchException(message: e.toString());
    }
  }
}

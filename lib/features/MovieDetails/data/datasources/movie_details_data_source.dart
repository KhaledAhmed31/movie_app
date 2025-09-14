import 'package:dio/dio.dart';
import 'package:injectable/injectable.dart';

import '../../../../core/api/consts/api_consts.dart';
import '../../../../core/errors/remote/movie_details_exception.dart';
import '../../../../core/errors/remote/remote_exception.dart';
import '../models/movie_details_response.dart';
@singleton
class MovieDetailsDataSource {
  final Dio _dio;
  MovieDetailsDataSource(this._dio);

  Future<MovieDetailsResponse> getMovieDetails(int movieId) async {
    try{
      final response = await _dio.get(ApiConsts.movieDetailsEndpoint+movieId.toString());
      return MovieDetailsResponse.fromJson(response.data);
    }catch(e){
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
      throw const MovieDetailsException();
    }
  }
}
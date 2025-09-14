import 'package:injectable/injectable.dart';

import '../../../../core/errors/app_exception.dart';
import '../../../../core/errors/failure/failure.dart';
import '../../domain/entities/movie_details_entity.dart';
import '../../domain/repositories/movie_details_repo_inerface.dart';
import '../datasources/movie_details_data_source.dart';
import '../mapper/movie_datails_mapper.dart';
@LazySingleton(as: MovieDetailsRepoInterface)
class MovieDetailsRepo implements MovieDetailsRepoInterface {
  final MovieDetailsDataSource _movieDetailsDataSource;
  MovieDetailsRepo(this._movieDetailsDataSource);
  @override
  Future<(Failure?, MovieDetailsEntity?)> getMovieDetails(int movieId) async{
    try {
      final response = await _movieDetailsDataSource.getMovieDetails(movieId);
      return (null, response.toEntity());
    } on AppException catch (e) {
      return (Failure(e.message), null);
    }
  }
}

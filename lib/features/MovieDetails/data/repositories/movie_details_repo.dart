import 'package:injectable/injectable.dart';
import 'package:movie_app/core/errors/app_exception.dart';
import 'package:movie_app/core/errors/failure/failure.dart';
import 'package:movie_app/features/MovieDetails/data/datasources/movie_details_data_source.dart';
import 'package:movie_app/features/MovieDetails/data/mapper/movie_datails_mapper.dart';
import 'package:movie_app/features/MovieDetails/domain/entities/movie_details_entity.dart';
import 'package:movie_app/features/MovieDetails/domain/repositories/movie_details_repo_inerface.dart';
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

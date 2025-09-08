import 'package:injectable/injectable.dart';
import 'package:movie_app/core/errors/failure/failure.dart';
import 'package:movie_app/features/MovieDetails/domain/entities/movie_details_entity.dart';
@factoryMethod
abstract class MovieDetailsRepoInterface {
  Future<(Failure?,MovieDetailsEntity?)> getMovieDetails(int movieId);
}
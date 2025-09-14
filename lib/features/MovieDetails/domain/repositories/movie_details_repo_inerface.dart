import 'package:injectable/injectable.dart';

import '../../../../core/errors/failure/failure.dart';
import '../entities/movie_details_entity.dart';
@factoryMethod
abstract class MovieDetailsRepoInterface {
  Future<(Failure?,MovieDetailsEntity?)> getMovieDetails(int movieId);
}
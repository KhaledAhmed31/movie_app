import 'package:injectable/injectable.dart';
import 'package:movie_app/core/errors/failure/failure.dart';
import 'package:movie_app/features/Home/data/datasources/movies_data_source.dart';
import 'package:movie_app/features/Home/domain/entities/section_movies_entity.dart';

@factoryMethod
abstract class MoviesSectionsRepoInterface {
  Future<(Failure?, SectionsMoviesEntity?)> getMoviesSections({
   required MoviesDataSource sectoinType,
    int page = 1
  });
}

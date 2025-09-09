import 'package:injectable/injectable.dart';
import '../../../../core/errors/failure/failure.dart';
import '../../data/datasources/movies_data_source.dart';
import '../entities/section_movies_entity.dart';

@factoryMethod
abstract class MoviesSectionsRepoInterface {
  Future<(Failure?, SectionsMoviesEntity?)> getMoviesSections({
   required MoviesDataSource sectoinType,
    int page = 1
  });
}

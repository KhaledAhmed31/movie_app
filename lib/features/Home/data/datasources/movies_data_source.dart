import 'package:injectable/injectable.dart';
import 'package:movie_app/features/Home/data/models/movies_sections_response.dart';

@factoryMethod
abstract class MoviesDataSource {
  Future<SectionsMoviesResponse> getMovies([int page=1]);
}

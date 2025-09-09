import 'package:injectable/injectable.dart';
import '../models/movies_sections_response.dart';

@factoryMethod
abstract class MoviesDataSource {
  Future<SectionsMoviesResponse> getMovies([int page=1]);
}

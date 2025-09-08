import 'package:injectable/injectable.dart';
import 'package:movie_app/core/errors/failure/failure.dart';
import 'package:movie_app/features/Home/domain/entities/section_movies_entity.dart';
@factoryMethod
abstract class SearchRepoInterface {
  Future<(Failure?,SectionsMoviesEntity?)> searchMovies({required String query,int page=1});
}
import 'package:injectable/injectable.dart';
import '../../../../core/errors/failure/failure.dart';
import '../../../Home/domain/entities/section_movies_entity.dart';
@factoryMethod
abstract class SearchRepoInterface {
  Future<(Failure?,SectionsMoviesEntity?)> searchMovies({required String query,int page=1});
}
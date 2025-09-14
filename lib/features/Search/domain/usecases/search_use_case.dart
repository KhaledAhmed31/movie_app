import 'package:injectable/injectable.dart';

import '../../../../core/errors/failure/failure.dart';
import '../../../Home/domain/entities/section_movies_entity.dart';
import '../repositories/search_repo_interface.dart';
@lazySingleton
class SearchUseCase {
  final SearchRepoInterface _searchRepoInterface;
  SearchUseCase(this._searchRepoInterface);
  Future<(Failure?, SectionsMoviesEntity?)> call({required String query})=>_searchRepoInterface.searchMovies(query: query);
}
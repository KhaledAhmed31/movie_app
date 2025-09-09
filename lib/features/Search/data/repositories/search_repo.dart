import 'package:injectable/injectable.dart';
import '../../../../core/errors/app_exception.dart';
import '../../../../core/errors/failure/failure.dart';
import '../../../Home/data/mapper/sections_mapper.dart';
import '../../../Home/domain/entities/section_movies_entity.dart';
import '../datasources/search_data_source.dart';
import '../../domain/repositories/search_repo_interface.dart';
@LazySingleton(as: SearchRepoInterface)
class SearchRepo implements SearchRepoInterface{
  final SearchDataSource _searchDataSource;
  SearchRepo(this._searchDataSource);
  @override
  Future<(Failure?, SectionsMoviesEntity?)> searchMovies({required String query,int page=1})async {
    try{
      final result = await _searchDataSource.getSearchMovies(query,page);
      return (null,result.toEntity());
    }on AppException catch(e){
      return (Failure(e.message),null);
    }
  }

}
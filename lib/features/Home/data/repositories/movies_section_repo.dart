import 'package:injectable/injectable.dart';
import '../../../../core/errors/app_exception.dart';
import '../../../../core/errors/failure/failure.dart';
import '../datasources/movies_data_source.dart';
import '../mapper/sections_mapper.dart';
import '../../domain/entities/section_movies_entity.dart';
import '../../domain/repositories/movies_sections_repo_interface.dart';

@LazySingleton(as: MoviesSectionsRepoInterface)
class MoviesSectionRepo implements MoviesSectionsRepoInterface {
  const MoviesSectionRepo();

  @override
  Future<(Failure?, SectionsMoviesEntity?)> getMoviesSections(
    {required MoviesDataSource sectoinType,int page=1}
  ) async {
    try {
      return (null, (await sectoinType.getMovies(page)).toEntity());
    } on AppException catch (e) {
      return (Failure(e.message), null);
    }
  }
}

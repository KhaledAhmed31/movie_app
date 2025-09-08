import 'package:injectable/injectable.dart';
import 'package:movie_app/core/errors/app_exception.dart';
import 'package:movie_app/core/errors/failure/failure.dart';
import 'package:movie_app/features/Home/data/datasources/movies_data_source.dart';
import 'package:movie_app/features/Home/data/mapper/sections_mapper.dart';
import 'package:movie_app/features/Home/domain/entities/section_movies_entity.dart';
import 'package:movie_app/features/Home/domain/repositories/movies_sections_repo_interface.dart';

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

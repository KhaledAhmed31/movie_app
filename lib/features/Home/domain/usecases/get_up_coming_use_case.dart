import 'package:injectable/injectable.dart';
import 'package:movie_app/core/di/dependency_injection.dart';
import 'package:movie_app/core/errors/failure/failure.dart';
import 'package:movie_app/features/Home/data/datasources/up_coming_date_source.dart';
import 'package:movie_app/features/Home/domain/entities/section_movies_entity.dart';
import 'package:movie_app/features/Home/domain/repositories/movies_sections_repo_interface.dart';

@lazySingleton
class GetUpComingUseCase {
  final MoviesSectionsRepoInterface repo;
  GetUpComingUseCase(this.repo);
  Future<(Failure?, SectionsMoviesEntity?)> call([int page = 1]) => repo.getMoviesSections(
    sectoinType: getIt.get<UpComingDateSource>(),page: page
  );
}
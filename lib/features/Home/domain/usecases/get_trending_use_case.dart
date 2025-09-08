import 'package:injectable/injectable.dart';
import 'package:movie_app/core/di/dependency_injection.dart';
import 'package:movie_app/core/errors/failure/failure.dart';
import 'package:movie_app/features/Home/data/datasources/trending_date_source.dart';
import 'package:movie_app/features/Home/domain/entities/section_movies_entity.dart';
import 'package:movie_app/features/Home/domain/repositories/movies_sections_repo_interface.dart';

@lazySingleton
class GetTrendingUseCase {
  final MoviesSectionsRepoInterface repo;
  GetTrendingUseCase(this.repo);
  Future<(Failure?, SectionsMoviesEntity?)> call([int page = 1]) => repo.getMoviesSections(
    sectoinType: getIt.get<TrendingDateSource>(),page: page
  );
}
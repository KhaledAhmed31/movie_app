import 'package:injectable/injectable.dart';

import '../../../../core/di/dependency_injection.dart';
import '../../../../core/errors/failure/failure.dart';
import '../../data/datasources/trending_date_source.dart';
import '../entities/section_movies_entity.dart';
import '../repositories/movies_sections_repo_interface.dart';

@lazySingleton
class GetTrendingUseCase {
  final MoviesSectionsRepoInterface repo;
  GetTrendingUseCase(this.repo);
  Future<(Failure?, SectionsMoviesEntity?)> call([int page = 1]) => repo.getMoviesSections(
    sectoinType: getIt.get<TrendingDateSource>(),page: page
  );
}
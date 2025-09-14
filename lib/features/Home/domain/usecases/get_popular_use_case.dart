import 'package:injectable/injectable.dart';

import '../../../../core/di/dependency_injection.dart';
import '../../../../core/errors/failure/failure.dart';
import '../../data/datasources/popular_data_source.dart';
import '../entities/section_movies_entity.dart';
import '../repositories/movies_sections_repo_interface.dart';

@lazySingleton
class GetPopularUseCase {
  final MoviesSectionsRepoInterface repo;
  GetPopularUseCase(this.repo);
  Future<(Failure?, SectionsMoviesEntity?)> call([int page = 1]) => repo.getMoviesSections(
    sectoinType: getIt.get<PopularDataSource>(),page: page
  );
}
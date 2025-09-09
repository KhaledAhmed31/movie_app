import 'package:injectable/injectable.dart';
import '../../../../core/di/dependency_injection.dart';
import '../../../../core/errors/failure/failure.dart';
import '../../data/datasources/top_rated_date_source.dart';
import '../entities/section_movies_entity.dart';
import '../repositories/movies_sections_repo_interface.dart';

@lazySingleton
class GetTopRatedUseCase {
  final MoviesSectionsRepoInterface repo;
  GetTopRatedUseCase(this.repo);
  Future<(Failure?, SectionsMoviesEntity?)> call([int page = 1]) => repo.getMoviesSections(
    sectoinType: getIt.get<TopRatedDateSource>(),page: page
  );
}
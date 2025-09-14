import 'package:injectable/injectable.dart';

import '../../../../core/errors/failure/failure.dart';
import '../entities/movie_details_entity.dart';
import '../repositories/movie_details_repo_inerface.dart';
@singleton
class GetMovieDetailsUseCase {
  final MovieDetailsRepoInterface movieDetailsRepoInterface;
  GetMovieDetailsUseCase({required this.movieDetailsRepoInterface});
  Future<(Failure?, MovieDetailsEntity?)> call(int movieId) => movieDetailsRepoInterface.getMovieDetails(movieId);
}
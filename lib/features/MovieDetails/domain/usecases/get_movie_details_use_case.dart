import 'package:injectable/injectable.dart';
import 'package:movie_app/core/errors/failure/failure.dart';
import 'package:movie_app/features/MovieDetails/domain/entities/movie_details_entity.dart';
import 'package:movie_app/features/MovieDetails/domain/repositories/movie_details_repo_inerface.dart';
@singleton
class GetMovieDetailsUseCase {
  final MovieDetailsRepoInterface movieDetailsRepoInterface;
  GetMovieDetailsUseCase({required this.movieDetailsRepoInterface});
  Future<(Failure?, MovieDetailsEntity?)> call(int movieId) => movieDetailsRepoInterface.getMovieDetails(movieId);
}
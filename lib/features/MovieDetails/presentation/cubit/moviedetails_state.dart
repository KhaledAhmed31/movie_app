
import 'package:movie_app/features/MovieDetails/domain/entities/movie_details_entity.dart';

abstract class MovieDetailsState  {}

class MoviedetailsInitialState extends MovieDetailsState {}

class MoviedetailsLoadingState extends MovieDetailsState {}

class MoviedetailsLoadedState extends MovieDetailsState {
  final MovieDetailsEntity movieDetailsEntity;
  MoviedetailsLoadedState({required this.movieDetailsEntity});
}

class MoviedetailsErrorState extends MovieDetailsState {
  final String message;
  MoviedetailsErrorState(this.message);
}

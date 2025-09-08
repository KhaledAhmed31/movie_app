import 'package:movie_app/features/Watchlist/data/models/watch_list_model.dart';

class WatchlistEntity extends WatchlistMovieModel {
  WatchlistEntity({
    required super.genere,
    required super.id,
    required super.runtime,
    required super.title,
    required super.posterPath,
    required super.releaseDate,
    required super.voteAverage,
  });
}

import 'package:movie_app/features/MovieDetails/domain/entities/movie_details_entity.dart';
import 'package:movie_app/features/Watchlist/data/models/watch_list_model.dart';
import 'package:movie_app/features/Watchlist/domain/entity/watchlist_entity.dart';

extension WatchlistMapper on WatchlistMovieModel {
  WatchlistEntity toEntity() => WatchlistEntity(
    id: id,
    title: title,
    genere: genere,
    runtime: runtime,
    posterPath: posterPath,
    releaseDate: releaseDate,
    voteAverage: voteAverage,
  );
}
extension DetailsMapper on MovieDetailsEntity {
  WatchlistEntity toModel() => WatchlistEntity(
    id: id??0,
    title: title??'',
    runtime: runtime??0,
    genere: genres?[0]??'',
    posterPath: posterPath??'',
    releaseDate: releaseDate??'',
    voteAverage: voteAverage??0.0,
  );
}

import 'package:injectable/injectable.dart';
import '../../../../core/errors/app_exception.dart';
import '../../../../core/errors/failure/failure.dart';
import '../../../MovieDetails/domain/entities/movie_details_entity.dart';
import '../datasources/watchlist_data_source.dart';
import '../mapper/watchlist_mapper.dart';
import '../models/watch_list_model.dart';
import '../../domain/entity/watchlist_entity.dart';
@singleton
class WatchlistRepo {
  final WatchlistDataSource _watchlistDataSource;

  WatchlistRepo(this._watchlistDataSource);

  Future<(Failure?, List<WatchlistEntity>?)> getWatchlist() async {
    try {
      WatchlistModel watchlistModel = await _watchlistDataSource.getWatchlist();
      return (null,watchlistModel.movies.map((e) => e.toEntity()).toList());
    }on AppException catch (e) {
      return (Failure(e.message), null);
    }
  }

   Future<(Failure?, List<WatchlistEntity>?)> deleteFromWatchlist(MovieDetailsEntity movie) async {
    try {
      WatchlistModel watchlistModel = await _watchlistDataSource.removeFromWatchlist( movie.toModel());
      return (null,watchlistModel.movies.map((e) => e.toEntity()).toList());
    }on AppException catch (e) {
      return (Failure(e.message), null);
    }
  }
   Future<(Failure?, List<WatchlistEntity>?)> addToWatchlist(MovieDetailsEntity movie)  async {
    try {
      WatchlistModel watchlistModel = await _watchlistDataSource.addToWatchlist( movie.toModel());
      return (null,watchlistModel.movies.map((e) => e.toEntity()).toList());
    }on AppException catch (e) {
      return (Failure(e.message), null);
    }
  }
}

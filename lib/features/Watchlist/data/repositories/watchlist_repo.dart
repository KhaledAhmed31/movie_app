import 'package:injectable/injectable.dart';
import 'package:movie_app/features/Watchlist/data/datasources/watchlist_hive_data_source.dart';
import '../../../../core/errors/app_exception.dart';
import '../../../../core/errors/failure/failure.dart';
import '../../../MovieDetails/domain/entities/movie_details_entity.dart';
import '../mapper/watchlist_mapper.dart';
import '../models/watch_list_model.dart';
import '../../domain/entity/watchlist_entity.dart';

@singleton
class WatchlistRepo {
  final WatchlistHiveDataSource _watchlistHiveDataSource;

  WatchlistRepo(this._watchlistHiveDataSource);

  Future<(Failure?, List<WatchlistEntity>?)> getWatchlist() async {
    try {
      WatchlistModel watchlistModel = await _watchlistHiveDataSource
          .getWatchlist();
      return (null, watchlistModel.movies.map((e) => e.toEntity()).toList());
    } on AppException catch (e) {
      return (Failure(e.message), null);
    }
  }

  Future<(Failure?, void)> deleteFromWatchlist(MovieDetailsEntity movie) async {
    try {
      await _watchlistHiveDataSource.removeFromWatchlist(
        movie.toWatchlistEntity(),
      );
      return (null, null);
    } on AppException catch (e) {
      return (Failure(e.message), null);
    }
  }

  Future<(Failure?, void)> addToWatchlist(MovieDetailsEntity movie) async {
    try {
      await _watchlistHiveDataSource.addToWatchlist(movie.toWatchlistEntity());
      return (null, null);
    } on AppException catch (e) {
      return (Failure(e.message), null);
    }
  }
}

import 'package:injectable/injectable.dart';
import '../../../../core/di/dependency_injection.dart';
import '../datasources/watchlist_data_source.dart';
import '../datasources/watchlist_sqflite_data_source.dart';
import '../../../../core/errors/app_exception.dart';
import '../../../../core/errors/failure/failure.dart';
import '../../../MovieDetails/domain/entities/movie_details_entity.dart';
import '../mapper/watchlist_mapper.dart';
import '../models/watch_list_model.dart';
import '../../domain/entity/watchlist_entity.dart';

@lazySingleton
class WatchlistRepo {
  final WatchlistDataSource _watchlistDataSource;

  WatchlistRepo():_watchlistDataSource = getIt<WatchlistSqfliteDataSource>();

  Future<(Failure?, List<WatchlistEntity>?)> getWatchlist() async {
    try {
      WatchlistModel watchlistModel = await _watchlistDataSource.getWatchlist();
      return (null, watchlistModel.movies.map((e) => e.toEntity()).toList());
    } on AppException catch (e) {
      return (Failure(e.message), null);
    }
  }

  Future<(Failure?, void)> deleteFromWatchlist(MovieDetailsEntity movie) async {
    try {
      await _watchlistDataSource.deleteFromWatchlist(movie.toWatchlistEntity());
      return (null, null);
    } on AppException catch (e) {
      return (Failure(e.message), null);
    }
  }

  Future<(Failure?, void)> addToWatchlist(MovieDetailsEntity movie) async {
    try {
      await _watchlistDataSource.addToWatchlist(movie.toWatchlistEntity());
      return (null, null);
    } on AppException catch (e) {
      return (Failure(e.message), null);
    }
  }
}

import 'package:injectable/injectable.dart';
import 'package:movie_app/features/Watchlist/data/models/watch_list_model.dart';

@factoryMethod
abstract class WatchlistDataSource {
  Future<void> addToWatchlist(WatchlistMovieModel movie);
  Future<void> deleteFromWatchlist(WatchlistMovieModel movie);
  Future<WatchlistModel> getWatchlist();
}

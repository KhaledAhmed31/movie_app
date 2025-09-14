import 'package:injectable/injectable.dart';
import '../models/watch_list_model.dart';

@factoryMethod
abstract class WatchlistDataSource {
  Future<void> addToWatchlist(WatchlistMovieModel movie);
  Future<void> deleteFromWatchlist(WatchlistMovieModel movie);
  Future<WatchlistModel> getWatchlist();
}

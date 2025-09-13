import 'package:hive/hive.dart';
import 'package:injectable/injectable.dart';
import 'package:movie_app/core/errors/local/watchlist_exception.dart';
import 'package:movie_app/features/Watchlist/data/models/watch_list_model.dart';

@lazySingleton
class WatchlistHiveDataSource {
  final CollectionBox<Map> _watchlistBox;

  WatchlistHiveDataSource(this._watchlistBox);

  Future<void> addToWatchlist(WatchlistMovieModel movie) async {
    try {
      await _watchlistBox.put(movie.id.toString(), movie.toJson());
    } catch (e) {
      throw WatchlistException();
    }
  }

  Future<void> removeFromWatchlist(WatchlistMovieModel movie) async {
    try {
      await _watchlistBox.delete(movie.id.toString());
    } catch (e) {
      throw WatchlistException();
    }
  }

  Future<WatchlistModel> getWatchlist() async {
    try {
      List<String> keys = await _watchlistBox.getAllKeys();
      
      return WatchlistModel(
        movies: (await _watchlistBox.getAll(keys))
            .map((e) => WatchlistMovieModel.fromJson(e??{}))
            .toList(),
      );
    } catch (e) {
      throw WatchlistException(message:  e.toString());
    }
  }
}

import 'package:hive/hive.dart';
import 'package:injectable/injectable.dart';
import 'watchlist_data_source.dart';
import '../../../../core/errors/local/watchlist_exception.dart';
import '../models/watch_list_model.dart';

 @lazySingleton 
class WatchlistHiveDataSource implements WatchlistDataSource {
  final CollectionBox<Map> _watchlistBox;

  WatchlistHiveDataSource(this._watchlistBox);

  @override
  Future<void> addToWatchlist(WatchlistMovieModel movie) async {
    try {
      await _watchlistBox.put(movie.id.toString(), movie.toJson());
    } catch (e) {
      throw WatchlistException();
    }
  }

  @override
  Future<void> deleteFromWatchlist(WatchlistMovieModel movie) async {
    try {
      await _watchlistBox.delete(movie.id.toString());
    } catch (e) {
      throw WatchlistException();
    }
  }

  @override
  Future<WatchlistModel> getWatchlist() async {
    try {
      List<String> keys = await _watchlistBox.getAllKeys();
      await _watchlistBox.flush();
      return WatchlistModel(
        movies: (await _watchlistBox.getAll(
          keys,
        )).map((e) => WatchlistMovieModel.fromJson(e ?? {})).toList(),
      );
    } catch (e) {
      throw WatchlistException(message: e.toString());
    }
  }
}

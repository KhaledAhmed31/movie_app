import 'package:injectable/injectable.dart';
import 'package:movie_app/features/Watchlist/data/datasources/watchlist_data_source.dart';
import 'package:movie_app/features/Watchlist/data/models/watch_list_model.dart';
import 'package:sqflite/sqflite.dart';

@LazySingleton(as: WatchlistDataSource)
class WatchlistSqfliteDataSource implements WatchlistDataSource {
  final Database _myDb;
  WatchlistSqfliteDataSource(this._myDb);
  @override
  Future<void> addToWatchlist(WatchlistMovieModel movie) async {
    _myDb.insert('watchlist', {
      'id': movie.id,
      'title': movie.title,
      'posterPath': movie.posterPath,
      'releaseDate': movie.releaseDate,
      'genre': movie.genere,
      'runtime': movie.runtime,
      'voteAverage': movie.voteAverage,
    });
  }

  @override
  Future<void> deleteFromWatchlist(WatchlistMovieModel movie) async {
    _myDb.delete('watchlist', where: "id=${movie.id}");
  }

  @override
  Future<WatchlistModel> getWatchlist() async {
    List<Map<String, dynamic>> data = await _myDb.rawQuery(
      "SELECT * FROM watchlist",
    );
    return WatchlistModel(
      movies: data.map((e) {
        return WatchlistMovieModel.fromJson(e);
      }).toList(),
    );
  }
}

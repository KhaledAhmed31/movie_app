import 'package:injectable/injectable.dart';
import 'package:movie_app/features/Watchlist/data/models/watch_list_model.dart';
import 'package:sqflite/sqflite.dart';
@singleton
// Commented out to avoid duplicate registration
class WatchlistSqfliteDataSource  {
  final Database _myDb;
  WatchlistSqfliteDataSource(this._myDb);

  Future<void> addToWatchlist(WatchlistMovieModel movie) async {
    _myDb.insert('watchlist', {
      'movieId': movie.id,
      'movieTitle': movie.title,
      'moviePoster': movie.posterPath,
      'movieReleaseDate': movie.releaseDate,
      'movieRating': movie.voteAverage,
      'genre': movie.genere,
      'runtime': movie.runtime,
      'voteAverage': movie.voteAverage,
    });
  }

  Future<void> deleteFromWatchlist(WatchlistMovieModel movie) async {
    _myDb.delete('watchlist', where: "movieId=${movie.id}");
  }

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

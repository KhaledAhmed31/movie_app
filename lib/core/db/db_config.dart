import 'package:sqflite/sqflite.dart';

  const String dbName = "movie_app";
  Database? _db;
  Future<Database> get getDb async {
    if (_db != null) return _db!;
    final path = await getDatabasesPath();
    final dbPath = "$path/$dbName.db";
    return await openDatabase(dbPath, onCreate: _initDb,version: 1);
  }

  Future<void> _initDb(Database db, int version) async {
    await db.execute("""\r
      CREATE TABLE IF NOT EXISTS watchlist (
        id INTEGER PRIMARY KEY AUTOINCREMENT,
        movieId INTEGER,
        movieTitle TEXT,
        moviePoster TEXT,
        movieReleaseDate TEXT, 
        movieRating TEXT,
        genre TEXT,
        runtime INTEGER,
        voteAverage REAL
      )
    """);
  }



import 'package:sqflite/sqflite.dart';

  const String dbName = "movie_app";
  Database? _db;
  Future<Database> get getDb async {
    if (_db != null) return _db!;
    final path = await getDatabasesPath();
    final dbPath = "$path/$dbName.db";
    _db = await openDatabase(dbPath, onCreate: _initDb,version: 1);
    return _db!;
  }

  Future<void> _initDb(Database db, int version) async {
    await db.execute("""\r
      CREATE TABLE IF NOT EXISTS watchlist (
        id INTEGER,
        title TEXT,
        posterPath TEXT,
        releaseDate TEXT, 
        genre TEXT,
        runtime INTEGER,
        voteAverage REAL
      )
    """);
  }



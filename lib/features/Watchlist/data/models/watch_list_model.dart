class WatchlistModel {
  final List<WatchlistMovieModel> movies;

  WatchlistModel({required this.movies});

  WatchlistModel.fromJson(Map<String, dynamic> json)
    : movies = List<WatchlistMovieModel>.from(
        json['movies'].map((x) => WatchlistMovieModel.fromJson(x)),
      );

  Map<String, dynamic> toJson() => {
    'movies': movies.map((x) => x.toJson()).toList(),
  };
}

class WatchlistMovieModel {
  int? id;
  String? title;
  String? genere;
  int? runtime;
  String? posterPath;
  String? releaseDate;
  double? voteAverage;

  WatchlistMovieModel({
    required this.runtime,
    required this.genere,
    required this.id,
    required this.title,
    required this.posterPath,
    required this.releaseDate,
    required this.voteAverage,
  });

  WatchlistMovieModel.fromJson(Map<dynamic, dynamic> json) {
    id = json['id'];
    title = json['title'];
    genere = json['genere'];
    runtime = json['runtime'];
    posterPath = json['posterPath'];
    releaseDate = json['releaseDate'];
   if(json['voteAverage'] is double||json['voteAverage'] is int) {
    
    voteAverage = double.parse(json['voteAverage'].toString());
    
    }
  }
  Map<String, dynamic> toJson() => {
    'id': id,
    'title': title,
    'genere': genere,
    'runtime': runtime,
    'posterPath': posterPath,
    'releaseDate': releaseDate,
    'voteAverage': voteAverage,
  };
}

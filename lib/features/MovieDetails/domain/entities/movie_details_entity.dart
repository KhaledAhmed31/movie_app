class MovieDetailsEntity {
  List<String>? pics;
  final String? backdropPath;
  String? posterPath2;
  String? backdropPath2;
  final int? budget;
  final List<String>? genres;
  final int? id;
  final String? originalLanguage;
  final String? overview;
  final String? posterPath;
  final String? releaseDate;
  final int? runtime;
  final String? status;
  final String? tagline;
  final String? title;
  final double? voteAverage;
  final int? voteCount;

  MovieDetailsEntity({
    this.backdropPath,
    this.posterPath2,
    this.backdropPath2,
    this.budget,
    this.genres,
    this.id,
    this.originalLanguage,
    this.overview,
    this.posterPath,
    this.releaseDate,
    this.runtime,
    this.status,
    this.tagline,
    this.title,
    this.voteAverage,
    this.voteCount,
  }) {
    pics = [];
    if (backdropPath != null && (backdropPath!.trim()).isNotEmpty) {
      pics!.add(backdropPath!);
    }
    if (backdropPath2 != null && (backdropPath2!.trim()).isNotEmpty) {
      pics!.add(backdropPath2!);
    }
  }
}

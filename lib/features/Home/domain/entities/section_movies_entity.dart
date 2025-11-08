import 'package:equatable/equatable.dart';

class SectionsMoviesEntity extends Equatable {
  final int? page;
  final List<SectionsMovieEntity>? results;
  final int? totalPages;

  const SectionsMoviesEntity({this.page, this.results, this.totalPages});

  @override
  List<Object?> get props => [results];
}

class SectionsMovieEntity extends Equatable {
  final int? id;
  final String? title;
  final String? posterPath;
  const SectionsMovieEntity({this.id, this.title, this.posterPath});

  @override
  List<Object?> get props => [id, title, posterPath];
}
class SectionsMoviesEntity {
final  int? page;
final  List<SectionsMovieEntity>? results;
final  int? totalPages;

const SectionsMoviesEntity({
    this.page,
    this.results,
    this.totalPages,
  });
  
}
class SectionsMovieEntity {
  int? id;
  String? title;
  String? posterPath;
  SectionsMovieEntity({this.id,this.title,this.posterPath});
}
  
import 'package:movie_app/features/Home/data/models/movies_sections_response.dart';
import 'package:movie_app/features/Home/domain/entities/section_movies_entity.dart';

extension SectionsMapper on SectionsMoviesResponse {
  SectionsMoviesEntity toEntity() {
    return SectionsMoviesEntity(
      page: page,
      results: (results ?? [])
          .map(
            (e) => SectionsMovieEntity(
              id: e.id,
              title: e.title,
              posterPath: e.posterPath,
            ),
          )
          .toList(),
      totalPages: totalPages,
    );
  }
}

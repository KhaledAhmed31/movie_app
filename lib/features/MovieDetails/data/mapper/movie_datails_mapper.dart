import '../models/movie_details_response.dart';
import '../../domain/entities/movie_details_entity.dart';

extension MovieDetailsMapper on MovieDetailsResponse {

  MovieDetailsEntity toEntity() => MovieDetailsEntity(
    backdropPath: backdropPath,
    genres: (genres ?? []).map((e) => e.name ?? "").toList(),
    id: id,
    budget: budget,
    status: status,
    tagline: tagline,
    originalLanguage: originalLanguage,
    backdropPath2: belongsToCollection?.backdropPath ,
    posterPath2: belongsToCollection?.posterPath ,
    overview: overview,
    posterPath: posterPath,
    releaseDate: releaseDate,
    runtime: runtime,
    title: title,
    voteAverage: voteAverage,
    voteCount: voteCount,
  );
}

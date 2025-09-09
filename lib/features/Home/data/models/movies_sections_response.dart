import '../../../../core/common/models/movie_response.dart';

class SectionsMoviesResponse extends CommonMovieResponse {
  SectionsMoviesResponse({
    super.page,
    super.results,
    super.totalPages,
    super.totalResults,
  });
    SectionsMoviesResponse.fromJson(Map<String, dynamic> json) {
    if (json["page"] is int) {
      page = json["page"];
    }
    if (json["results"] is List) {
      results = json["results"] == null
          ? null
          : (json["results"] as List).map((e) => CommonResult.fromJson(e)).toList();
    }
    if (json["total_pages"] is int) {
      totalPages = json["total_pages"];
    }
    if (json["total_results"] is int) {
      totalResults = json["total_results"];
    }
  }

}

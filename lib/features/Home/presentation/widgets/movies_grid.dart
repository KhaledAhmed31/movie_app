import 'package:flutter/material.dart';

import '../../domain/entities/section_movies_entity.dart';
import 'section_movie_card.dart';

class MoviesGrid extends StatelessWidget {
  const MoviesGrid({
    super.key,
    required this.movies,
    this.mainAxisExtent,
    this.crossAxisSpacing,
    this.mainAxisSpacing,
    required this.maxCrossAxisExtent,
    
  });
  final double? mainAxisExtent;
  final double? crossAxisSpacing;
  final double? mainAxisSpacing;
  final int? maxCrossAxisExtent;

  final List<SectionsMovieEntity> movies;
  @override
  Widget build(BuildContext context) {
    return GridView.builder(
      physics: const NeverScrollableScrollPhysics(),
      shrinkWrap: true,
      gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
        mainAxisExtent: mainAxisExtent,
        crossAxisSpacing: crossAxisSpacing ?? 0,
        mainAxisSpacing: mainAxisSpacing ?? 0,
        crossAxisCount: maxCrossAxisExtent??2,
      ),
      itemBuilder: (context, index) =>
          SectionMovieCard(movie: movies[index]),
      addAutomaticKeepAlives: true,
      itemCount: movies.length,
    );
  }
}

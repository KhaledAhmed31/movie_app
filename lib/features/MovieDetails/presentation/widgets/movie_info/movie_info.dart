import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../../domain/entities/movie_details_entity.dart';
import 'extra_info.dart';
import 'movie_back_poster.dart';
import 'movie_poster.dart';
import 'movie_title.dart';

class MovieInfo extends StatelessWidget {
  const MovieInfo({super.key, required this.movie});
  final MovieDetailsEntity movie;
  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        Column(
          children: [
            MovieBackPoster(
              pics: movie.pics ?? [],
              rating: movie.voteAverage ?? 0,
            ),
            Row(
              crossAxisAlignment: CrossAxisAlignment.end,
              children: [
                SizedBox(height: 60.h, width: 120.w),
                MovieTitle(title: movie.title),
              ],
            ),
            ExtraInfo(movie: movie),
          ],
        ),
        Positioned(
          left: 15.w,
          top: 150.h,
          child: MoviePoster(imageUrl: movie.posterPath ?? ''),
        ),
      ],
    );
  }
}

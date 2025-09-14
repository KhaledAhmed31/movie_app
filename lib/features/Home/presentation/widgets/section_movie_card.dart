import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';
import 'package:go_router/go_router.dart';
import 'package:redacted/redacted.dart';

import '../../../../core/api/consts/api_consts.dart';
import '../../../../core/assets/assets.dart';
import '../../../../core/routes/route_path.dart';
import '../../domain/entities/section_movies_entity.dart';

class SectionMovieCard extends StatelessWidget {
  const SectionMovieCard({super.key, required this.movie});
  final SectionsMovieEntity movie;
  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () => context.push(RoutePath.details, extra: movie.id),
      child: ClipRRect(
        borderRadius: BorderRadius.circular(16.r),
        child: CachedNetworkImage(
          imageUrl: ApiConsts.imageBaseUrl + (movie.posterPath ?? ''),
          errorWidget: (context, url, error) => SvgPicture.asset(Assets.brokenImage),
          placeholder: (context, url) => Container(
            color: Colors.transparent,
            width: 100.w,
            height: 146.h,
          ).redacted(context: context, redact: true),
          width: 100.w,
          height: 146.h,
          fit: BoxFit.fill,
        ),
      ),
    );
  }
}

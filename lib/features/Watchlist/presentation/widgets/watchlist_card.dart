import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';
import 'package:go_router/go_router.dart';
import 'package:movie_app/core/api/consts/api_consts.dart';
import 'package:movie_app/core/assets/assets.dart';
import 'package:movie_app/core/colors/app_colors.dart';
import 'package:movie_app/core/font/font_manager.dart';
import 'package:movie_app/core/routes/route_path.dart';
import 'package:movie_app/features/MovieDetails/presentation/widgets/movie_info/rating_pad.dart';
import 'package:movie_app/features/Watchlist/domain/entity/watchlist_entity.dart';
import 'package:redacted/redacted.dart';

class WatchlistCard extends StatelessWidget {
  const WatchlistCard({super.key, required this.movie});
  final WatchlistEntity movie;

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () => context.push(RoutePath.details, extra: movie.id),
      child: Row(
        children: [
          ClipRRect(
            borderRadius: BorderRadius.circular(16.r),
            child: CachedNetworkImage(
              imageUrl: ApiConsts.imageBaseUrl + (movie.posterPath??''),
              imageBuilder: (context, imageProvider) => ClipRRect(
                borderRadius: BorderRadius.circular(16.r),
                child: Image(
                  image: imageProvider,
                  fit: BoxFit.fill,
                  height: 120.h,
                  width: 95.w,
                ),
              ),
              errorWidget: (context, url, error) => const Icon(Icons.error),
              placeholder: (context, url) => Container(
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(16.r),
                ),
                height: 120.h,
                width: 95.w,
              ).redacted(context: context, redact: true),
              fit: BoxFit.fill,
              height: 120.h,
              width: 95.w,
            ),
          ),
          12.horizontalSpace,
          ConstrainedBox(
            constraints: BoxConstraints(
              maxWidth: MediaQuery.sizeOf(context).width - 147.w,
              minHeight: 120.h,
            ),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  movie.title??'',
                  overflow: TextOverflow.ellipsis,
                  style: FontManager.getPoppinsRegularStyle(
                    fontSize: 16.sp,
                    color: Colors.white,
                  ),
                ),

                Row(
                  children: [
                    Padding(
                      padding: const EdgeInsets.only(bottom: 2.0),
                      child: SvgPicture.asset(Assets.iconsStar),
                    ),
                    4.horizontalSpace,

                    Text(
                      formatRate(movie.voteAverage.toString()),
                      style: FontManager.montserratGetSemiBoldStyle(
                        fontSize: 12.sp,
                        color: AppColors.orange,
                      ),
                    ),
                  ],
                ),
                Row(
                  children: [
                    SvgPicture.asset(Assets.iconsTicket),
                    4.horizontalSpace,

                    Text(
                      movie.genere??'',
                      style: FontManager.getPoppinsRegularStyle(
                        fontSize: 12.sp,
                        color: Colors.white,
                      ),
                    ),
                  ],
                ),
                Row(
                  children: [
                    SvgPicture.asset(Assets.iconsCalendarBlank),
                    4.horizontalSpace,

                    Text(
                      (movie.releaseDate??'').split('-').first,
                      style: FontManager.getPoppinsRegularStyle(
                        fontSize: 12.sp,
                        color: Colors.white,
                      ),
                    ),
                  ],
                ),
                Row(
                  children: [
                    SvgPicture.asset(Assets.iconsClock),
                    4.horizontalSpace,

                    Text(
                      '${movie.runtime} minutes',
                      style: FontManager.getPoppinsRegularStyle(
                        fontSize: 12.sp,
                        color: Colors.white,
                      ),
                    ),
                  ],
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}

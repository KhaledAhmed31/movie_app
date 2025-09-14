import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:go_router/go_router.dart';

import '../../../../../core/api/consts/api_consts.dart';
import '../../../../../core/colors/app_colors.dart';
import '../../../../../core/font/font_manager.dart';
import '../../../../../core/routes/route_path.dart';

class TrendingCard extends StatelessWidget {
  const TrendingCard({super.key, required this.index, required this.imageUrl, required this.id});
  final int index;
  final int id;
  final String imageUrl;
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.symmetric(horizontal: 15.0.w),
      child: Stack(
        clipBehavior: Clip.none,
        children: [
          ClipRRect(
            borderRadius: BorderRadius.circular(16.r),
            child: GestureDetector(
              onTap: () => context.push(RoutePath.details, extra: id),
              child: CachedNetworkImage(
                imageUrl: ApiConsts.imageBaseUrl + imageUrl,
                width: 145.w,
                height: 210.h,
                fit: BoxFit.cover,
              ),
            ),
          ),
          Positioned(
            bottom: -35,
            left: -13,
            child: Stack(
              children: [
                Text(
                  index.toString(),
                  style:
                      FontManager.montserratGetSemiBoldStyle(
                        fontSize: 96.sp,
                        color: AppColors.lightBlue,
                      ).copyWith(
                        foreground: Paint()
                          ..style = PaintingStyle.stroke
                          ..strokeWidth = 1
                          ..color = AppColors.lightBlue,
                      ),
                ),
                Text(
                  index.toString(),
                  style: FontManager.montserratGetSemiBoldStyle(
                    fontSize: 96.sp,
                    color: AppColors.darkBlue,
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}

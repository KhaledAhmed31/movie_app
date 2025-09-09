import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';
import '../../../../../core/assets/assets.dart';
import '../../../../../core/colors/app_colors.dart';
import '../../../../../core/font/font_manager.dart';
import '../../../domain/entities/movie_details_entity.dart';

class ExtraInfo extends StatelessWidget {
  const ExtraInfo({super.key, required this.movie});
  final MovieDetailsEntity movie;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.only(
        top: 22.0.h,
        bottom: 32.h,
        left: 15.w,
        right: 8.w,
      ),

      child: Row(
        spacing: 5.w,
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          SvgPicture.asset(
            Assets.iconsCalendarBlank,
            colorFilter: const ColorFilter.mode(
              AppColors.lightGrey,
              BlendMode.srcIn,
            ),
          ),
          Text(
            movie.releaseDate?.split('-').first ?? '0',
            style: FontManager.montserratGetMediumStyle(
              fontSize: 12.sp,
              color: AppColors.lightGrey,
            ),
          ),
          Text(
            '|',
            style: FontManager.montserratGetMediumStyle(
              fontSize: 12.sp,
              color: AppColors.lightGrey,
            ),
          ),
          SvgPicture.asset(
            Assets.iconsClock,
            colorFilter: const ColorFilter.mode(
              AppColors.lightGrey,
              BlendMode.srcIn,
            ),
          ),
          Text(
            '${movie.runtime} min',
            style: FontManager.montserratGetMediumStyle(
              fontSize: 12.sp,
              color: AppColors.lightGrey,
            ),
          ),
          Text(
            '|',
            style: FontManager.montserratGetMediumStyle(
              fontSize: 12.sp,
              color: AppColors.lightGrey,
            ),
          ),
          SvgPicture.asset(
            Assets.iconsTicket,
            colorFilter: const ColorFilter.mode(
              AppColors.lightGrey,
              BlendMode.srcIn,
            ),
          ),
          ConstrainedBox(
            constraints: BoxConstraints(maxWidth: 180.w),
            child: Text(
              movie.genres.toString().replaceAll('[', '').replaceAll(']', ''),
              overflow: TextOverflow.ellipsis,
              style: FontManager.montserratGetMediumStyle(
                fontSize: 12.sp,
                color: AppColors.lightGrey,
              ),
            ),
          ),
        ],
      ),
    );
  }
}

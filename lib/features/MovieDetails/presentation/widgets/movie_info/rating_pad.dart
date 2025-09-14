import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';

import '../../../../../core/assets/assets.dart';
import '../../../../../core/colors/app_colors.dart';
import '../../../../../core/font/font_manager.dart';

class RatingPad extends StatelessWidget {
  const RatingPad({super.key, required this.rating});
  final double rating;
  @override
  Widget build(BuildContext context) {
    return Container(
      height: 24.h,
      padding: EdgeInsets.symmetric(horizontal: 8.w),
      decoration: BoxDecoration(
        color: AppColors.bured,
        borderRadius: BorderRadius.circular(10.r),
      ),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.center,

        children: [
          SvgPicture.asset(
            Assets.iconsStar,
            colorFilter: const ColorFilter.mode(
              AppColors.orange,
              BlendMode.srcIn,
            ),
          ),
          Padding(
            padding: const EdgeInsets.only(top: 2.0, left: 4),
            child: Text(
              formatRate(rating.toString()),

              style: FontManager.montserratGetSemiBoldStyle(
                fontSize: 12.sp,
                color: AppColors.orange,
              ),
            ),
          ),
        ],
      ),
    );
  }
}

String formatRate(String rate) {
  if (rate.length == 3 && rate[2] == "0") return rate.split(".").first;
  int indexPoint = rate.indexOf(".");
  String fraction = "";
  for (int i = indexPoint; (i <= indexPoint + 2) && (i < rate.length); i++) {
    if (rate[i] == "0") {
      break;
    }
    fraction += rate[i];
  }
  return (rate.split(".").first) + (fraction.length > 1 ? fraction : '');
}

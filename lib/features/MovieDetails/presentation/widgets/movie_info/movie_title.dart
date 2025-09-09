import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import '../../../../../core/font/font_manager.dart';

class MovieTitle extends StatelessWidget {
  const MovieTitle({super.key, this.title});
  final String? title;
  @override
  Widget build(BuildContext context) {
    return ConstrainedBox(
      constraints: BoxConstraints(
        maxWidth: MediaQuery.sizeOf(context).width - 125.w,
      ),
      child: Text(
        title ?? '',
        maxLines: 2,
        overflow: TextOverflow.ellipsis,
        textAlign: TextAlign.start,
        style: FontManager.getPoppinsSemiBoldStyle(
          fontSize: 18.sp,
          color: Colors.white,
        ),
      ),
    );
  }
}

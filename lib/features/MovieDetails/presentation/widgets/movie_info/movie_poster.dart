import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:movie_app/core/api/consts/api_consts.dart';
import 'package:redacted/redacted.dart';

class MoviePoster extends StatelessWidget {
  const MoviePoster({super.key, required this.imageUrl});
  final String imageUrl;
  @override
  Widget build(BuildContext context) {
    return CachedNetworkImage(
      imageUrl: ApiConsts.imageBaseUrl + imageUrl,
      imageBuilder: (context, imageProvider) => ClipRRect(
        borderRadius: BorderRadius.circular(16.r),
        child: Image(image: imageProvider, fit: BoxFit.fill),
      ),
      errorWidget: (context, url, error) => const Icon(Icons.error),
      placeholder: (context, url) => Container(
        decoration: BoxDecoration(borderRadius: BorderRadius.circular(16.r)),
        height: 120.h,
        width: 95.w,
      ).redacted(context: context, redact: true),
      fit: BoxFit.fill,
      height: 120.h,
      width: 95.w,
    );
  }
}

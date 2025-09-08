import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:movie_app/core/api/consts/api_consts.dart';
import 'package:movie_app/features/MovieDetails/presentation/widgets/movie_info/rating_pad.dart';
import 'package:redacted/redacted.dart';

class MovieBackPoster extends StatelessWidget {
  const MovieBackPoster({super.key, required this.pics, required this.rating});
  final List<String> pics;
  final double rating;
  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        SizedBox(
          height: 210.h,
          child: PageView.builder(
            itemCount: pics.length,
            itemBuilder: (context, index) => CachedNetworkImage(
              imageBuilder: (context, imageProvider) => ClipRRect(
                borderRadius: BorderRadius.circular(10.r),
                child: Image(image: imageProvider, fit: BoxFit.cover),
              ),
              imageUrl: ApiConsts.imageBaseUrl + (pics[index]),
              errorWidget: (context, url, error) => const Icon(Icons.error),
              placeholder: (context, url) => Container(
                color: Colors.transparent,
                width: double.infinity,
                height: 210.h,
              ).redacted(context: context, redact: true),
              fit: BoxFit.contain,
            ),
          ),
        ),
        Positioned(
          bottom: 9.h,
          right: 11.w,
          child: RatingPad(rating: rating),
        ),
      ],
    );
  }
}

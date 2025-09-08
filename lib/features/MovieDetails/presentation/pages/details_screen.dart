import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:go_router/go_router.dart';
import 'package:movie_app/core/colors/app_colors.dart';
import 'package:movie_app/core/di/dependency_injection.dart';
import 'package:movie_app/core/font/font_manager.dart';
import 'package:movie_app/features/MovieDetails/presentation/cubit/moviedetails_bloc.dart';
import 'package:movie_app/features/MovieDetails/presentation/cubit/moviedetails_state.dart';
import 'package:movie_app/features/MovieDetails/presentation/widgets/add_to_watchlist_button.dart';
import 'package:movie_app/features/MovieDetails/presentation/widgets/movie_info/datails_taps.dart';
import 'package:movie_app/features/MovieDetails/presentation/widgets/movie_info/movie_info.dart';
import 'package:pull_to_refresh_flutter3/pull_to_refresh_flutter3.dart';

class DetailsScreen extends StatefulWidget {
  const DetailsScreen({super.key, required this.movieId});
  final int movieId;
  @override
  State<DetailsScreen> createState() => _DetailsScreenState();
}

class _DetailsScreenState extends State<DetailsScreen>
    with SingleTickerProviderStateMixin {
  bool isWished = false;
  late final AnimationController _controller;
  late final RefreshController refreshController;

  @override
  void initState() {
    _controller = AnimationController(
      duration: const Duration(milliseconds: 1500),
      reverseDuration: const Duration(milliseconds: 1200),
      vsync: this,
    );
    refreshController = RefreshController(initialRefresh: false);
    super.initState();
  }

  @override
  void dispose() {
    _controller.dispose();
    refreshController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return BlocProvider<MoviedetailsCubit>.value(
      value: getIt.get<MoviedetailsCubit>()..getMovieDetails(widget.movieId),
      child: BlocBuilder<MoviedetailsCubit, MovieDetailsState>(
        builder: (context, state) {
          if (state is MoviedetailsLoadingState) {
            return const Scaffold(
              body: Center(
                child: CircularProgressIndicator(color: AppColors.lightBlue),
              ),
            );
          } else if (state is MoviedetailsLoadedState) {
            return Scaffold(
              appBar: AppBar(
                toolbarHeight: 70.h,
                leading: IconButton(
                  onPressed: () => context.pop(),
                  icon: Icon(Icons.arrow_back_ios, size: 20.sp),
                ),
                leadingWidth: 70.w,
                actions: [
                  AddToWatchlistButton(movie: state.movieDetailsEntity),
                ],
                actionsPadding: EdgeInsets.symmetric(horizontal: 15.w),
              ),
              body: Column(
                children: [
                  MovieInfo(movie: state.movieDetailsEntity),
                  Expanded(child: DetailsTabs(movie: state.movieDetailsEntity)),
                ],
              ),
            );
          } else if (state is MoviedetailsErrorState) {
            return Scaffold(
              body: SmartRefresher(
                controller: refreshController,
                enablePullDown: true,
                header: const WaterDropHeader(),
                onRefresh: () => getIt.get<MoviedetailsCubit>().getMovieDetails(
                  widget.movieId,
                ),
                child: Center(
                  child: Text(
                    state.message,
                    style: FontManager.getPoppinsMediumStyle(
                      color: AppColors.lightBlue,
                      fontSize: 15.sp,
                    ),
                  ),
                ),
              ),
            );
          } else {
            return const SizedBox();
          }
        },
      ),
    );
  }
}

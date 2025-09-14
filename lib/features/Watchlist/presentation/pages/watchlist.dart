import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:pull_to_refresh_flutter3/pull_to_refresh_flutter3.dart'
    hide RefreshIndicator;

import '../../../../core/colors/app_colors.dart';
import '../../../../core/di/dependency_injection.dart';
import '../../../../core/font/font_manager.dart';
import '../cubit/watchlist_cubit.dart';
import '../cubit/watchlist_state.dart';
import '../widgets/watchlist_card.dart';

class Watchlist extends StatefulWidget {
  const Watchlist({super.key});

  @override
  State<Watchlist> createState() => _WatchlistState();
}

class _WatchlistState extends State<Watchlist>
    with AutomaticKeepAliveClientMixin {
  final cubit = getIt.get<WatchlistCubit>();
  late RefreshController refreshController;

  @override
  void initState() {
    super.initState();
    refreshController = RefreshController(initialRefresh: false);
  }

  @override
  void dispose() {
    refreshController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    super.build(context);
    cubit.getWatchlist();

    return BlocBuilder<WatchlistCubit, WatchlistState>(
      builder: (BuildContext context, WatchlistState state) {
        if (state is WatchlistLoadingState) {
          return const Center(
            child: CircularProgressIndicator(color: AppColors.lightBlue),
          );
        } else if (state is WatchlistLoadedState) {
          final movies = cubit.movies;
          return SafeArea(
            child: SmartRefresher(
              controller: refreshController,
              enablePullDown: true,
              onRefresh: () async {
                log("refresh");
                cubit.getWatchlist();
                refreshController.refreshCompleted();
              },

              header: const WaterDropHeader(),

              child: ListView.builder(
                physics: const AlwaysScrollableScrollPhysics(),
                itemCount: movies.length,
                itemBuilder: (context, index) => Padding(
                  padding: EdgeInsets.symmetric(
                    vertical: 8.0.h,
                    horizontal: 20.w,
                  ),
                  child: WatchlistCard(movie: movies[index]),
                ),
              ),
            ),
          );
        } else if (state is WatchlistErrorState) {
          return SmartRefresher(
            controller: refreshController,
            enablePullDown: true,
            header: const WaterDropHeader(),

            onRefresh: () async {
              log("refresh");
              cubit.getWatchlist();
              refreshController.refreshCompleted();
            },
            child: Column(
              children: [
                Center(
                  child: Text(
                    state.message,
                    style: FontManager.getPoppinsMediumStyle(
                      fontSize: 16.sp,
                      color: Colors.white,
                    ),
                  ),
                ),
              ],
            ),
          );
        } else {
          return const SizedBox();
        }
      },
    );
  }

  @override
  bool get wantKeepAlive => true;
}

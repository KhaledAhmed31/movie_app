import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';
import 'package:movie_app/features/Home/presentation/widgets/section_movie_card.dart';
import '../../../../core/assets/assets.dart';
import '../../../../core/colors/app_colors.dart';
import '../../../../core/di/dependency_injection.dart';
import '../../../../core/font/font_manager.dart';
import '../cubit/search_cubit.dart';
import '../cubit/search_state.dart';

class SearchResultList extends StatefulWidget {
  const SearchResultList({super.key});

  @override
  State<SearchResultList> createState() => _SearchResultListState();
}

class _SearchResultListState extends State<SearchResultList> {
  late SearchCubit cubit;

  @override
  void initState() {
    super.initState();
    cubit = getIt.get<SearchCubit>();
  }

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<SearchCubit, SearchState>(
      buildWhen: (previous, current) => previous != current && current is! SearchGetMoreLoadingState,
      builder: (context, state) {
        if (state is SearchLoadingState) {
          return SliverToBoxAdapter(
            child: Column(
              children: [
                SizedBox(height: (MediaQuery.sizeOf(context).height / 3).h),
                const Center(
                  child: CircularProgressIndicator(color: AppColors.lightBlue),
                ),
              ],
            ),
          );
        } else if (state is SearchLoadedState) {
          final movies = cubit.movies;
          if (movies.isEmpty) {
            return SliverToBoxAdapter(
              child: Center(
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    SizedBox(height: (MediaQuery.sizeOf(context).height / 4).h),
                    SvgPicture.asset(Assets.notFound),
                    Text(
                      "No result found",
                      style: FontManager.getPoppinsRegularStyle(
                        fontSize: 13.sp,
                        color: const Color.fromARGB(157, 255, 255, 255),
                      ),
                    ),
                  ],
                ),
              ),
            );
          }
          return SliverGrid.builder(
            gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
              mainAxisExtent: 220.h,
              crossAxisSpacing: 18.w,
              mainAxisSpacing: 18.w,
              crossAxisCount: 2,
            ),
            itemBuilder: (context, index) {
              return SectionMovieCard(movie: movies[index]);
            },
            addAutomaticKeepAlives: true,
            itemCount: movies.length,
          );
        } else if (state is SearchErrorState) {
          return SliverToBoxAdapter(
            child: Column(
              children: [
                SizedBox(height: (MediaQuery.sizeOf(context).height / 4).h),
                Center(child: Text(state.message)),
              ],
            ),
          );
        } else {
          return const SliverToBoxAdapter(child: SizedBox());
        }
      },
    );
  }
}

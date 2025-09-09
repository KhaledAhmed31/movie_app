import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';
import '../../../../core/assets/assets.dart';
import '../../../../core/colors/app_colors.dart';
import '../../../../core/di/dependency_injection.dart';
import '../../../../core/font/font_manager.dart';
import '../../../Home/presentation/widgets/movies_grid.dart';
import '../../../Home/presentation/widgets/page_indecator.dart';
import '../cubit/search_cubit.dart';
import '../cubit/search_state.dart';

class SearchResultList extends StatelessWidget {
  const SearchResultList({super.key, required this.controller});
  final TextEditingController controller;
  @override
  Widget build(BuildContext context) {
    final cubit = getIt.get<SearchCubit>();
    return BlocBuilder<SearchCubit, SearchState>(
      builder: (context, state) {
        if (state is SearchLoadingState) {
          return  Column(
            children: [
              SizedBox(height: (MediaQuery.sizeOf(context).height/3).h,),
             const Center(
                child: CircularProgressIndicator(color: AppColors.lightBlue),
              ),
            ],
          );
        } else if (state is SearchLoadedState) {
          final movies = cubit.movies;
          if (movies.isEmpty) {
            return Center(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  SizedBox(height: (MediaQuery.sizeOf(context).height/4).h,),
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
            );
          }
          return Expanded(
            child: SingleChildScrollView(
              child: Column(
                children: [
                  MoviesGrid(
                    movies: movies,
                    crossAxisSpacing: 18.w,
                    mainAxisSpacing: 18.h,
                    mainAxisExtent: 220.h,
                    maxCrossAxisExtent: 2,
                  ),
                  PageIndecator(
                    onTap: (index) =>
                        cubit.searchMovies(query: controller.text, page: index),
                    pageCount: cubit.totalPages,
                    selectedPage: cubit.currentPage,
                  ),
                ],
              ),
            ),
          );
        } else if (state is SearchErrorState) {
          return Column(
            children: [
              SizedBox(height: (MediaQuery.sizeOf(context).height/4).h,),
              Center(child: Text(state.message)),
            ],
          );
        } else {
          return const SizedBox();
        }
      },
    );
  }
}

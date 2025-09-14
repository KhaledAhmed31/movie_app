
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../../../core/colors/app_colors.dart';
import '../../../../core/di/dependency_injection.dart';
import '../../../Home/presentation/widgets/custom_search_bar.dart';
import '../cubit/search_cubit.dart';
import '../cubit/search_state.dart';
import '../widgets/search_result_list.dart';

class Search extends StatefulWidget {
  const Search({super.key});

  @override
  State<Search> createState() => _SearchState();
}

class _SearchState extends State<Search> with AutomaticKeepAliveClientMixin {
  late TextEditingController textController;
  late final ScrollController _controller;
  final cubit = getIt.get<SearchCubit>();
  @override
  void initState() {
    super.initState();
    textController = TextEditingController();
    _controller = ScrollController();
    _controller.addListener(_scrollListener);
  }

  @override
  void dispose() {
    textController.dispose();
    _controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    super.build(context);
    return BlocProvider<SearchCubit>(
      create: (context) => getIt.get<SearchCubit>(),
      child: Padding(
        padding: EdgeInsets.symmetric(horizontal: 15.0.w),
        child: SafeArea(
          child: CustomScrollView(
            controller: _controller,
            slivers: [
              SliverToBoxAdapter(child: SizedBox(height: 5.h)),
              SliverAppBar(
                floating: true,
                automaticallyImplyLeading: true,
                titleSpacing: 0,
                toolbarHeight: 60,
                backgroundColor: Colors.transparent,
                title: CustomSearchBar(controller: textController),
              ),
              const SliverToBoxAdapter(child: SizedBox(height: 10)),
              const SearchResultList(),
              BlocBuilder<SearchCubit, SearchState>(
                    builder: (context, state) {
                      if (state is SearchGetMoreLoadingState) {
                        return const SliverToBoxAdapter(
                          child: SizedBox(
                            height: 30,
                            width: 30,
                            child: Center(
                              child: CircularProgressIndicator(
                                color: AppColors.lightBlue,
                              ),
                            ),
                          ),
                        );
                      }
                      return const SliverToBoxAdapter(child: SizedBox(height: 40,));
                    },
                  )
            ],
          ),
        ),
      ),
    );
  }

  void _scrollListener() {
    if (_controller.position.pixels == _controller.position.maxScrollExtent) {
      _loadMoreItems();
    }
  }

  void _loadMoreItems() async {
    await cubit.loadMoreMovies(query: textController.text);
  }

  @override
  bool get wantKeepAlive => true;
}

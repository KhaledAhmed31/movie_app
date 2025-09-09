import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import '../../../../core/di/dependency_injection.dart';
import '../../../Home/presentation/widgets/custom_search_bar.dart';
import '../cubit/search_cubit.dart';
import '../widgets/search_result_list.dart';

class Search extends StatefulWidget {
  const Search({super.key});

  @override
  State<Search> createState() => _SearchState();
}

class _SearchState extends State<Search> with AutomaticKeepAliveClientMixin {
  late TextEditingController controller;
  @override
  void initState() {
    controller = TextEditingController();
    super.initState();
  }

  @override
  void dispose() {
    controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    super.build(context);
    return BlocProvider<SearchCubit>(
      create: (context) => getIt.get<SearchCubit>(),
      child: Padding(
        padding: EdgeInsets.symmetric(horizontal: 15.0.w, vertical: 18.h),
        child: SafeArea(
          child: Column(
            children: [
              CustomSearchBar(pageController: null, controller: controller),
              const SizedBox(height: 20),
               SearchResultList(controller: controller,),
            ],
          ),
        ),
      ),
    );
  }

  @override
  bool get wantKeepAlive => true;
}

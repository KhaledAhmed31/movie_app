import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_offline/flutter_offline.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';

import '../../../../core/assets/assets.dart';
import '../../../Home/presentation/pages/home.dart';
import '../../../Search/presentation/pages/search.dart';
import '../../../Watchlist/presentation/pages/watchlist.dart';
import '../widgets/custom_nav_bar.dart';

class MainLayout extends StatefulWidget {
  const MainLayout({super.key});

  @override
  State<MainLayout> createState() => _MainLayoutState();
}

class _MainLayoutState extends State<MainLayout> {
  int currentIndex = 0;
  late PageController pageController;
  late List<Widget> pages;
  @override
  void initState() {
    super.initState();

    pageController = PageController(initialPage: currentIndex);
    pages = [
      Home(pageController: pageController),
      const Search(),
      const Watchlist(),
    ];
  }

  @override
  void dispose() {
    pageController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return AnnotatedRegion<SystemUiOverlayStyle>(
      value: SystemUiOverlayStyle.light,
      child: SafeArea( 
        child: Scaffold(
          body: OfflineBuilder(
            connectivityBuilder: (context, value, child) {
              bool connected = !value.contains(ConnectivityResult.none);
              if (connected) { 
                return child;
              } else {
                return Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [SizedBox(
                      height: 300,
                      child: SvgPicture.asset(Assets.noInternet))
                  ,16.verticalSpace
                  ,const Text("No Internet Connection.... try reconnect",style: TextStyle(color: Colors.white),)
                  ],
                );
              }
            },
            child: PageView(
              controller: pageController,
              onPageChanged: (value) => setState(() => currentIndex = value),
              children: pages,
            ),
          ),
          bottomNavigationBar: CustomNavBar(
            currentIndex: currentIndex,
            onTap: (index) {
              pageController.animateToPage(
                index,
                duration: const Duration(milliseconds: 300),
                curve: Curves.easeInOut,
              );
            },
          ),
        ),
      ),
    );
  }
}

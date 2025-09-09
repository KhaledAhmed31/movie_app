import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import '../../../Home/presentation/pages/home.dart';
import '../widgets/custom_nav_bar.dart';
import '../../../Search/presentation/pages/search.dart';
import '../../../Watchlist/presentation/pages/watchlist.dart';

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
      child: Scaffold(
        body: PageView(
          controller: pageController,
          onPageChanged: (value) => setState(() => currentIndex = value),
          children: pages,
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
    );
  }
}

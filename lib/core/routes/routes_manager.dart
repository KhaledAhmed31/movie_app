import 'package:flutter/cupertino.dart';
import 'package:go_router/go_router.dart';
import 'route_path.dart';
import '../../features/MainLayout/presentation/pages/main_layout.dart';
import '../../features/MovieDetails/presentation/pages/details_screen.dart';

GoRouter router = GoRouter(
  initialLocation: RoutePath.mainLayout,
  routes: [
    GoRoute(
      path: RoutePath.mainLayout,
      builder: (context, state) => const MainLayout(),
    ),
    GoRoute(
      path: RoutePath.details,
      pageBuilder: (context, state) => CustomTransitionPage(
        child: DetailsScreen(movieId: state.extra as int),
        transitionsBuilder: (context, animation, secondaryAnimation, child) =>
            SlideTransition(
              position: animation.drive(
                Tween(begin: const Offset(1.0, 0.0), end: Offset.zero),
              ),
              child: child,
            ),
        transitionDuration: const Duration(milliseconds: 300),
        reverseTransitionDuration: const Duration(milliseconds: 300),
      ),
    ),
  ],
);

import 'package:flutter/material.dart';
import 'route_path.dart';
import '../../features/MainLayout/presentation/pages/main_layout.dart';
import '../../features/MovieDetails/presentation/pages/details_screen.dart';

class RouteGenerator {
  Route generateRoute(RouteSettings settings) {
    switch (settings.name) {

      case RoutePath.mainLayout:
        return MaterialPageRoute(builder: (_) => const MainLayout());
      case RoutePath.details:
        return MaterialPageRoute(builder: (_) =>  DetailsScreen(movieId: settings.arguments as int,)); 
      default:
        return MaterialPageRoute(builder: (_) => Container());
    }
  }
}

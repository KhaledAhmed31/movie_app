import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:movie_app/core/di/dependency_injection.dart';
import 'package:movie_app/core/routes/routes_manager.dart';
import 'package:movie_app/core/theme/app_theme.dart';
import 'package:movie_app/features/Watchlist/presentation/cubit/watchlist_cubit.dart';
import 'package:movie_app/firebase_options.dart';

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(options: DefaultFirebaseOptions.currentPlatform);

  await configureDependencies();
  runApp(const MainApp());
}

class MainApp extends StatelessWidget {
  const MainApp({super.key});

  @override
  Widget build(BuildContext context) {
    return ScreenUtilInit(
      designSize: const Size(375, 812),
      minTextAdapt: true,
      splitScreenMode: true,
      builder: (_, _) {
        return BlocProvider(
          create: (context) => getIt.get<WatchlistCubit>(),
          child: MaterialApp.router(
            debugShowCheckedModeBanner: false,
            title: 'Movie App',
            // You can use the library anywhere in the app even in theme
            theme: AppTheme.lightTheme,
            routerConfig: router,
          ),
        );
      },
    );
  }
}

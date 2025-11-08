import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:movie_app/features/Home/presentation/cubits/trending_cubit/trending_cubit.dart';

import 'core/di/dependency_injection.dart';
import 'core/routes/routes_manager.dart';
import 'core/theme/app_theme.dart';
import 'features/Watchlist/presentation/cubit/watchlist_cubit.dart';
import 'firebase_options.dart';

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  Bloc.observer = MyBlocObserver();
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
            title: 'Film Flix',
            // You can use the library anywhere in the app even in theme
            theme: AppTheme.lightTheme,
            routerConfig: router,
          ),
        );
      },
    );
  }
}

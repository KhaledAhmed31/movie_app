// dart format width=80
// GENERATED CODE - DO NOT MODIFY BY HAND

// **************************************************************************
// InjectableConfigGenerator
// **************************************************************************

// ignore_for_file: type=lint
// coverage:ignore-file

// ignore_for_file: no_leading_underscores_for_library_prefixes
import 'package:dio/dio.dart' as _i361;
import 'package:get_it/get_it.dart' as _i174;
import 'package:injectable/injectable.dart' as _i526;
import 'package:movie_app/core/di/module.dart' as _i391;
import 'package:movie_app/features/Home/data/datasources/now_playing_date_source.dart'
    as _i368;
import 'package:movie_app/features/Home/data/datasources/popular_data_source.dart'
    as _i223;
import 'package:movie_app/features/Home/data/datasources/top_rated_date_source.dart'
    as _i622;
import 'package:movie_app/features/Home/data/datasources/trending_date_source.dart'
    as _i464;
import 'package:movie_app/features/Home/data/datasources/up_coming_date_source.dart'
    as _i149;
import 'package:movie_app/features/Home/data/repositories/movies_section_repo.dart'
    as _i1056;
import 'package:movie_app/features/Home/domain/repositories/movies_sections_repo_interface.dart'
    as _i413;
import 'package:movie_app/features/Home/domain/usecases/get_now_playing_use_case.dart'
    as _i123;
import 'package:movie_app/features/Home/domain/usecases/get_popular_use_case.dart'
    as _i377;
import 'package:movie_app/features/Home/domain/usecases/get_top_rated_use_case.dart'
    as _i526;
import 'package:movie_app/features/Home/domain/usecases/get_trending_use_case.dart'
    as _i1044;
import 'package:movie_app/features/Home/domain/usecases/get_up_coming_use_case.dart'
    as _i998;
import 'package:movie_app/features/Home/presentation/cubits/now_playing_cubit/now_playing_cubit.dart'
    as _i999;
import 'package:movie_app/features/Home/presentation/cubits/popular_cubit/popular_cubit.dart'
    as _i781;
import 'package:movie_app/features/Home/presentation/cubits/top_rated_cubit/top_rated_cubit.dart'
    as _i993;
import 'package:movie_app/features/Home/presentation/cubits/trending_cubit/trending_cubit.dart'
    as _i174;
import 'package:movie_app/features/Home/presentation/cubits/up_coming/up_coming_cubit.dart'
    as _i3;
import 'package:movie_app/features/MovieDetails/data/datasources/movie_details_data_source.dart'
    as _i928;
import 'package:movie_app/features/MovieDetails/data/repositories/movie_details_repo.dart'
    as _i292;
import 'package:movie_app/features/MovieDetails/domain/repositories/movie_details_repo_inerface.dart'
    as _i535;
import 'package:movie_app/features/MovieDetails/domain/usecases/get_movie_details_use_case.dart'
    as _i492;
import 'package:movie_app/features/MovieDetails/presentation/cubit/moviedetails_bloc.dart'
    as _i383;
import 'package:movie_app/features/Search/data/datasources/search_data_source.dart'
    as _i616;
import 'package:movie_app/features/Search/data/repositories/search_repo.dart'
    as _i207;
import 'package:movie_app/features/Search/domain/repositories/search_repo_interface.dart'
    as _i1070;
import 'package:movie_app/features/Search/domain/usecases/search_use_case.dart'
    as _i336;
import 'package:movie_app/features/Search/presentation/cubit/search_cubit.dart'
    as _i851;
import 'package:movie_app/features/Watchlist/data/datasources/local_date_source.dart'
    as _i613;
import 'package:movie_app/features/Watchlist/data/datasources/watchlist_data_source.dart'
    as _i626;
import 'package:movie_app/features/Watchlist/data/repositories/watchlist_repo.dart'
    as _i602;
import 'package:movie_app/features/Watchlist/presentation/cubit/watchlist_cubit.dart'
    as _i77;
import 'package:shared_preferences/shared_preferences.dart' as _i460;

extension GetItInjectableX on _i174.GetIt {
  // initializes the registration of main-scope dependencies inside of GetIt
  Future<_i174.GetIt> init({
    String? environment,
    _i526.EnvironmentFilter? environmentFilter,
  }) async {
    final gh = _i526.GetItHelper(this, environment, environmentFilter);
    final registerModule = _$RegisterModule();
    await gh.factoryAsync<_i460.SharedPreferences>(
      () => registerModule.sharedPreferences,
      preResolve: true,
    );
    gh.singleton<_i626.WatchlistDataSource>(() => _i626.WatchlistDataSource());
    gh.lazySingleton<_i361.Dio>(() => registerModule.dio());
    gh.singleton<_i928.MovieDetailsDataSource>(
      () => _i928.MovieDetailsDataSource(gh<_i361.Dio>()),
    );
    gh.lazySingleton<_i368.NowPlayingDateSource>(
      () => _i368.NowPlayingDateSource(gh<_i361.Dio>()),
    );
    gh.lazySingleton<_i223.PopularDataSource>(
      () => _i223.PopularDataSource(gh<_i361.Dio>()),
    );
    gh.lazySingleton<_i622.TopRatedDateSource>(
      () => _i622.TopRatedDateSource(gh<_i361.Dio>()),
    );
    gh.lazySingleton<_i464.TrendingDateSource>(
      () => _i464.TrendingDateSource(gh<_i361.Dio>()),
    );
    gh.lazySingleton<_i149.UpComingDateSource>(
      () => _i149.UpComingDateSource(gh<_i361.Dio>()),
    );
    gh.lazySingleton<_i616.SearchDataSource>(
      () => _i616.SearchDataSource(gh<_i361.Dio>()),
    );
    gh.lazySingleton<_i413.MoviesSectionsRepoInterface>(
      () => const _i1056.MoviesSectionRepo(),
    );
    gh.singleton<_i613.LocalDateSource>(
      () => _i613.LocalDateSource(gh<_i460.SharedPreferences>()),
    );
    gh.lazySingleton<_i535.MovieDetailsRepoInterface>(
      () => _i292.MovieDetailsRepo(gh<_i928.MovieDetailsDataSource>()),
    );
    gh.singleton<_i492.GetMovieDetailsUseCase>(
      () => _i492.GetMovieDetailsUseCase(
        movieDetailsRepoInterface: gh<_i535.MovieDetailsRepoInterface>(),
      ),
    );
    gh.lazySingleton<_i123.GetNowPlayingUseCase>(
      () => _i123.GetNowPlayingUseCase(gh<_i413.MoviesSectionsRepoInterface>()),
    );
    gh.lazySingleton<_i377.GetPopularUseCase>(
      () => _i377.GetPopularUseCase(gh<_i413.MoviesSectionsRepoInterface>()),
    );
    gh.lazySingleton<_i526.GetTopRatedUseCase>(
      () => _i526.GetTopRatedUseCase(gh<_i413.MoviesSectionsRepoInterface>()),
    );
    gh.lazySingleton<_i1044.GetTrendingUseCase>(
      () => _i1044.GetTrendingUseCase(gh<_i413.MoviesSectionsRepoInterface>()),
    );
    gh.lazySingleton<_i998.GetUpComingUseCase>(
      () => _i998.GetUpComingUseCase(gh<_i413.MoviesSectionsRepoInterface>()),
    );
    gh.singleton<_i602.WatchlistRepo>(
      () => _i602.WatchlistRepo(gh<_i626.WatchlistDataSource>()),
    );
    gh.lazySingleton<_i174.TrendingCubit>(
      () => _i174.TrendingCubit(gh<_i1044.GetTrendingUseCase>()),
    );
    gh.lazySingleton<_i3.UpComingCubit>(
      () => _i3.UpComingCubit(gh<_i998.GetUpComingUseCase>()),
    );
    gh.singleton<_i77.WatchlistCubit>(
      () => _i77.WatchlistCubit(gh<_i602.WatchlistRepo>()),
    );
    gh.lazySingleton<_i1070.SearchRepoInterface>(
      () => _i207.SearchRepo(gh<_i616.SearchDataSource>()),
    );
    gh.lazySingleton<_i383.MoviedetailsCubit>(
      () => _i383.MoviedetailsCubit(gh<_i492.GetMovieDetailsUseCase>()),
    );
    gh.lazySingleton<_i999.NowPlayingCubit>(
      () => _i999.NowPlayingCubit(gh<_i123.GetNowPlayingUseCase>()),
    );
    gh.lazySingleton<_i993.TopRatedCubit>(
      () => _i993.TopRatedCubit(gh<_i526.GetTopRatedUseCase>()),
    );
    gh.lazySingleton<_i336.SearchUseCase>(
      () => _i336.SearchUseCase(gh<_i1070.SearchRepoInterface>()),
    );
    gh.lazySingleton<_i851.SearchCubit>(
      () => _i851.SearchCubit(gh<_i1070.SearchRepoInterface>()),
    );
    gh.lazySingleton<_i781.PopularCubit>(
      () => _i781.PopularCubit(gh<_i377.GetPopularUseCase>()),
    );
    return this;
  }
}

class _$RegisterModule extends _i391.RegisterModule {}

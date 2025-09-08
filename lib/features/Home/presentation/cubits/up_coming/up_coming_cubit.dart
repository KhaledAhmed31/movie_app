import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:injectable/injectable.dart';
import 'package:movie_app/features/Home/domain/entities/section_movies_entity.dart';
import 'package:movie_app/features/Home/domain/usecases/get_up_coming_use_case.dart';
import 'package:movie_app/features/Home/presentation/cubits/up_coming/up_coming_states.dart';
@lazySingleton
class UpComingCubit extends Cubit<UpComingStates>{
  final GetUpComingUseCase _upComingDateSource;
  List<SectionsMovieEntity> upComingMovies=[];
  int currentPage=1;
  int totalPages=1;
  UpComingCubit(this._upComingDateSource):super(UpComingInitialState()){
    getUpComingMovies();
  }

 Future<void>  getUpComingMovies([int page = 1])async{
    emit(UpComingLoadingState());
    final (failure,result) = await _upComingDateSource(page);
    if(failure!=null){
      emit(UpComingErrorState(message: failure.message));
    }else{
      currentPage=page;
      totalPages=result?.totalPages??1;
      upComingMovies = result?.results??[];
      emit(UpComingLoadedState());
    }
  }
}
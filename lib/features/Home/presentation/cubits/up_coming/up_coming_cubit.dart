import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:injectable/injectable.dart';

import '../../../domain/entities/section_movies_entity.dart';
import '../../../domain/usecases/get_up_coming_use_case.dart';
import 'up_coming_states.dart';
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
import 'package:bloc/bloc.dart';
import 'package:injectable/injectable.dart';
import '../../domain/usecases/get_movie_details_use_case.dart';
import 'moviedetails_state.dart';
@lazySingleton
class MoviedetailsCubit extends Cubit<MovieDetailsState> {
  final GetMovieDetailsUseCase _getMovieDetailsUseCase;
  MoviedetailsCubit(this._getMovieDetailsUseCase) : super(MoviedetailsInitialState());
  Future<void> getMovieDetails(int movieId)async{
    emit(MoviedetailsLoadingState());
    final (failure,result) = await _getMovieDetailsUseCase.call(movieId);
    if(failure!=null){
      emit(MoviedetailsErrorState( failure.message));
    }else{
      emit(MoviedetailsLoadedState(movieDetailsEntity:result!));
    }}

}


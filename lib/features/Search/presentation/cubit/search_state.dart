
import 'package:equatable/equatable.dart';

abstract class SearchState extends Equatable{}

class SearchInitialStete extends SearchState {
  @override
  List<Object?> get props => [];
}
class SearchLoadedState extends SearchState {
  @override
  List<Object?> get props => [];
}
class SearchLoadingState extends SearchState {
  @override
  List<Object?> get props => [];
}
class SearchGetMoreLoadingState extends SearchState {
  @override
  List<Object?> get props => [];
}
class SearchErrorState extends SearchState {
  final String message;
  SearchErrorState(this.message);
  
  @override
  List<Object?> get props => [message];
}


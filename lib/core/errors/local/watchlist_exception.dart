import '../app_exception.dart';

class WatchlistException extends AppException{
  WatchlistException({String message="could not load movies"}) : super(message);
}
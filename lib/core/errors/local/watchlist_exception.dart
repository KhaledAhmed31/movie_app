import 'package:movie_app/core/errors/app_exception.dart';

class WatchlistException extends AppException{
  WatchlistException({String message="could not load movies"}) : super(message);
}
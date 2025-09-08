import 'package:movie_app/core/errors/app_exception.dart';

class MovieDetailsException extends AppException{
  const MovieDetailsException():super("Failed to get movie details");
}
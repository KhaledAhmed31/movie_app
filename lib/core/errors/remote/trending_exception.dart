import 'package:movie_app/core/errors/app_exception.dart';

class TrendingException extends AppException{
  const TrendingException():super("Failed to load trending movies");
}
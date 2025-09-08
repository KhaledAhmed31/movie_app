import 'package:movie_app/core/errors/app_exception.dart';

class NowPlayingException extends AppException{
  const NowPlayingException():super("Failed to load now playing movies");
}
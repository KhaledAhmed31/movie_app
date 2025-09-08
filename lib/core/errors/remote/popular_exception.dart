import 'package:movie_app/core/errors/app_exception.dart';

class PopularException extends AppException{
const  PopularException():super("Failed to load popular movies");
}
import 'package:movie_app/core/errors/app_exception.dart';

class UpComingException extends AppException{
const  UpComingException():super("Failed to load upcoming movies");
}
import '../app_exception.dart';

class TopRatedException extends AppException{
const  TopRatedException() : super("Failed to load top rated movies");
}